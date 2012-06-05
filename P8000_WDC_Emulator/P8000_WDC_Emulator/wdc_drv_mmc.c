/*
 * P8000 WDC Emulator
 *
 * $Id: wdc_drv_mmc.c,v 1.5 2012/06/05 18:24:16 olivleh1 Exp $
 *
 */

#include <avr/io.h>
#include "config.h"
#include "mmc.h"

#define wait_till_send_done() while ( ! ( SPSR & ( 1 << SPIF ) ) )
#define wait_till_card_ready() do { send_dummy_byte(); } while ( !recv_byte() )
#define send_dummy_byte() SPDR = 0xFF; wait_till_send_done()
#define recv_byte() SPDR
#define xmit_byte(x) SPDR = x
#define MMC_Disable() PORT_MMC|= (1<<PIN_MMC_CS);
#define MMC_Enable() PORT_MMC=~(1<<PIN_MMC_CS);
#define nop()  __asm__ __volatile__ ("nop" ::)

#define CMD0  (0x40 + 0)
#define CMD1  (0x40 + 1)
#define CMD12 (0x40 + 12)
#define CMD17 (0x40 + 17)
#define CMD18 (0x40 + 18)
#define CMD23 (0x40 + 23)
#define CMD24 (0x40 + 24)
#define CMD25 (0x40 + 25)
#define CMD55 (0x40 + 55)
#define CMD59 (0x40 + 59)

#define SB_START 0xFE
#define MB_START 0xFC
#define MB_STOP  0xFD

uint8_t mmc_read_block ( uint8_t *, uint8_t *, uint16_t );
uint8_t mmc_cmd ( uint8_t * );

#ifdef SPI_CRC
const uint16_t crc16_table[256] = {
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0
};

const uint8_t crc7_table[256] = {
    0x00, 0x09, 0x12, 0x1b, 0x24, 0x2d, 0x36, 0x3f,
    0x48, 0x41, 0x5a, 0x53, 0x6c, 0x65, 0x7e, 0x77,
    0x19, 0x10, 0x0b, 0x02, 0x3d, 0x34, 0x2f, 0x26,
    0x51, 0x58, 0x43, 0x4a, 0x75, 0x7c, 0x67, 0x6e,
    0x32, 0x3b, 0x20, 0x29, 0x16, 0x1f, 0x04, 0x0d,
    0x7a, 0x73, 0x68, 0x61, 0x5e, 0x57, 0x4c, 0x45,
    0x2b, 0x22, 0x39, 0x30, 0x0f, 0x06, 0x1d, 0x14,
    0x63, 0x6a, 0x71, 0x78, 0x47, 0x4e, 0x55, 0x5c,
    0x64, 0x6d, 0x76, 0x7f, 0x40, 0x49, 0x52, 0x5b,
    0x2c, 0x25, 0x3e, 0x37, 0x08, 0x01, 0x1a, 0x13,
    0x7d, 0x74, 0x6f, 0x66, 0x59, 0x50, 0x4b, 0x42,
    0x35, 0x3c, 0x27, 0x2e, 0x11, 0x18, 0x03, 0x0a,
    0x56, 0x5f, 0x44, 0x4d, 0x72, 0x7b, 0x60, 0x69,
    0x1e, 0x17, 0x0c, 0x05, 0x3a, 0x33, 0x28, 0x21,
    0x4f, 0x46, 0x5d, 0x54, 0x6b, 0x62, 0x79, 0x70,
    0x07, 0x0e, 0x15, 0x1c, 0x23, 0x2a, 0x31, 0x38,
    0x41, 0x48, 0x53, 0x5a, 0x65, 0x6c, 0x77, 0x7e,
    0x09, 0x00, 0x1b, 0x12, 0x2d, 0x24, 0x3f, 0x36,
    0x58, 0x51, 0x4a, 0x43, 0x7c, 0x75, 0x6e, 0x67,
    0x10, 0x19, 0x02, 0x0b, 0x34, 0x3d, 0x26, 0x2f,
    0x73, 0x7a, 0x61, 0x68, 0x57, 0x5e, 0x45, 0x4c,
    0x3b, 0x32, 0x29, 0x20, 0x1f, 0x16, 0x0d, 0x04,
    0x6a, 0x63, 0x78, 0x71, 0x4e, 0x47, 0x5c, 0x55,
    0x22, 0x2b, 0x30, 0x39, 0x06, 0x0f, 0x14, 0x1d,
    0x25, 0x2c, 0x37, 0x3e, 0x01, 0x08, 0x13, 0x1a,
    0x6d, 0x64, 0x7f, 0x76, 0x49, 0x40, 0x5b, 0x52,
    0x3c, 0x35, 0x2e, 0x27, 0x18, 0x11, 0x0a, 0x03,
    0x74, 0x7d, 0x66, 0x6f, 0x50, 0x59, 0x42, 0x4b,
    0x17, 0x1e, 0x05, 0x0c, 0x33, 0x3a, 0x21, 0x28,
    0x5f, 0x56, 0x4d, 0x44, 0x7b, 0x72, 0x69, 0x60,
    0x0e, 0x07, 0x1c, 0x15, 0x2a, 0x23, 0x38, 0x31,
    0x46, 0x4f, 0x54, 0x5d, 0x62, 0x6b, 0x70, 0x79
};


