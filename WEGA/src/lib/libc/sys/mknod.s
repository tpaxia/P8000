! @[$] mknod.s	2.1  09/12/83 11:42:25 - 87wega3.2 !

mknod module

  external
    cerror	procedure

  global
    _mknod procedure
      entry
	ld	r0,r7
	ld	r1,r6
	ld	r2,r5
	xor	r4,r4
	sc	#14
	ld	r2,r4
	ret	nc
	jp	cerror
    end _mknod
end mknod
