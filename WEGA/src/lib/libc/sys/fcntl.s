fcntl module

  external
    cerror	procedure

  global
    _fcntl procedure
      entry
	ld	r0,r7
	ld	r1,r6
	ld	r2,r5
	sub	r4,r4
	sc	#38
	ld	r2,r4
	ret	nc
	jp	cerror
    end _fcntl
end fcntl