uint8_t crc7 ( const uint8_t *buffer, uint8_t len )
{
    uint8_t crc = 0x00;
    while ( len-- )
        crc = crc7_table[ ( crc << 1 ) ^ *buffer++];
    return crc;
}

uint16_t crc16 ( const uint8_t *buffer, uint16_t len )
{
    uint16_t crc = 0x0000;
    while ( len-- ) {
        crc = ( crc << 8 ) ^ crc16_table[ ( crc >> 8 ) ^ *buffer++];
    }
    return crc;
}
#endif

uint8_t mmc_enable_crc ( uint8_t on_off )
{
    unsigned char cmd[] = {CMD59, 0x00, 0x00, 0x00, 0x00, 0xFF};

    //last bit enables or disables CRC mode
    cmd[4] = on_off & 0x01;

    if ( mmc_cmd ( cmd ) != 0 ) {
        return 1;
    }
    return 0;
}

uint8_t mmc_init ()
{
    uint8_t Timeout = 0;


    DDR_MMC &= ~ ( 1 << PIN_MMC_MISO );
    DDR_MMC |= ( 1 << PIN_MMC_SCK );
    DDR_MMC |= ( 1 << PIN_MMC_MOSI );
    DDR_MMC |= ( 1 << PIN_MMC_CS );

    MMC_Enable();

    for ( uint8_t a = 0; a < 200; a++ ) {
        nop();
    };

    SPCR = ( 1 << SPE ) | ( 1 << MSTR ) | ( 1 << SPR0 ) | ( 1 << SPR1 ); //Enable SPI, SPI in Master Mode
    SPSR = ( 0 << SPI2X );

    for ( uint8_t b = 0; b < 0x0f; b++ ) {
        send_dummy_byte();
    }

    /*
     * send CMD0
     */
    uint8_t cmd[] = {CMD0, 0x00, 0x00, 0x00, 0x00, 0x95};
    while ( mmc_cmd ( cmd ) != 1 ) {
        if ( Timeout++ > 200 ) {
            MMC_Disable();
            return ( 1 );
        }
    }

    /*
     * send CMD1
     */
    Timeout = 0;
    cmd[0] = CMD1;
    cmd[5] = 0xFF;
    while ( mmc_cmd ( cmd ) != 0 ) {
        if ( Timeout++ > 400 ) {
            MMC_Disable();
            return ( 2 );
        }
    }

    //SPI Bus to max. speed
    SPCR &= ~ ( ( 1 << SPR0 ) | ( 1 << SPR1 ) );
    SPSR = SPSR | ( 1 << SPI2X );

#ifdef SPI_CRC
    mmc_enable_crc ( 1 );
#endif

    MMC_Disable();
    return ( 0 );
}

uint8_t mmc_cmd ( uint8_t *cmd )
{
    uint8_t tmp = 0x80;
    uint8_t i = 10;
    uint8_t cmd0 = cmd[0];
#ifdef SPI_CRC
    //Calculate CRC and framing bits
    cmd[0] = ( cmd[0] | ( 1 << 6 ) ) & 0x7F;
    cmd[5] =  crc7 ( cmd, 5 ) << 1;
#endif

    // send command
    for ( uint8_t a = 0; a < 0x06; a++ ) {
        xmit_byte ( *cmd++ );
        wait_till_send_done();
    }

    if ( cmd0 == ( CMD12 ) ) recv_byte();

    do {
        send_dummy_byte();
        tmp = recv_byte();
    } while ( ( tmp & 0x80 ) && --i );
    return ( tmp );
}

