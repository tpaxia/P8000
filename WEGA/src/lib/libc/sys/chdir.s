chdir module

  external
    cerror	procedure

  global
    _chdir procedure
      entry
	ld	r0,r7
	xor	r4,r4
	sc	#12
	ld	r2,r4
	ret	nc
	jp	cerror
    end _chdir
end chdir
