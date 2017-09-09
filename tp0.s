	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.globl	help_str
	.rdata
	.align	2
	.type	help_str, @object
	.size	help_str, 244
help_str:
	.ascii	"Usage:\n"
	.ascii	"  tp0 -h\n"
	.ascii	"  tp0 -V\n"
	.ascii	"  tp0 [options]\n"
	.ascii	"Options:\n"
	.ascii	"  -V, --version\tPrint version and quit.\n"
	.ascii	"  -h, --help\tPrint this information.\n"
	.ascii	"  -i, --input\tLocation of the input file.\n"
	.ascii	"  -o, --output\tLocation of the output file.\n"
	.ascii	"Examples:\n"
	.ascii	"  tp0 -i ~/input -o\n\000"
	.globl	ENTER
	.type	ENTER, @object
	.size	ENTER, 1
ENTER:
	.byte	10
	.text
	.align	2
	.globl	chargeSpace
	.ent	chargeSpace
chargeSpace:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$zero,8($fp)
	sw	$zero,12($fp)
$L18:
	lw	$v0,12($fp)
	slt	$v0,$v0,123
	bne	$v0,$zero,$L21
	b	$L19
$L21:
	lw	$v0,12($fp)
	sll	$v1,$v0,2
	la	$v0,spaceIndex
	addu	$v1,$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,0($v1)
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L18
$L19:
	li	$v0,97			# 0x61
	sw	$v0,12($fp)
$L22:
	lw	$v0,12($fp)
	slt	$v0,$v0,123
	bne	$v0,$zero,$L25
	b	$L23
$L25:
	lw	$v1,8($fp)
	la	$v0,space
	addu	$v1,$v1,$v0
	lbu	$v0,12($fp)
	sb	$v0,0($v1)
	lw	$v0,12($fp)
	sll	$v1,$v0,2
	la	$v0,spaceIndex
	addu	$v1,$v1,$v0
	lw	$v0,8($fp)
	sw	$v0,0($v1)
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L22
$L23:
	li	$v0,65			# 0x41
	sw	$v0,12($fp)
$L26:
	lw	$v0,12($fp)
	slt	$v0,$v0,91
	bne	$v0,$zero,$L29
	b	$L27
$L29:
	lw	$v1,8($fp)
	la	$v0,space
	addu	$v1,$v1,$v0
	lbu	$v0,12($fp)
	sb	$v0,0($v1)
	lw	$v0,12($fp)
	sll	$v1,$v0,2
	la	$v0,spaceIndex
	addu	$v1,$v1,$v0
	lw	$v0,8($fp)
	sw	$v0,0($v1)
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L26
$L27:
	li	$v0,48			# 0x30
	sw	$v0,12($fp)
$L30:
	lw	$v0,12($fp)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L33
	b	$L31
$L33:
	lw	$v1,8($fp)
	la	$v0,space
	addu	$v1,$v1,$v0
	lbu	$v0,12($fp)
	sb	$v0,0($v1)
	lw	$v0,12($fp)
	sll	$v1,$v0,2
	la	$v0,spaceIndex
	addu	$v1,$v1,$v0
	lw	$v0,8($fp)
	sw	$v0,0($v1)
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L30
$L31:
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	lw	$v1,8($fp)
	la	$v0,space
	addu	$v1,$v1,$v0
	li	$v0,45			# 0x2d
	sb	$v0,0($v1)
	lw	$v0,8($fp)
	sw	$v0,spaceIndex+180
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	lw	$v1,8($fp)
	la	$v0,space
	addu	$v1,$v1,$v0
	li	$v0,95			# 0x5f
	sb	$v0,0($v1)
	lw	$v0,8($fp)
	sw	$v0,spaceIndex+380
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	chargeSpace
	.size	chargeSpace, .-chargeSpace
	.align	2
	.globl	belongsToSpace
	.ent	belongsToSpace
belongsToSpace:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$v0,24($fp)
	slt	$v0,$v0,123
	bne	$v0,$zero,$L35
	sw	$zero,8($fp)
	b	$L34
$L35:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	la	$v0,spaceIndex
	addu	$v0,$v1,$v0
	lw	$v1,0($v0)
	li	$v0,-1			# 0xffffffffffffffff
	xor	$v0,$v1,$v0
	sltu	$v0,$zero,$v0
	sw	$v0,8($fp)