uint8_t mmc_write_sector ( uint32_t addr, uint8_t *Buffer )
{
    uint8_t tmp;
    uint8_t cmd[] = {CMD24, 0x00, 0x00, 0x00, 0x00, 0xFF};
#ifdef SPI_CRC
    uint16_t crc;
    uint8_t  crcl, crch;
#endif

    MMC_Enable();

    // convert blocks to bytes
    addr = addr << 9; //addr = addr * 512

    cmd[1] = ( ( addr & 0xFF000000 ) >> 24 );
    cmd[2] = ( ( addr & 0x00FF0000 ) >> 16 );
    cmd[3] = ( ( addr & 0x0000FF00 ) >> 8 );

    /*
     * send CMD24
     */
    tmp = mmc_cmd ( cmd );
    if ( tmp != 0 ) {
        MMC_Disable();
        return ( tmp );
    }

    //send Startbyte
    xmit_byte ( SB_START );

#ifdef SPI_CRC
    crc = crc16 ( Buffer, 512 );
    crch = crc >> 8;
    crcl = crc & 0xff;
#endif

    //write a single block
    for ( uint16_t a = 0; a < 512; a++ ) {
        uint8_t data = *Buffer;
        Buffer++;
        wait_till_send_done();
        xmit_byte ( data );
    }
    wait_till_send_done();

    //handle CRC
#ifdef SPI_CRC
    xmit_byte ( crch );
    wait_till_send_done();
    xmit_byte ( crcl );
    wait_till_send_done();
#else
    send_dummy_byte();
    send_dummy_byte();
#endif

    //check for errors
    send_dummy_byte();
    if ( ( recv_byte() & 0x1F ) != 0x05 ) {
        MMC_Disable();
        return ( 2 );
    }

    wait_till_card_ready();

    MMC_Disable();

    return ( 0 );
}

uint8_t mmc_read_block ( uint8_t *cmd, uint8_t *Buffer, uint16_t Bytes )
{
#ifdef SPI_CRC
    uint16_t crc;
#endif

    MMC_Enable();

    //send command
    if ( mmc_cmd ( cmd ) != 0 ) {
        MMC_Disable();
        return ( 1 );
    }

    //wait for startbyte
    while ( 1 ) {
        send_dummy_byte();
        if ( recv_byte() == SB_START )
            break;
    }

    //read first byte
    send_dummy_byte();
    *Buffer = recv_byte();

    //read the remaining 511 bytes
    for ( uint16_t a = 0; a < Bytes - 1; a++ ) {
        xmit_byte ( 0xff ); // send dummy byte
        Buffer++;
        wait_till_send_done();
        *Buffer = recv_byte();
    }

    Buffer = Buffer - ( Bytes - 1 );

    //handle CRC
#ifdef SPI_CRC
    send_dummy_byte();
    crc = recv_byte() << 8;
    send_dummy_byte();
    crc |= recv_byte();

    if ( crc != crc16 ( Buffer, Bytes ) ) {
        MMC_Disable();
        return ( 1 );
    }
#else
    send_dummy_byte();
    send_dummy_byte();
#endif

    MMC_Disable();

    return ( 0 );
}

uint8_t mmc_read_sector ( uint32_t addr, uint8_t *Buffer )
{
    /*
     * send CMD17
     */
    uint8_t cmd[] = {CMD17, 0x00, 0x00, 0x00, 0x00, 0xFF};

    // convert blocks to bytes
    addr = addr << 9; //addr = addr * 512
    cmd[1] = ( ( addr & 0xFF000000 ) >> 24 );
    cmd[2] = ( ( addr & 0x00FF0000 ) >> 16 );
    cmd[3] = ( ( addr & 0x0000FF00 ) >> 8 );

    return mmc_read_block ( cmd, Buffer, 512 );

}

