? 0x000/i
<<%0>>%0000:    sub     sp,#%001e
<<%0>>%0004:    ldm     <<%0>>%0012(sp),r8,#6
<<%0>>%000c:    ldl     rr2,<<%0>>%0024
<<%0>>%0012:    ldl     |<<%0>>%000c|(sp),rr2
<<%0>>%0016:    ldl     rr4,#%00000004
<<%0>>%001c:    add     r5,sp
<<%0>>%001e:    ldl     rr2,#%00000008
<<%0>>%0024:    add     r3,sp
<<%0>>%0026:    ldl     rr6,|<<%0>>%000c|(sp)
<<%0>>%002a:    calr    _lkfront
<<%0>>%002c:    ldl     rr12,rr2
<<%0>>%002e:    testl   rr2
<<%0>>%0030:    jp      z/eq,<<%0>>%0274
<<%0>>%0036:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%003a:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%003e:    ldl     rr4,|<<%0>>%000c|(sp)
<<%0>>%0042:    ld      r7,rr4(#%0002)
<<%0>>%0046:    bit     r7,#2
<<%0>>%0048:    jr      z/eq,_lkdata+%50
<<%0>>%004a:    ld      r7,#%0080
<<%0>>%004e:    jr      _lkdata+%52
<<%0>>%0050:    sub     r7,r7
<<%0>>%0052:    ldl     rr4,rr12
<<%0>>%0054:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0058:    calr    _locked
<<%0>>%005a:    test    r2
<<%0>>%005c:    jp      nz/ne,<<%0>>%0274
<<%0>>%0062:    ldl     rr2,rr12
<<%0>>%0064:    add     r3,#%004a
<<%0>>%0068:    ldl     rr10,rr2
<<%0>>%006a:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%006e:    ld      r4,rr2(#%0002)
<<%0>>%0072:    bit     r4,#0
<<%0>>%0074:    jr      z/eq,_lkdata+%7a
<<%0>>%0076:    sub     r4,r4
<<%0>>%0078:    jr      _lkdata+%7e
<<%0>>%007a:    ld      r4,#%0100
<<%0>>%007e:    ld      |<<%0>>%0010|(sp),r4
<<%0>>%0082:    jp      <<%0>>%0256
<<%0>>%0088:    ldl     rr2,rr8
<<%0>>%008a:    inc     r3,#10
<<%0>>%008c:    ldl     rr4,|<<%0>>%0008|(sp)
<<%0>>%0090:    cpl     rr4,@rr2
<<%0>>%0092:    jp      lt,<<%0>>%0260
<<%0>>%0098:    ldl     rr2,rr8(#%0006)
<<%0>>%009c:    cpl     rr2,<<%0>>%0020
<<%0>>%00a2:    jp      nz/ne,<<%0>>%0242
<<%0>>%00a8:    ldl     rr4,rr8(#%000a)
<<%0>>%00ac:    cpl     rr4,|<<%0>>%0004|(sp)
<<%0>>%00b0:    jr      gt,_lkdata+%b6
<<%0>>%00b2:    ldk     r3,#1
<<%0>>%00b4:    jr      _lkdata+%b8
<<%0>>%00b6:    sub     r3,r3
<<%0>>%00b8:    ldl     rr4,rr8(#%000e)
<<%0>>%00bc:    cpl     rr4,|<<%0>>%0004|(sp)
<<%0>>%00c0:    jr      gt,_lkdata+%c6
<<%0>>%00c2:    ldk     r4,#2
<<%0>>%00c4:    jr      _lkdata+%c8
<<%0>>%00c6:    sub     r4,r4
<<%0>>%00c8:    add     r3,r4
<<%0>>%00ca:    ldl     rr4,rr8(#%000a)
<<%0>>%00ce:    cpl     rr4,|<<%0>>%0008|(sp)
<<%0>>%00d2:    jr      gt,_lkdata+%d8
<<%0>>%00d4:    ldk     r4,#4
<<%0>>%00d6:    jr      _lkdata+%da
<<%0>>%00d8:    sub     r4,r4
<<%0>>%00da:    add     r3,r4
<<%0>>%00dc:    ldl     rr4,rr8(#%000e)
<<%0>>%00e0:    cpl     rr4,|<<%0>>%0008|(sp)
<<%0>>%00e4:    jr      gt,_lkdata+%ea
<<%0>>%00e6:    ldk     r4,#8
<<%0>>%00e8:    jr      _lkdata+%ec
<<%0>>%00ea:    sub     r4,r4
<<%0>>%00ec:    add     r3,r4
<<%0>>%00ee:    ld      r4,rr8(#%0004)
<<%0>>%00f2:    and     r4,#%0100
<<%0>>%00f6:    cp      r4,|<<%0>>%0010|(sp)
<<%0>>%00fa:    jr      nz/ne,<<%0>>%0102
<<%0>>%00fc:    ld      r4,#%0010
<<%0>>%0100:    jr      <<%0>>%0104
<<%0>>%0102:    sub     r4,r4
<<%0>>%0104:    add     r3,r4
<<%0>>%0106:    ld      r2,r3
<<%0>>%0108:    dec     r2,#4
<<%0>>%010a:    cp      r2,#%001b
<<%0>>%010e:    jp      ugt,<<%0>>%0256
<<%0>>%0114:    rl      r2,#2
<<%0>>%0116:    ldl     rr4,_lockwstr+%2a(r2)
<<%0>>%011c:    jp      @rr4
<<%0>>%011e:    test    |<<%0>>%0010|(sp)
<<%0>>%0122:    jr      z/eq,<<%0>>%0132
<<%0>>%0124:    ldl     rr4,rr8(#%000a)
<<%0>>%0128:    ldl     |<<%0>>%0000|(sp),rr4
<<%0>>%012c:    jp      <<%0>>%0268
<<%0>>%0132:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%0136:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%013a:    ldl     rr6,rr10
<<%0>>%013c:    ld      r5,|<<%0>>%0010|(sp)
<<%0>>%0140:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0144:    calr    _lockadd
<<%0>>%0146:    test    r2
<<%0>>%0148:    jr      z/eq,<<%0>>%01e6
<<%0>>%014a:    test    |<<%0>>%0010|(sp)
<<%0>>%014e:    jp      nz/ne,<<%0>>%0274
<<%0>>%0154:    ldl     rr2,rr8(#%000a)
<<%0>>%0158:    cpl     rr2,|<<%0>>%0004|(sp)
<<%0>>%015c:    jr      ge,<<%0>>%01d0
<<%0>>%015e:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0162:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%0166:    ldl     rr2,rr8(#%000a)
<<%0>>%016a:    ld      r5,#%0100
<<%0>>%016e:    ldl     rr6,rr10
<<%0>>%0170:    calr    _lockadd
<<%0>>%0172:    test    r2
<<%0>>%0174:    jr      z/eq,<<%0>>%01b0
<<%0>>%0176:    test    |<<%0>>%0010|(sp)
<<%0>>%017a:    jr      z/eq,<<%0>>%024e
<<%0>>%017c:    ldl     rr2,rr8(#%000a)
<<%0>>%0180:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%0184:    ldl     rr6,rr10
<<%0>>%0186:    ld      r5,|<<%0>>%0010|(sp)
<<%0>>%018a:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%018e:    calr    _lockadd
<<%0>>%0190:    test    r2
<<%0>>%0192:    jr      nz/ne,<<%0>>%0202
<<%0>>%0194:    ldl     rr2,<<%0>>%0000
<<%0>>%019a:    testl   rr2
<<%0>>%019c:    jr      nz/ne,<<%0>>%01f2
<<%0>>%019e:    ldl     rr4,@rr8
<<%0>>%01a0:    ldl     @rr10,rr4
<<%0>>%01a2:    ldl     rr6,@rr10
<<%0>>%01a4:    calr    _lockfree
<<%0>>%01a6:    ldb     <<%0>>%0015,#%23
<<%0>>%01ae:    jr      <<%0>>%0274
<<%0>>%01b0:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%01b4:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%01b8:    ldl     rr6,@rr10
<<%0>>%01ba:    sub     r5,r5
<<%0>>%01bc:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%01c0:    calr    _lockadd
<<%0>>%01c2:    test    r2
<<%0>>%01c4:    jr      z/eq,<<%0>>%01e6
<<%0>>%01c6:    ldl     rr2,@rr8
<<%0>>%01c8:    ldl     @rr10,rr2
<<%0>>%01ca:    ldl     rr6,@rr10
<<%0>>%01cc:    calr    _lockfree
<<%0>>%01ce:    jr      <<%0>>%0274
<<%0>>%01d0:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%01d4:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%01d8:    ldl     rr2,rr8(#%000a)
<<%0>>%01dc:    sub     r5,r5
<<%0>>%01de:    ldl     rr6,rr10
<<%0>>%01e0:    calr    _lockadd
<<%0>>%01e2:    test    r2
<<%0>>%01e4:    jr      nz/ne,<<%0>>%0274
<<%0>>%01e6:    ldl     rr2,rr8
<<%0>>%01e8:    inc     r3,#10
<<%0>>%01ea:    ldl     rr4,|<<%0>>%0008|(sp)
<<%0>>%01ee:    ldl     @rr2,rr4
<<%0>>%01f0:    jr      <<%0>>%0274
<<%0>>%01f2:    ldl     rr2,rr8(#%000e)
<<%0>>%01f6:    ldl     |<<%0>>%0004|(sp),rr2
<<%0>>%01fa:    cpl     rr2,|<<%0>>%0008|(sp)
<<%0>>%01fe:    jr      nz/ne,<<%0>>%0256
<<%0>>%0200:    jr      <<%0>>%0274
<<%0>>%0202:    test    |<<%0>>%0010|(sp)
<<%0>>%0206:    jr      z/eq,<<%0>>%0218
<<%0>>%0208:    ldl     rr2,rr8(#%000e)
<<%0>>%020c:    ldl     |<<%0>>%0004|(sp),rr2
<<%0>>%0210:    cpl     rr2,|<<%0>>%0008|(sp)
<<%0>>%0214:    jr      nz/ne,<<%0>>%0256
<<%0>>%0216:    jr      <<%0>>%0274
<<%0>>%0218:    ldl     rr2,rr8(#%000a)
<<%0>>%021c:    cpl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0220:    jr      ge,<<%0>>%024e
<<%0>>%0222:    ldl     rr2,rr8
<<%0>>%0224:    inc     r3,#14
<<%0>>%0226:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%022a:    ldl     @rr2,rr4
<<%0>>%022c:    jr      <<%0>>%0256
<<%0>>%022e:    ldl     rr2,rr8
<<%0>>%0230:    inc     r3,#10
<<%0>>%0232:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%0236:    jr      <<%0>>%01ee
<<%0>>%0238:    ldl     rr2,rr8(#%000e)
<<%0>>%023c:    cpl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0240:    jr      z/eq,<<%0>>%0246
<<%0>>%0242:    ldl     rr10,rr8
<<%0>>%0244:    jr      <<%0>>%0256
<<%0>>%0246:    ldl     rr2,rr8(#%000a)
<<%0>>%024a:    ldl     |<<%0>>%0004|(sp),rr2
<<%0>>%024e:    ldl     rr2,@rr8
<<%0>>%0250:    ldl     @rr10,rr2
<<%0>>%0252:    ldl     rr6,rr8
<<%0>>%0254:    calr    _lockfree
<<%0>>%0256:    ldl     rr8,@rr10
<<%0>>%0258:    testl   rr8
<<%0>>%025a:    jp      nz/ne,_lkdata+%88
<<%0>>%0260:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%0264:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%0268:    ldl     rr6,rr10
<<%0>>%026a:    ld      r5,|<<%0>>%0010|(sp)
<<%0>>%026e:    ldl     rr2,|<<%0>>%0004|(sp)
<<%0>>%0272:    calr    _lockadd
<<%0>>%0274:    ldm     r8,<<%0>>%0012(sp),#6
<<%0>>%027c:    add     sp,#%001e
<<%0>>%0280:    ret
<<%0>>%0282:    sub     sp,#%001c
<<%0>>%0286:    ldm     <<%0>>%0010(sp),r8,#6
<<%0>>%028e:    ldl     rr2,<<%0>>%0024
<<%0>>%0294:    ldl     |<<%0>>%000c|(sp),rr2
<<%0>>%0298:    ldl     rr4,#%00000004
<<%0>>%029e:    add     r5,sp
<<%0>>%02a0:    ldl     rr2,#%00000008
<<%0>>%02a6:    add     r3,sp
<<%0>>%02a8:    ldl     rr6,|<<%0>>%000c|(sp)
<<%0>>%02ac:    calr    _lkfront
<<%0>>%02ae:    ldl     rr12,rr2
<<%0>>%02b0:    testl   rr2
<<%0>>%02b2:    jr      z/eq,<<%0>>%0384
<<%0>>%02b4:    add     r3,#%004a
<<%0>>%02b8:    ldl     rr10,rr2
<<%0>>%02ba:    jr      _unlk+%fc
<<%0>>%02bc:    ld      r2,rr8(#%0004)
<<%0>>%02c0:    bit     r2,#4
<<%0>>%02c2:    jr      z/eq,_unlk+%50
<<%0>>%02c4:    ldl     rr2,rr8
<<%0>>%02c6:    inc     r3,#4
<<%0>>%02c8:    res     @rr2,#4
<<%0>>%02ca:    ldl     rr6,rr8
<<%0>>%02cc:    call    _lkdata
<<%0>>%02d2:    ldl     rr2,rr8(#%000a)
<<%0>>%02d6:    cpl     rr2,|<<%0>>%0004|(sp)
<<%0>>%02da:    jr      ge,_unlk+%8a
<<%0>>%02dc:    ldl     rr2,rr8
<<%0>>%02de:    inc     r3,#14
<<%0>>%02e0:    ldl     rr4,|<<%0>>%0008|(sp)
<<%0>>%02e4:    cpl     rr4,@rr2
<<%0>>%02e6:    jr      ge,_unlk+%8a
<<%0>>%02e8:    ldl     rr2,rr8(#%000e)
<<%0>>%02ec:    ldl     |<<%0>>%0000|(sp),rr2
<<%0>>%02f0:    ld      r5,rr8(#%0004)
<<%0>>%02f4:    ldl     rr6,rr8
<<%0>>%02f6:    ldl     rr2,|<<%0>>%0008|(sp)
<<%0>>%02fa:    calr    _lockadd
<<%0>>%02fc:    test    r2
<<%0>>%02fe:    jr      nz/ne,<<%0>>%0384
<<%0>>%0300:    ldl     rr2,rr8
<<%0>>%0302:    inc     r3,#14
<<%0>>%0304:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%0308:    ldl     @rr2,rr4
<<%0>>%030a:    jr      <<%0>>%0384
<<%0>>%030c:    ldl     rr2,rr8
<<%0>>%030e:    inc     r3,#10
<<%0>>%0310:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%0314:    cpl     rr4,@rr2
<<%0>>%0316:    jr      gt,_unlk+%ae
<<%0>>%0318:    ldl     rr2,rr8
<<%0>>%031a:    inc     r3,#14
<<%0>>%031c:    ldl     rr6,|<<%0>>%0008|(sp)
<<%0>>%0320:    cpl     rr6,@rr2
<<%0>>%0322:    jr      ge,_unlk+%ae
<<%0>>%0324:    ldl     rr2,rr8
<<%0>>%0326:    inc     r3,#10
<<%0>>%0328:    ldl     rr0,|<<%0>>%0008|(sp)
<<%0>>%032c:    ldl     @rr2,rr0
<<%0>>%032e:    jr      <<%0>>%0384
<<%0>>%0330:    ldl     rr2,rr8
<<%0>>%0332:    inc     r3,#14
<<%0>>%0334:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%0338:    ldl     @rr2,rr4
<<%0>>%033a:    ldl     rr10,rr8
<<%0>>%033c:    jr      _unlk+%fc
<<%0>>%033e:    ldl     rr2,rr8(#%0006)
<<%0>>%0342:    cpl     rr2,<<%0>>%0020
<<%0>>%0348:    jr      nz/ne,_unlk+%b8
<<%0>>%034a:    ldl     rr2,rr8
<<%0>>%034c:    inc     r3,#10
<<%0>>%034e:    ldl     rr4,|<<%0>>%0008|(sp)
<<%0>>%0352:    cpl     rr4,@rr2
<<%0>>%0354:    jr      le,<<%0>>%0384
<<%0>>%0356:    ldl     rr2,rr8(#%000e)
<<%0>>%035a:    cpl     rr2,|<<%0>>%0004|(sp)
<<%0>>%035e:    jr      le,_unlk+%b8
<<%0>>%0360:    ldl     rr2,rr8
<<%0>>%0362:    inc     r3,#10
<<%0>>%0364:    ldl     rr4,|<<%0>>%0004|(sp)
<<%0>>%0368:    cpl     rr4,@rr2
<<%0>>%036a:    jr      gt,_unlk+%3a
<<%0>>%036c:    ldl     rr2,rr8(#%000e)
<<%0>>%0370:    cpl     rr2,|<<%0>>%0008|(sp)
<<%0>>%0374:    jr      gt,_unlk+%3a
<<%0>>%0376:    ldl     rr2,@rr8
<<%0>>%0378:    ldl     @rr10,rr2
<<%0>>%037a:    ldl     rr6,rr8
<<%0>>%037c:    calr    _lockfree
<<%0>>%037e:    ldl     rr8,@rr10
<<%0>>%0380:    testl   rr8
<<%0>>%0382:    jr      nz/ne,_unlk+%bc
<<%0>>%0384:    ldm     r8,<<%0>>%0010(sp),#6
<<%0>>%038c:    add     sp,#%001c
<<%0>>%0390:    ret
<<%0>>%0392:    sub     sp,#%001e
<<%0>>%0396:    ldm     <<%0>>%0012(sp),r8,#6
<<%0>>%039e:    ld      |<<%0>>%000a|(sp),r7
<<%0>>%03a2:    ldl     rr8,<<%0>>%0022(sp)
<<%0>>%03a8:    ldl     rr10,rr2
<<%0>>%03aa:    ldl     rr12,rr4
<<%0>>%03ac:    ldl     rr2,rr12(#%004a)
<<%0>>%03b0:    ldl     |<<%0>>%000c|(sp),rr2
<<%0>>%03b4:    jr      _locked+%a0
<<%0>>%03b6:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%03ba:    ldl     rr4,@rr2
<<%0>>%03bc:    ldl     |<<%0>>%000c|(sp),rr4
<<%0>>%03c0:    jr      _locked+%a0
<<%0>>%03c2:    inc     r3,#10
<<%0>>%03c4:    cpl     rr8,@rr2
<<%0>>%03c6:    jr      le,_locked+%a8
<<%0>>%03c8:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%03cc:    ldl     rr4,rr2(#%0006)
<<%0>>%03d0:    cpl     rr4,<<%0>>%0020
<<%0>>%03d6:    jr      z/eq,_locked+%24
<<%0>>%03d8:    inc     r3,#14
<<%0>>%03da:    cpl     rr10,@rr2
<<%0>>%03dc:    jr      ge,_locked+%24
<<%0>>%03de:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%03e2:    inc     r3,#4
<<%0>>%03e4:    ld      r4,|<<%0>>%000a|(sp)
<<%0>>%03e8:    and     r4,#%0100
<<%0>>%03ec:    and     r4,@rr2
<<%0>>%03ee:    jr      nz/ne,_locked+%24
<<%0>>%03f0:    bit     |<<%0>>%000a|(sp),#7
<<%0>>%03f4:    jr      z/eq,_locked+%70
<<%0>>%03f6:    ldb     <<%0>>%0015,#%0d
<<%0>>%03fe:    ldk     r2,#1
<<%0>>%0400:    jr      _locked+%aa
<<%0>>%0402:    ldl     rr6,|<<%0>>%000c|(sp)
<<%0>>%0406:    calr    _deadlock
<<%0>>%0408:    test    r2
<<%0>>%040a:    jr      nz/ne,_locked+%6c
<<%0>>%040c:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%0410:    inc     r3,#4
<<%0>>%0412:    set     @rr2,#4
<<%0>>%0414:    ldl     rr6,|<<%0>>%000c|(sp)
<<%0>>%0418:    ld      r5,#%0028
<<%0>>%041c:    call    _lkdata
<<%0>>%0422:    ldl     rr2,rr12(#%004a)
<<%0>>%0426:    ldl     |<<%0>>%000c|(sp),rr2
<<%0>>%042a:    testb   <<%0>>%0015
<<%0>>%0430:    jr      nz/ne,_locked+%6c
<<%0>>%0432:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%0436:    testl   rr2
<<%0>>%0438:    jr      nz/ne,_locked+%30
<<%0>>%043a:    sub     r2,r2
<<%0>>%043c:    ldm     r8,<<%0>>%0012(sp),#6
<<%0>>%0444:    add     sp,#%001e
<<%0>>%0448:    ret
<<%0>>%044a:    sub     sp,#%0012
<<%0>>%044e:    ldm     <<%0>>%000a(sp),r10,#4
<<%0>>%0456:    ldl     rr12,rr6
<<%0>>%0458:    jr      _deadlock+%52
<<%0>>%045a:    ldl     rr2,rr12(#%0006)
<<%0>>%045e:    ldl     rr4,rr2(#%0016)
<<%0>>%0462:    ldl     rr10,rr4
<<%0>>%0464:    cpl     rr4,#%00000000
<<%0>>%046a:    jr      c/ult,_deadlock+%5c
<<%0>>%046c:    ld      r3,<<%0>>%0000
<<%0>>%0472:    mult    rr2,#%0012
<<%0>>%0476:    ldl     rr4,#%00000000
<<%0>>%047c:    add     r5,r3
<<%0>>%047e:    cpl     rr10,rr4
<<%0>>%0480:    jr      nc/uge,_deadlock+%5c
<<%0>>%0482:    ldl     rr2,rr10(#%0006)
<<%0>>%0486:    cpl     rr2,<<%0>>%0020
<<%0>>%048c:    jr      nz/ne,_deadlock+%50
<<%0>>%048e:    ldb     <<%0>>%0015,#%23
<<%0>>%0496:    ldk     r2,#1
<<%0>>%0498:    jr      _deadlock+%5e
<<%0>>%049a:    ldl     rr12,rr10
<<%0>>%049c:    ldl     rr2,rr12(#%0006)
<<%0>>%04a0:    cpb     @rr2,#%01
<<%0>>%04a4:    jr      z/eq,_deadlock+%10
<<%0>>%04a6:    sub     r2,r2
<<%0>>%04a8:    ldm     r10,<<%0>>%000a(sp),#4
<<%0>>%04b0:    add     sp,#%0012
<<%0>>%04b4:    ret
<<%0>>%04b6:    sub     sp,#%001c
<<%0>>%04ba:    ldm     <<%0>>%0010(sp),r8,#6
<<%0>>%04c2:    ldl     rr12,rr6
<<%0>>%04c4:    ldl     rr2,rr12(#%004a)
<<%0>>%04c8:    testl   rr2
<<%0>>%04ca:    jr      z/eq,_unlock+%82
<<%0>>%04cc:    ldl     rr2,rr6
<<%0>>%04ce:    add     r3,#%004a
<<%0>>%04d2:    ldl     rr8,rr2
<<%0>>%04d4:    clr     |<<%0>>%000e|(sp)
<<%0>>%04d8:    clr     |<<%0>>%000c|(sp)
<<%0>>%04dc:    ld      r2,|<<%0>>%000c|(sp)
<<%0>>%04e0:    sla     r2,#2
<<%0>>%04e4:    ldl     rr4,<<%0>>%0068(r2)
<<%0>>%04ea:    testl   rr4
<<%0>>%04ec:    jr      z/eq,_unlock+%50
<<%0>>%04ee:    ld      r2,|<<%0>>%000c|(sp)
<<%0>>%04f2:    sla     r2,#2
<<%0>>%04f6:    ldl     rr4,<<%0>>%0068(r2)
<<%0>>%04fc:    inc     r5,#2
<<%0>>%04fe:    cpl     rr12,@rr4
<<%0>>%0500:    jr      nz/ne,_unlock+%50
<<%0>>%0502:    inc     |<<%0>>%000e|(sp)
<<%0>>%0506:    inc     |<<%0>>%000c|(sp)
<<%0>>%050a:    cp      |<<%0>>%000c|(sp),#%0014
<<%0>>%0510:    jr      lt,_unlock+%26
<<%0>>%0512:    test    |<<%0>>%000e|(sp)
<<%0>>%0516:    jr      z/eq,_unlock+%7c
<<%0>>%0518:    jr      _unlock+%82
<<%0>>%051a:    ldl     rr2,@rr10
<<%0>>%051c:    ldl     @rr8,rr2
<<%0>>%051e:    ldl     rr6,rr10
<<%0>>%0520:    calr    _lockfree
<<%0>>%0522:    jr      _unlock+%7c
<<%0>>%0524:    ldl     rr2,rr10(#%0006)
<<%0>>%0528:    cpl     rr2,<<%0>>%0020
<<%0>>%052e:    jr      z/eq,_unlock+%64
<<%0>>%0530:    ldl     rr8,rr10
<<%0>>%0532:    ldl     rr10,@rr8
<<%0>>%0534:    testl   rr10
<<%0>>%0536:    jr      nz/ne,_unlock+%6e
<<%0>>%0538:    ldm     r8,<<%0>>%0010(sp),#6
<<%0>>%0540:    add     sp,#%001c
<<%0>>%0544:    ret
<<%0>>%0546:    dec     sp,#12
<<%0>>%0548:    ldm     <<%0>>%0004(sp),r10,#4
<<%0>>%0550:    ldl     rr12,#%00000000
<<%0>>%0556:    ldl     rr2,rr12(#%0006)
<<%0>>%055a:    testl   rr2
<<%0>>%055c:    jr      nz/ne,_lockalloc+%4a
<<%0>>%055e:    ldl     rr2,rr12
<<%0>>%0560:    inc     r3,#6
<<%0>>%0562:    ldl     rr4,#%00000000
<<%0>>%0568:    ldl     @rr2,rr4
<<%0>>%056a:    ldl     rr10,#%00000012
<<%0>>%0570:    jr      _lockalloc+%34
<<%0>>%0572:    ldl     rr6,rr10
<<%0>>%0574:    calr    _lockfree
<<%0>>%0576:    add     r11,#%0012
<<%0>>%057a:    ld      r3,<<%0>>%0000
<<%0>>%0580:    mult    rr2,#%0012
<<%0>>%0584:    ldl     rr4,#%00000000
<<%0>>%058a:    add     r5,r3
<<%0>>%058c:    cpl     rr10,rr4
<<%0>>%058e:    jr      c/ult,_lockalloc+%2c
<<%0>>%0590:    ldl     rr10,@rr12
<<%0>>%0592:    testl   rr10
<<%0>>%0594:    jr      nz/ne,_lockalloc+%5c
<<%0>>%0596:    ldb     <<%0>>%0015,#%23
<<%0>>%059e:    subl    rr2,rr2
<<%0>>%05a0:    jr      _lockalloc+%66
<<%0>>%05a2:    ldl     rr2,@rr10
<<%0>>%05a4:    ldl     @rr12,rr2
<<%0>>%05a6:    subl    rr2,rr2
<<%0>>%05a8:    ldl     @rr10,rr2
<<%0>>%05aa:    ldl     rr2,rr10
<<%0>>%05ac:    ldm     r10,<<%0>>%0004(sp),#4
<<%0>>%05b4:    inc     sp,#12
<<%0>>%05b6:    ret
<<%0>>%05b8:    dec     sp,#12
<<%0>>%05ba:    ldm     <<%0>>%0004(sp),r10,#4
<<%0>>%05c2:    ldl     rr12,rr6
<<%0>>%05c4:    ldl     rr10,#%00000000
<<%0>>%05ca:    ld      r2,rr12(#%0004)
<<%0>>%05ce:    bit     r2,#4
<<%0>>%05d0:    jr      z/eq,_lockfree+%28
<<%0>>%05d2:    ldl     rr2,rr6
<<%0>>%05d4:    inc     r3,#4
<<%0>>%05d6:    res     @rr2,#4
<<%0>>%05d8:    ldl     rr6,rr12
<<%0>>%05da:    call    _lkdata
<<%0>>%05e0:    ldl     rr2,@rr10
<<%0>>%05e2:    ldl     @rr12,rr2
<<%0>>%05e4:    ldl     @rr10,rr12
<<%0>>%05e6:    ldm     r10,<<%0>>%0004(sp),#4
<<%0>>%05ee:    inc     sp,#12
<<%0>>%05f0:    ret
<<%0>>%05f2:    sub     sp,#%001e
<<%0>>%05f6:    ldm     <<%0>>%0012(sp),r8,#6
<<%0>>%05fe:    ldl     rr8,rr2
<<%0>>%0600:    ld      r11,r5
<<%0>>%0602:    ldl     rr12,rr6
<<%0>>%0604:    calr    _lockalloc
<<%0>>%0606:    ldl     |<<%0>>%000c|(sp),rr2
<<%0>>%060a:    testl   rr2
<<%0>>%060c:    jr      nz/ne,_lockadd+%28
<<%0>>%060e:    ldb     <<%0>>%0015,#%23
<<%0>>%0616:    ldk     r2,#1
<<%0>>%0618:    jr      _lockadd+%64
<<%0>>%061a:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%061e:    ldl     rr4,@rr12
<<%0>>%0620:    ldl     @rr2,rr4
<<%0>>%0622:    ldl     rr4,|<<%0>>%000c|(sp)
<<%0>>%0626:    ldl     @rr12,rr4
<<%0>>%0628:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%062c:    inc     r3,#6
<<%0>>%062e:    ldl     rr4,<<%0>>%0020
<<%0>>%0634:    ldl     @rr2,rr4
<<%0>>%0636:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%063a:    inc     r3,#10
<<%0>>%063c:    ldl     @rr2,rr8
<<%0>>%063e:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%0642:    inc     r3,#14
<<%0>>%0644:    ldl     rr4,<<%0>>%0022(sp)
<<%0>>%064a:    ldl     @rr2,rr4
<<%0>>%064c:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%0650:    inc     r3,#4
<<%0>>%0652:    ld      @rr2,r11
<<%0>>%0654:    sub     r2,r2
<<%0>>%0656:    ldm     r8,<<%0>>%0012(sp),#6
<<%0>>%065e:    add     sp,#%001e
<<%0>>%0662:    ret
<<%0>>%0664:    sub     sp,#%0030
<<%0>>%0668:    ldm     <<%0>>%0024(sp),r8,#6
<<%0>>%0670:    ldl     rr8,rr2
<<%0>>%0672:    ldl     rr10,rr4
<<%0>>%0674:    ldl     rr12,rr6
<<%0>>%0676:    ld      r7,@rr12
<<%0>>%0678:    call    _lkdata
<<%0>>%067e:    ldl     |<<%0>>%0016|(sp),rr2
<<%0>>%0682:    testl   rr2
<<%0>>%0684:    jr      nz/ne,_lkfront+%60
<<%0>>%0686:    jr      _lkfront+%c2
<<%0>>%0688:    ldl     rr6,#%0100009a
<<%0>>%068e:    call    _lkdata
<<%0>>%0694:    jr      _lkfront+%c2
<<%0>>%0696:    ldl     rr6,|<<%0>>%001a|(sp)
<<%0>>%069a:    ld      r5,#%0080
<<%0>>%069e:    call    _lkdata
<<%0>>%06a4:    test    r2
<<%0>>%06a6:    jr      z/eq,_lkfront+%80
<<%0>>%06a8:    ldb     <<%0>>%0015,#%0d
<<%0>>%06b0:    jr      _lkfront+%c2
<<%0>>%06b2:    ld      r4,rr2(#%0006)
<<%0>>%06b6:    bit     r4,#12
<<%0>>%06b8:    jr      z/eq,_lkfront+%44
<<%0>>%06ba:    ldb     <<%0>>%0015,#%1d
<<%0>>%06c2:    jr      _lkfront+%c2
<<%0>>%06c4:    ldl     rr2,|<<%0>>%0016|(sp)
<<%0>>%06c8:    ldl     rr4,rr2(#%0002)
<<%0>>%06cc:    ldl     |<<%0>>%001a|(sp),rr4
<<%0>>%06d0:    testl   rr4
<<%0>>%06d2:    jr      z/eq,_lkfront+%24
<<%0>>%06d4:    ldl     rr2,|<<%0>>%0016|(sp)
<<%0>>%06d8:    ldb     rl4,@rr2
<<%0>>%06da:    extsb   r4
<<%0>>%06dc:    and     r4,#%0002
<<%0>>%06e0:    test    r4
<<%0>>%06e2:    jr      z/eq,_lkfront+%32
<<%0>>%06e4:    ld      |<<%0>>%001e|(sp),#%7000
<<%0>>%06ea:    ldl     rr2,|<<%0>>%001a|(sp)
<<%0>>%06ee:    ld      r4,rr2(#%0006)
<<%0>>%06f2:    and     r4,#%f000
<<%0>>%06f6:    and     r4,|<<%0>>%001e|(sp)
<<%0>>%06fa:    jr      nz/ne,_lkfront+%4e
<<%0>>%06fc:    ldl     rr6,rr12(#%0004)
<<%0>>%0700:    ldl     rr4,#%0000000c
<<%0>>%0706:    add     r5,sp
<<%0>>%0708:    ldk     r3,#10
<<%0>>%070a:    call    _lkdata
<<%0>>%0710:    test    r2
<<%0>>%0712:    jr      z/eq,_lkfront+%c6
<<%0>>%0714:    ldb     <<%0>>%0015,#%0e
<<%0>>%071c:    jr      _lkfront+%c2
<<%0>>%071e:    ldb     <<%0>>%0015,#%16
<<%0>>%0726:    subl    rr2,rr2
<<%0>>%0728:    jr      <<%0>>%07ae
<<%0>>%072a:    ld      r2,rr12(#%0002)
<<%0>>%072e:    cp      r2,#%0000
<<%0>>%0732:    jr      lt,_lkfront+%ba
<<%0>>%0734:    cp      r2,#%0007
<<%0>>%0738:    jr      gt,_lkfront+%ba
<<%0>>%073a:    bit     r2,#1
<<%0>>%073c:    jr      z/eq,<<%0>>%0770
<<%0>>%073e:    cp      |<<%0>>%0014|(sp),#%0001
<<%0>>%0744:    jr      nz/ne,_lkfront+%ec
<<%0>>%0746:    ldl     rr2,|<<%0>>%0016|(sp)
<<%0>>%074a:    ldl     rr4,rr2(#%0006)
<<%0>>%074e:    jr      _lkfront+%fc
<<%0>>%0750:    cp      |<<%0>>%0014|(sp),#%0002
<<%0>>%0756:    jr      nz/ne,<<%0>>%0768
<<%0>>%0758:    ldl     rr2,|<<%0>>%001a|(sp)
<<%0>>%075c:    ldl     rr4,rr2(#%000e)
<<%0>>%0760:    addl    rr4,|<<%0>>%0010|(sp)
<<%0>>%0764:    ldl     |<<%0>>%0010|(sp),rr4
<<%0>>%0768:    ldl     rr2,|<<%0>>%0010|(sp)
<<%0>>%076c:    ldl     @rr10,rr2
<<%0>>%076e:    jr      <<%0>>%077a
<<%0>>%0770:    ldl     rr2,|<<%0>>%0016|(sp)
<<%0>>%0774:    ldl     rr4,rr2(#%0006)
<<%0>>%0778:    ldl     @rr10,rr4
<<%0>>%077a:    ldl     rr2,@rr10
<<%0>>%077c:    cpl     rr2,#%00000000
<<%0>>%0782:    jr      lt,_lkfront+%ba
<<%0>>%0784:    ldl     rr2,|<<%0>>%000c|(sp)
<<%0>>%0788:    testl   rr2
<<%0>>%078a:    jr      z/eq,<<%0>>%0794
<<%0>>%078c:    ldl     rr2,@rr10
<<%0>>%078e:    addl    rr2,|<<%0>>%000c|(sp)
<<%0>>%0792:    jr      <<%0>>%079a
<<%0>>%0794:    ldl     rr2,#%40000000
<<%0>>%079a:    ldl     @rr8,rr2
<<%0>>%079c:    ldl     rr2,@rr10
<<%0>>%079e:    cpl     rr2,@rr8
<<%0>>%07a0:    jr      ge,_lkfront+%ba
<<%0>>%07a2:    ldl     rr2,@rr10
<<%0>>%07a4:    ldl     <<%0>>%0028,rr2
<<%0>>%07aa:    ldl     rr2,|<<%0>>%001a|(sp)
<<%0>>%07ae:    ldm     r8,<<%0>>%0024(sp),#6
<<%0>>%07b6:    add     sp,#%0030
<<%0>>%07ba:    ret
