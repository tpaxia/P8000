! @[$] link.s	2.1  09/12/83 11:41:52 - 87wega3.2 !

link module

  external
    cerror	procedure

  global
    _link procedure
      entry
	ld	r0,r7
	ld	r1,r6
	xor	r4,r4
	sc	#9
	ld	r2,r4
	ret	nc
	jp	cerror
    end _link
end link