$L34:
	lw	$v0,8($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	belongsToSpace
	.size	belongsToSpace, .-belongsToSpace
	.align	2
	.globl	writeOutFile
	.ent	writeOutFile
writeOutFile:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$a2,64($fp)
	sw	$a3,68($fp)
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	bgez	$v0,$L37
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L36
$L37:
	sw	$zero,28($fp)
$L38:
	lw	$v1,64($fp)
	lw	$v0,60($fp)
	subu	$v1,$v1,$v0
	lw	$v0,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L41
	b	$L39
$L41:
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,56($fp)
	la	$t9,fread
	jal	$ra,$t9
	bne	$v0,$zero,$L42
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L36
$L42:
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,68($fp)
	la	$t9,fwrite
	jal	$ra,$t9
	bne	$v0,$zero,$L40
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L36
$L40:
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L38
$L39:
	la	$a0,ENTER
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,68($fp)
	la	$t9,fwrite
	jal	$ra,$t9
	bne	$v0,$zero,$L44
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L36
$L44:
	sw	$zero,32($fp)
$L36:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	writeOutFile
	.size	writeOutFile, .-writeOutFile
	.align	2
	.globl	readLetter
	.ent	readLetter
readLetter:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$a2,56($fp)
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L46
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L45
$L46:
	lw	$a0,56($fp)
	li	$a1,1			# 0x1
	li	$a2,1			# 0x1
	lw	$a3,48($fp)
	la	$t9,fread
	jal	$ra,$t9
	bne	$v0,$zero,$L47
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L45
$L47:
	sw	$zero,24($fp)
$L45:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	readLetter
	.size	readLetter, .-readLetter
	.align	2
	.globl	capicua
	.ent	capicua
capicua:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	sw	$a2,80($fp)
	sw	$a3,84($fp)
	li	$v0,1			# 0x1
	sb	$v0,26($fp)
	lw	$v1,80($fp)
	lw	$v0,76($fp)
	subu	$v0,$v1,$v0
	sw	$v0,28($fp)
	lw	$v0,76($fp)
	sw	$v0,32($fp)
	lw	$v0,80($fp)
	addu	$v0,$v0,-1
	sw	$v0,36($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L50
	sw	$zero,48($fp)
	b	$L48
$L50:
	lw	$v0,32($fp)
	lw	$v1,36($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L52
	b	$L51
$L52:
	lw	$a0,72($fp)
	lw	$a1,32($fp)
	addu	$a2,$fp,24
	la	$t9,readLetter
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L53
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L48
$L53:
	addu	$v0,$fp,25
	lw	$a0,72($fp)
	lw	$a1,36($fp)
	move	$a2,$v0
	la	$t9,readLetter
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L54
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L48
$L54:
	lb	$v0,24($fp)
	sll	$v1,$v0,1
	lw	$v0,_tolower_tab_
	addu	$v0,$v1,$v0
	addu	$v0,$v0,2
	lh	$v0,0($v0)
	sw	$v0,40($fp)
	lb	$v0,25($fp)
	sll	$v1,$v0,1
	lw	$v0,_tolower_tab_
	addu	$v0,$v1,$v0
	addu	$v0,$v0,2
	lh	$v0,0($v0)
	sw	$v0,44($fp)
	lw	$v1,40($fp)
	lw	$v0,44($fp)
	beq	$v1,$v0,$L55
	sb	$zero,26($fp)
	b	$L51
$L55:
	lw	$v0,36($fp)
	addu	$v0,$v0,-1
	sw	$v0,36($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L50
$L51:
	lbu	$v0,26($fp)
	bne	$v0,$zero,$L56
	sw	$zero,48($fp)
	b	$L48
$L56:
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	lw	$a2,80($fp)
	lw	$a3,84($fp)
	la	$t9,writeOutFile
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L57
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	b	$L48
$L57:
	sw	$zero,48($fp)
$L48:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	capicua
	.size	capicua, .-capicua
	.align	2
	.globl	readFile
	.ent	readFile
readFile:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$v1,72($fp)
	la	$v0,__sF
	beq	$v1,$v0,$L59
	lw	$a0,72($fp)
	move	$a1,$zero
	li	$a2,2			# 0x2
	la	$t9,fseek
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L60
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L58
$L60:
	lw	$a0,72($fp)
	la	$t9,ftell
	jal	$ra,$t9
	bne	$v0,$zero,$L61
	sw	$zero,44($fp)
	b	$L58
$L61:
	lw	$a0,72($fp)
	move	$a1,$zero
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L59
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L58
$L59:
	lw	$v1,76($fp)
	la	$v0,__sF+88
	beq	$v1,$v0,$L63
	lw	$a0,76($fp)
	move	$a1,$zero
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L63
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L58
$L63:
	lw	$a0,72($fp)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	sw	$v0,28($fp)
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,-1
	sw	$v0,4($v1)
	bgez	$v0,$L65
	lw	$a0,72($fp)
	la	$t9,__srget
	jal	$ra,$t9
	sw	$v0,48($fp)
	b	$L66
$L65:
	lw	$v0,72($fp)
	lw	$v1,0($v0)
	move	$a0,$v1
	lbu	$a0,0($a0)
	sw	$a0,48($fp)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
$L66:
	lw	$v0,48($fp)
	sw	$v0,36($fp)
	sb	$zero,40($fp)
$L67:
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L69
	b	$L68
$L69:
	lw	$a0,36($fp)
	la	$t9,belongsToSpace
	jal	$ra,$t9
	beq	$v0,$zero,$L70
	lbu	$v0,40($fp)
	bne	$v0,$zero,$L71
	li	$v0,1			# 0x1
	sb	$v0,40($fp)
	lw	$a0,72($fp)
	la	$t9,ftell
	jal	$ra,$t9
	addu	$v0,$v0,-1
	sw	$v0,24($fp)
$L71:
	lw	$a0,72($fp)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,28($fp)
	b	$L72
$L70:
	sb	$zero,40($fp)
	lw	$a0,72($fp)
	la	$t9,ftell
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,72($fp)
	lw	$a1,24($fp)
	lw	$a2,28($fp)
	lw	$a3,76($fp)
	la	$t9,capicua
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L73
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L58
$L73:
	lw	$v0,28($fp)
	sw	$v0,24($fp)
	lw	$a0,72($fp)
	lw	$a1,32($fp)
	move	$a2,$zero
	la	$t9,fseek
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L72
	li	$v0,1			# 0x1
	sw	$v0,44($fp)
	b	$L58
$L72:
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,-1
	sw	$v0,4($v1)
	bgez	$v0,$L75
	lw	$a0,72($fp)
	la	$t9,__srget
	jal	$ra,$t9
	sw	$v0,52($fp)
	b	$L76
$L75:
	lw	$v0,72($fp)
	lw	$v1,0($v0)
	move	$a0,$v1
	lbu	$a0,0($a0)
	sw	$a0,52($fp)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
$L76:
	lw	$v0,52($fp)
	sw	$v0,36($fp)
	b	$L67
$L68:
	sw	$zero,44($fp)
$L58:
	lw	$v0,44($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	readFile
	.size	readFile, .-readFile
	.align	2
	.globl	equal
	.ent	equal
equal:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	xori	$v0,$v1,0x0
	sltu	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	equal
	.size	equal, .-equal
	.rdata
	.align	2
$LC0:
	.ascii	"-i\000"
	.align	2
$LC1:
	.ascii	"-o\000"
	.align	2
$LC2:
	.ascii	"-V\000"
	.align	2
$LC3:
	.ascii	"-h\000"
	.align	2
$LC4:
	.ascii	"--version\000"
	.align	2
$LC5:
	.ascii	"--help\000"
	.align	2
$LC6:
	.ascii	"--input\000"
	.align	2
$LC7:
	.ascii	"--output\000"
	.data
	.align	2
$LC8:
	.word	$LC0
	.word	$LC1
	.word	$LC2
	.word	$LC3
	.word	$LC4
	.word	$LC5
	.word	$LC6
	.word	$LC7
	.rdata
	.align	2
$LC9:
	.ascii	"\000"
	.align	2
$LC10:
	.ascii	"%s\n\000"
	.align	2
$LC11:
	.ascii	"tp0: version %s\n\000"
	.align	2
$LC12:
	.ascii	"0.2\000"
	.align	2
$LC13:
	.ascii	"Invalid argument: %s\n\000"
	.align	2
$LC14:
	.ascii	"-\000"
	.align	2
$LC15:
	.ascii	"r\000"
	.align	2
$LC16:
	.ascii	"w\000"
	.align	2
$LC17:
	.ascii	"nullStr\000"
	.text
	.align	2
	.globl	argParse
	.ent	argParse
argParse:
	.frame	$fp,104,$ra		# vars= 64, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,104
	.cprestore 16
	sw	$ra,96($sp)
	sw	$fp,92($sp)
	sw	$gp,88($sp)
	move	$fp,$sp
	sw	$a0,104($fp)
	sw	$a1,108($fp)
	sw	$a2,112($fp)
	sw	$a3,116($fp)
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	li	$v0,8			# 0x8
	sw	$v0,28($fp)
	lw	$v0,$LC8
	sw	$v0,32($fp)
	lw	$v0,$LC8+4
	sw	$v0,36($fp)
	lw	$v0,$LC8+8
	sw	$v0,40($fp)
	lw	$v0,$LC8+12
	sw	$v0,44($fp)
	lw	$v0,$LC8+16
	sw	$v0,48($fp)
	lw	$v0,$LC8+20
	sw	$v0,52($fp)
	lw	$v0,$LC8+24
	sw	$v0,56($fp)
	lw	$v0,$LC8+28
	sw	$v0,60($fp)
	la	$v0,$LC9
	sw	$v0,68($fp)
$L79:
	lw	$v0,24($fp)
	lw	$v1,104($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L81
	b	$L80
$L81:
	li	$v0,1			# 0x1
	sb	$v0,72($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L82
	sw	$zero,76($fp)
$L83:
	lw	$v0,76($fp)
	lw	$v1,28($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L86
	b	$L84
$L86:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$a0,$v1,$v0
	lw	$v0,76($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,24
	addu	$v0,$v1,$v0
	addu	$v0,$v0,8
	lw	$a0,0($a0)
	lw	$a1,0($v0)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L85
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	sw	$v0,68($fp)
	sb	$zero,72($fp)
	b	$L84
$L85:
	lw	$v0,76($fp)
	addu	$v0,$v0,1
	sw	$v0,76($fp)
	b	$L83
$L84:
	lw	$a0,68($fp)
	la	$a1,$LC3
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L89
	lw	$a0,68($fp)
	la	$a1,$LC5
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L89
	b	$L88
$L89:
	la	$a0,$LC10
	la	$a1,help_str
	la	$t9,printf
	jal	$ra,$t9
	lw	$v1,116($fp)
	li	$v0,1			# 0x1
	sw	$v0,0($v1)
	sw	$zero,80($fp)
	b	$L78
$L88:
	lw	$a0,68($fp)
	la	$a1,$LC2
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L91
	lw	$a0,68($fp)
	la	$a1,$LC4
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L91
	b	$L90
$L91:
	la	$a0,$LC11
	la	$a1,$LC12
	la	$t9,printf
	jal	$ra,$t9
	lw	$v1,116($fp)
	li	$v0,1			# 0x1
	sw	$v0,0($v1)
	sw	$zero,80($fp)
	b	$L78
$L90:
	lbu	$v0,72($fp)
	beq	$v0,$zero,$L93
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	la	$a0,$LC13
	lw	$a1,0($v0)
	la	$t9,printf
	jal	$ra,$t9
	lw	$v0,112($fp)
	sw	$zero,0($v0)
	li	$v0,1			# 0x1
	sw	$v0,80($fp)
	b	$L78
$L82:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC14
	la	$t9,equal
	jal	$ra,$t9
	sb	$v0,64($fp)
	lw	$a0,68($fp)
	la	$a1,$LC0
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L95
	lw	$a0,68($fp)
	la	$a1,$LC6
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L95
	b	$L94
$L95:
	lbu	$v0,64($fp)
	bne	$v0,$zero,$L94
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC15
	la	$t9,fopen
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,112($fp)
	sw	$v1,0($v0)
	lw	$v0,112($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L97
	li	$v0,1			# 0x1
	sw	$v0,80($fp)
	b	$L78
$L94:
	lw	$a0,68($fp)
	la	$a1,$LC1
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L99
	lw	$a0,68($fp)
	la	$a1,$LC7
	la	$t9,equal
	jal	$ra,$t9
	bne	$v0,$zero,$L99
	b	$L97
$L99:
	lbu	$v0,64($fp)
	bne	$v0,$zero,$L97
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,108($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC16
	la	$t9,fopen
	jal	$ra,$t9
	move	$v1,$v0
	lw	$v0,112($fp)
	addu	$v0,$v0,4
	sw	$v1,0($v0)
	lw	$v0,112($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	bne	$v0,$zero,$L97
	li	$v0,1			# 0x1
	sw	$v0,80($fp)
	b	$L78
$L97:
	la	$v0,$LC17
	sw	$v0,68($fp)
$L93:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L79
$L80:
	sw	$zero,80($fp)
$L78:
	lw	$v0,80($fp)
	move	$sp,$fp
	lw	$ra,96($sp)
	lw	$fp,92($sp)
	addu	$sp,$sp,104
	j	$ra
	.end	argParse
	.size	argParse, .-argParse
	.align	2
	.globl	stdin_capicua
	.ent	stdin_capicua
stdin_capicua:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$a1,28($fp)
	sw	$zero,8($fp)
$L102:
	lw	$v0,8($fp)
	lw	$v1,28($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L104
	b	$L103
$L104:
	lw	$v1,24($fp)
	lw	$v0,8($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	sll	$v1,$v0,1
	lw	$v0,_tolower_tab_
	addu	$v0,$v1,$v0
	addu	$a0,$v0,2
	lw	$v1,28($fp)
	lw	$v0,8($fp)
	subu	$v1,$v1,$v0
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,-1
	lb	$v0,0($v0)
	sll	$v1,$v0,1
	lw	$v0,_tolower_tab_
	addu	$v0,$v1,$v0
	addu	$v0,$v0,2
	lh	$v1,0($a0)
	lh	$v0,0($v0)
	beq	$v1,$v0,$L105
	sw	$zero,12($fp)
	b	$L101
$L105:
	lw	$v0,8($fp)
	addu	$v0,$v0,1
	sw	$v0,8($fp)
	b	$L102
$L103:
	li	$v0,1			# 0x1
	sw	$v0,12($fp)
$L101:
	lw	$v0,12($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	stdin_capicua
	.size	stdin_capicua, .-stdin_capicua
	.align	2
	.globl	read_stdin
	.ent	read_stdin
read_stdin:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	li	$v0,1024			# 0x400
	sw	$v0,24($fp)
	lw	$a0,24($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	la	$a0,__sF
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,32($fp)
	sw	$zero,36($fp)
$L107:
	lb	$v1,32($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L109
	b	$L108
$L109:
	lb	$v0,32($fp)
	move	$a0,$v0
	la	$t9,belongsToSpace
	jal	$ra,$t9
	beq	$v0,$zero,$L110
	lw	$v1,36($fp)
	lw	$v0,24($fp)
	bne	$v1,$v0,$L111
	lw	$v0,24($fp)
	sll	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
$L111:
	addu	$a1,$fp,36
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,28($fp)
	addu	$a0,$a0,$v0
	lbu	$v0,32($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	b	$L112
$L110:
	lw	$a0,28($fp)
	lw	$a1,36($fp)
	la	$t9,stdin_capicua
	jal	$ra,$t9
	beq	$v0,$zero,$L113
	lw	$a0,64($fp)
	la	$a1,$LC10
	lw	$a2,28($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	bgez	$v0,$L113
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
	b	$L106
$L113:
	lw	$a0,28($fp)
	move	$a1,$zero
	lw	$a2,24($fp)
	la	$t9,memset
	jal	$ra,$t9
	sw	$zero,36($fp)
$L112:
	la	$a0,__sF
	la	$t9,fgetc
	jal	$ra,$t9
	sb	$v0,32($fp)
	b	$L107
$L108:
	sw	$zero,40($fp)
$L106:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	read_stdin
	.size	read_stdin, .-read_stdin
	.data
	.align	2
$LC18:
	.word	__sF
	.word	__sF+88
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,$LC18
	sw	$v0,24($fp)
	lw	$v0,$LC18+4
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	addu	$v0,$fp,32
	lw	$a0,56($fp)
	lw	$a1,60($fp)
	addu	$a2,$fp,24
	move	$a3,$v0
	la	$t9,argParse
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L116
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L115
$L116:
	lw	$v0,32($fp)
	beq	$v0,$zero,$L117
	sw	$zero,36($fp)
	b	$L115
$L117:
	la	$t9,chargeSpace
	jal	$ra,$t9
	lw	$v1,24($fp)
	la	$v0,__sF
	bne	$v1,$v0,$L118
	lw	$a0,28($fp)
	la	$t9,read_stdin
	jal	$ra,$t9
	beq	$v0,$zero,$L121
	lw	$v1,28($fp)
	la	$v0,__sF+88
	beq	$v1,$v0,$L120
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L120:
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L115
$L118:
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,readFile
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L122
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L115
$L122:
	lw	$v1,24($fp)
	la	$v0,__sF
	beq	$v1,$v0,$L123
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L123
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L115
$L123:
	lw	$v1,28($fp)
	la	$v0,__sF+88
	beq	$v1,$v0,$L121
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	move	$v1,$v0
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L121
	li	$v0,1			# 0x1
	sw	$v0,36($fp)
	b	$L115
$L121:
	sw	$zero,36($fp)
$L115:
	lw	$v0,36($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	main
	.size	main, .-main

	.comm	space,65

	.comm	spaceIndex,492
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