uint8_t mmc_read_multiblock ( uint32_t addr, uint8_t *Buffer, uint8_t numblocks )
{
    uint8_t resp;
    uint8_t cmd[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF };
#ifdef SPI_CRC
    uint16_t crc;
#endif

    MMC_Enable();

#ifdef MMC_PRESET_MULTIBLOCKCOUNT
    wait_till_card_ready();

    /*
     * send CMD55
     */
    cmd[0] = CMD55;
    mmc_cmd ( cmd );

    /*
     * send CMD23
     */
    cmd[0] = CMD23;
    cmd[4] = numblocks;
    mmc_cmd ( cmd );

    wait_till_card_ready();
#endif

    // convert blocks to bytes
    addr = addr << 9; //addr = addr * 512
    cmd[0] = CMD18;
    cmd[1] = ( ( addr & 0xFF000000 ) >> 24 );
    cmd[2] = ( ( addr & 0x00FF0000 ) >> 16 );
    cmd[3] = ( ( addr & 0x0000FF00 ) >> 8 );
    cmd[4] = ( addr &  0x000000FF );

    wait_till_card_ready();

    /*
     * send CMD18
     */
    resp = mmc_cmd ( cmd );
    if ( resp > 1 ) {
        MMC_Disable();
        return ( 1 );
    }

    for ( uint8_t n = numblocks; n > 0; n-- ) {
        // wait for startbyte
        while ( 1 ) {
            send_dummy_byte();
            if ( recv_byte() == SB_START )
            break;
        }

        send_dummy_byte();
        *Buffer = recv_byte();
        // receive the block
        for ( uint16_t a = 0; a < 512 - 1; a++ ) {
            xmit_byte ( 0xff );
            Buffer++;
            wait_till_send_done();
            *Buffer = recv_byte();
        }
        // handle CRC
#ifdef SPI_CRC
        Buffer = Buffer - ( 512 - 1 );
        send_dummy_byte();
        crc = recv_byte() << 8;
        send_dummy_byte();
        crc |= recv_byte();
        if ( crc != crc16 ( Buffer, 512 ) ) {
            MMC_Disable();
            return ( 1 );
        }
        Buffer = Buffer + 512;
#else
    send_dummy_byte();
    send_dummy_byte();
        Buffer++;
#endif

    }

    wait_till_card_ready();

    /*
     * send CMD12
     */
    cmd[0] = CMD12;
    cmd[1] = cmd[2] = cmd[3] = cmd[4] = 0;

    resp = mmc_cmd ( cmd );

/*  TODO: Apacer Card I have sends 0x7f after some reads - No idea why - CRC was correct
    if ( resp > 1 ) {
        MMC_Disable();
        return ( 2 );
    }
*/
    // Pad 8
    send_dummy_byte();

    MMC_Disable()

    return ( 0 );
}

uint8_t mmc_write_multiblock ( uint32_t addr, uint8_t *Buffer, uint8_t numblocks )
{
    uint8_t resp;
    uint8_t cmd[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF };
#ifdef SPI_CRC
    uint16_t crc;
    uint8_t crcl, crch;
#endif

    MMC_Enable();

#ifdef MMC_PRESET_MULTIBLOCKCOUNT
    wait_till_card_ready();

    /*
     * send CMD55
     */
    cmd[0] = CMD55;
    mmc_cmd ( cmd );

    /*
     * send CMD23
     */
    cmd[0] = CMD23;
    cmd[4] = numblocks;
    mmc_cmd ( cmd );

    wait_till_card_ready();
#endif

    // convert blocks to bytes
    addr = addr << 9;
    cmd[0] = CMD25;
    cmd[1] = ( ( addr & 0xFF000000 ) >> 24 );
    cmd[2] = ( ( addr & 0x00FF0000 ) >> 16 );
    cmd[3] = ( ( addr & 0x0000FF00 ) >> 8 );
    cmd[4] = 0;

    /*
     * send CMD25
     */
    resp =  mmc_cmd ( cmd );
    if ( resp > 1 ) {
        MMC_Disable();
        return ( 1 );
    }

    for ( uint8_t n = numblocks; n > 0; n-- ) {
#ifdef SPI_CRC
        crc = crc16 ( Buffer, 512 );
        crch = crc >> 8;
        crcl = crc & 0xff;
#endif
        wait_till_card_ready();

        // Send multi-block start-token
        xmit_byte ( MB_START );

        //actually transfer the data
        for ( uint16_t i = 512; i; i-- ) {
            uint8_t data = *Buffer;
            Buffer++;
            wait_till_send_done();
            xmit_byte ( data );
        }

        wait_till_send_done();
        // handle CRC
#ifdef SPI_CRC
        xmit_byte ( crch );
        wait_till_send_done();
        xmit_byte ( crcl );
#else
        xmit_byte ( 0xff );
        wait_till_send_done();
        xmit_byte ( 0xff );
#endif

#ifdef MMC_PRESET_MULTIBLOCKCOUNT
        // Pad 8
        send_dummy_byte();
#else
        wait_till_send_done();
#endif

        // Get response
        send_dummy_byte();
        resp = recv_byte();
        if ( ( resp & 0x0E ) != 4 ) {
            MMC_Disable();
            return ( 2 );
        }
    }

    wait_till_card_ready();

    // Send "transfer stop byte"
    xmit_byte ( MB_STOP );
    wait_till_send_done();

    // Pad 8
    send_dummy_byte();

    wait_till_card_ready();

    MMC_Disable();

    return ( 0 );
}
