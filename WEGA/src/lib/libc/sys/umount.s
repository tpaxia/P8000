umount module

  external
    _cerror

  global
    umount procedure
      entry
	ld	r0,r7
	xor	r4,r4
	sc	#22
	ld	r2,r4
	ret	nc
	jp	cerror
    end umount
end umount
