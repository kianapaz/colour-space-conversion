	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"csc1.c"
	.text
	.align	2
	.global	convert_rgb_to_ycc
	.type	convert_rgb_to_ycc, %function
convert_rgb_to_ycc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	fstmfdd	sp!, {d8}
	ldr	r2, [r0, #4]
	sub	sp, sp, #16
	cmp	r2, #0
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	ldr	r3, [r1, #12]
	ble	.L6
	flds	s8, .L9+72
	str	r3, [sp, #12]
	ldr	r9, [r0, #0]
	fldd	d0, .L9
	fldd	d1, .L9+8
	fldd	d2, .L9+16
	mov	fp, #0
.L3:
	cmp	r9, #0
	ble	.L5
	add	r2, sp, #8
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r6, #0
	ldr	r5, [r3, #0]
	ldr	r4, [r3, #4]
	ldr	r8, [r2, #12]
	fldd	d8, .L9+24
	fldd	d3, .L9+32
	fldd	d31, .L9+40
	fldd	d29, .L9+48
	fldd	d30, .L9+56
	mov	sl, fp, asl #2
	mov	r7, r6
.L4:
	flds	s15, [r5, #4]
	flds	s13, [r5, #0]
	fmuls	s14, s8, s15
	fmuls	s12, s8, s13
	ftosizs	s15, s14
	flds	s14, [r5, #8]
	fsitod	d17, s15
	ftosizs	s13, s12
	fmuls	s15, s8, s14
	flds	s12, [r5, #16]
	fsitod	d20, s13
	ftosizs	s14, s15
	flds	s13, [r5, #12]
	fmuls	s11, s8, s12
	fmuld	d16, d17, d1
	flds	s12, [r5, #20]
	fsitod	d21, s14
	fmuls	s10, s8, s13
	ftosizs	s15, s11
	fmuld	d19, d17, d30
	fmuld	d18, d17, d31
	fmacd	d16, d20, d0
	flds	s13, [r4, #4]
	fsitod	d17, s15
	fmuls	s14, s8, s12
	ftosizs	s15, s10
	fmacd	d19, d20, d29
	fmacd	d18, d20, d3
	fmacd	d16, d21, d2
	fldd	d28, .L9+64
	fsitod	d22, s15
	fmuls	s10, s8, s13
	ftosizs	s15, s14
	fmacd	d19, d21, d28
	flds	s14, [r4, #0]
	fmacd	d18, d21, d29
	faddd	d16, d16, d8
	fmuld	d20, d17, d1
	flds	s12, [r4, #8]
	fsitod	d23, s15
	ftosizd	s13, d16
	fmuls	s11, s8, s14
	ftosizs	s15, s10
	faddd	d18, d18, d8
	faddd	d19, d19, d8
	fmuld	d25, d17, d30
	fmuld	d21, d17, d31
	fmacd	d20, d22, d0
	ftosizd	s10, d18
	ftosizd	s9, d19
	fmacd	d20, d23, d2
	fmacd	d25, d22, d29
	fmacd	d21, d22, d3
	fsitod	d26, s13
	fsitod	d22, s15
	flds	s13, [r4, #16]
	ftosizs	s15, s11
	fmuls	s14, s8, s12
	fsitod	d17, s15
	fmacd	d25, d23, d28
	fmacd	d21, d23, d29
	ftosizs	s12, s14
	fmuls	s11, s8, s13
	flds	s14, [r4, #12]
	fsitod	d27, s10
	fsitod	d24, s9
	faddd	d26, d26, d20
	fmuld	d18, d22, d1
	fsitod	d16, s12
	faddd	d24, d24, d25
	flds	s12, [r4, #20]
	ftosizs	s15, s11
	faddd	d27, d27, d21
	fmuld	d20, d22, d30
	fmuld	d19, d22, d31
	ftosizd	s13, d26
	fmacd	d18, d17, d0
	fmuls	s10, s8, s14
	ftosizd	s9, d24
	fmacd	d18, d16, d2
	fsitod	d24, s15
	ftosizs	s14, s10
	fmacd	d20, d17, d29
	ftosizd	s11, d27
	fmacd	d19, d17, d3
	fsitod	d25, s13
	fmuls	s13, s8, s12
	fmacd	d20, d16, d28
	fmacd	d19, d16, d29
	ftosizs	s15, s13
	fsitod	d16, s14
	fsitod	d17, s11
	fsitod	d23, s9
	faddd	d25, d25, d18
	fmuld	d22, d24, d1
	faddd	d17, d17, d19
	faddd	d23, d23, d20
	ftosizd	s14, d25
	fsitod	d20, s15
	fmacd	d22, d16, d0
	fmuld	d19, d24, d31
	ftosizd	s15, d17
	fmacd	d19, d16, d3
	fsitod	d18, s14
	fmuld	d21, d24, d30
	fmacd	d22, d20, d2
	fmacd	d21, d16, d29
	ftosizd	s13, d23
	fsitod	d17, s15
	fmacd	d19, d20, d29
	faddd	d18, d18, d22
	fsitod	d16, s13
	ftosizd	s15, d18
	fmacd	d21, d20, d28
	faddd	d17, d17, d19
	fmrs	r3, s15	@ int
	faddd	d16, d16, d21
	ftosizd	s15, d17
	fmrs	r1, s15	@ int
	ftosizd	s15, d16
	add	r2, r3, #3
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #2
	fmrs	r0, s15	@ int
	fmsr	s15, r3	@ int
	add	r2, r1, #3
	cmp	r1, #0
	movlt	r1, r2
	mov	r1, r1, asr #2
	fsitos	s9, s15
	fmsr	s15, r1	@ int
	cmp	r0, #0
	add	ip, r0, #3
	movlt	r0, ip
	mov	r0, r0, asr #2
	fsitos	s12, s15
	fmsr	s15, r0	@ int
	flds	s14, .L9+76
	fconsts	s13, #48
	fsitos	s11, s15
	flds	s15, .L9+80
	fmacs	s13, s9, s14
	fcpys	s10, s15
	fmrs	r2, s13
	fmacs	s10, s12, s14
	fmacs	s15, s11, s14
	ldr	r3, [r8, sl]
	add	r6, r6, #1
	str	r2, [r3, r7]!	@ float
	cmp	r9, r6
	fsts	s15, [r3, #8]
	fsts	s10, [r3, #4]
	add	r5, r5, #24
	add	r4, r4, #24
	add	r7, r7, #12
	bgt	.L4
.L5:
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #4]
	add	fp, fp, #1
	add	r2, r2, #8
	cmp	r3, fp
	str	r2, [sp, #12]
	bgt	.L3
.L6:
	add	sp, sp, #16
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L10:
	.align	3
.L9:
	.word	549755814
	.word	1070625456
	.word	-1683627180
	.word	1071653060
	.word	721554506
	.word	1069094535
	.word	0
	.word	0
	.word	-68719477
	.word	-1077743191
	.word	1992864825
	.word	-1076715586
	.word	1958505087
	.word	1071388819
	.word	-549755814
	.word	-1076392625
	.word	1443109011
	.word	-1078842098
	.word	1149239296
	.word	973078528
	.word	1124073472
	.size	convert_rgb_to_ycc, .-convert_rgb_to_ycc
	.align	2
	.global	convert_ycc_to_rgb
	.type	convert_ycc_to_rgb, %function
convert_ycc_to_rgb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	ldr	r2, [r0, #4]
	cmp	r2, #0
	sub	sp, sp, #8
	mov	r9, r0
	mov	r6, r1
	ble	.L16
	fconsts	s3, #48
	flds	s4, .L18+40
	mov	r1, #0
	ldr	r3, [r0, #0]
	str	r1, [sp, #4]
	fldd	d20, .L18
	fldd	d19, .L18+8
	mov	r7, #4
.L13:
	cmp	r3, #0
	ble	.L15
	flds	s5, .L18+44
	ldr	r3, [sp, #4]
	mov	sl, #0
	fldd	d18, .L18+16
	fldd	d17, .L18+24
	fldd	d16, .L18+32
	mov	fp, r3, asl #2
	mov	r8, r3, asl #3
	mov	r5, sl
.L14:
	ldr	r3, [r9, #12]
	ldr	r2, [r3, fp]
	add	r3, r2, r5, asl #1
	flds	s10, [r3, #0]
	fsubs	s10, s10, s3
	mov	r3, r5, asl #1
	add	r2, r2, r3
	flds	s12, [r2, #8]
	fcvtds	d5, s10
	flds	s8, [r2, #4]
	fmuld	d7, d5, d20
	fsubs	s12, s12, s4
	fcpyd	d5, d7
	fcvtds	d6, s12
	fsubs	s8, s8, s4
	fcpyd	d3, d7
	fmacd	d5, d6, d18
	fcvtds	d4, s8
	fmacd	d3, d6, d19
	fmacd	d5, d4, d17
	fmacd	d7, d4, d16
	fcvtsd	s6, d3
	fcvtsd	s10, d5
	fcvtsd	s14, d7
	fmuls	s13, s6, s5
	fmuls	s12, s10, s5
	fmuls	s9, s14, s5
	ftouizs	s13, s13
	ftouizs	s12, s12
	ftouizs	s9, s9
	fmrs	r0, s13	@ int
	fmrs	ip, s12	@ int
	fmrs	r4, s9	@ int
	ldr	r3, [r6, #12]
	ldr	r1, [r3, r8]
	and	r0, r0, #255
	strb	r0, [r1, r5]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r8]
	and	ip, ip, #255
	add	r3, r3, r5
	strb	ip, [r3, #1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r8]
	and	r4, r4, #255
	add	r3, r3, r5
	strb	r4, [r3, #2]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r8]
	add	r1, r5, #3
	strb	r0, [r3, r1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, r1
	strb	ip, [r3, #1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r8]
	add	r3, r3, r1
	strb	r4, [r3, #2]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	strb	r0, [r3, r5]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, r5
	strb	ip, [r3, #1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, r5
	strb	r4, [r3, #2]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	strb	r0, [r3, r1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, r1
	strb	ip, [r3, #1]
	ldr	r2, [r6, #12]
	ldr	r3, [r2, r7]
	add	r3, r3, r1
	strb	r4, [r3, #2]
	ldr	r3, [r9, #0]
	add	sl, sl, #1
	cmp	r3, sl
	add	r5, r5, #6
	bgt	.L14
	ldr	r2, [r9, #4]
.L15:
	ldr	r1, [sp, #4]
	add	r1, r1, #1
	cmp	r2, r1
	str	r1, [sp, #4]
	add	r7, r7, #8
	bgt	.L13
.L16:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L19:
	.align	3
.L18:
	.word	1992864825
	.word	1072865214
	.word	1271310320
	.word	1073318199
	.word	-1821066134
	.word	-1075182568
	.word	-584115552
	.word	-1076296156
	.word	790273982
	.word	1073751261
	.word	1124073472
	.word	1132462080
	.size	convert_ycc_to_rgb, .-convert_ycc_to_rgb
	.align	2
	.global	free_rgb_array
	.type	free_rgb_array, %function
free_rgb_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	ble	.L21
	mov	r4, #0
.L22:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L22
.L21:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	free_rgb_array, .-free_rgb_array
	.align	2
	.global	free_ycc_array
	.type	free_ycc_array, %function
free_ycc_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	ble	.L26
	mov	r4, #0
.L27:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L27
.L26:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	free_ycc_array, .-free_ycc_array
	.align	2
	.global	free_pixel_array
	.type	free_pixel_array, %function
free_pixel_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	cmp	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	ble	.L31
	mov	r4, #0
.L32:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L32
.L31:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	free_pixel_array, .-free_pixel_array
	.align	2
	.global	free_bmp_info
	.type	free_bmp_info, %function
free_bmp_info:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #56]
	bl	free
	mov	r0, r4
	bl	free
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	free_bmp_info, .-free_bmp_info
	.align	2
	.global	mmalloc
	.type	mmalloc, %function
mmalloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	malloc
	cmp	r0, #0
	beq	.L40
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	ldr	r0, .L41
	bl	puts
	mvn	r0, #0
	bl	exit
.L42:
	.align	2
.L41:
	.word	.LC0
	.size	mmalloc, .-mmalloc
	.align	2
	.global	write_to_bmp
	.type	write_to_bmp, %function
write_to_bmp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	r4, r0
	sub	sp, sp, #8
	mov	r8, r1
	ldr	r0, .L53
	ldr	r1, .L53+4
	bl	fopen
	mov	r7, r0
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	mov	r0, r4
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, r1
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #8
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #10
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #12
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #16
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #20
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #24
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #28
	bl	fwrite
	mov	r1, #2
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #30
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #32
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #36
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #40
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #44
	bl	fwrite
	mov	r1, #4
	mov	r2, #1
	mov	r3, r7
	add	r0, r4, #48
	bl	fwrite
	mov	r3, r7
	add	r0, r4, #52
	mov	r1, #4
	mov	r2, #1
	bl	fwrite
	ldr	r3, [r8, #4]
	cmp	r3, #0
	addgt	sl, sp, #8
	movgt	r3, #48
	strgtb	r3, [sl, #-1]!
	movgt	r9, #0
	ble	.L50
.L45:
	ldr	r3, [r8, #0]
	cmp	r3, #0
	movgt	r6, #0
	movgt	r5, r9, asl #2
	movgt	r4, r6
	ble	.L49
.L46:
	ldr	r3, [r8, #12]
	ldr	r0, [r3, r5]
	mov	r1, #1
	add	r0, r0, r4
	mov	r2, r1
	mov	r3, r7
	add	r0, r0, #2
	bl	fwrite
	ldr	r3, [r8, #12]
	ldr	r0, [r3, r5]
	mov	r1, #1
	add	r0, r0, r4
	mov	r2, r1
	add	r0, r0, r1
	mov	r3, r7
	bl	fwrite
	ldr	r3, [r8, #12]
	ldr	r0, [r3, r5]
	mov	r1, #1
	add	r0, r0, r4
	mov	r3, r7
	mov	r2, r1
	bl	fwrite
	ldr	r3, [r8, #0]
	add	r6, r6, #1
	cmp	r6, r3
	add	r4, r4, #3
	blt	.L46
.L49:
	ldrsb	r3, [r8, #10]
	cmp	r3, #0
	ble	.L47
	mov	r4, #0
.L48:
	mov	r1, #1
	mov	r3, r7
	mov	r0, sl
	mov	r2, r1
	bl	fwrite
	ldrsb	r3, [r8, #10]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L48
.L47:
	ldr	r3, [r8, #4]
	add	r9, r9, #1
	cmp	r9, r3
	blt	.L45
.L50:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LC1
	.word	.LC2
	.size	write_to_bmp, .-write_to_bmp
	.align	2
	.global	get_bmp_info
	.type	get_bmp_info, %function
get_bmp_info:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r1, .L62
	sub	sp, sp, #96
	mov	r4, r0
	bl	fopen
	subs	r6, r0, #0
	beq	.L61
	mov	r0, #60
	bl	malloc
	subs	r5, r0, #0
	beq	.L60
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, r1
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #8
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #10
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #12
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #16
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #20
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #24
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #28
	bl	fread
	mov	r1, #2
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #30
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #32
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #36
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #40
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #44
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #48
	bl	fread
	mov	r1, #4
	mov	r2, #1
	mov	r3, r6
	add	r0, r5, #52
	bl	fread
	ldr	r7, [r5, #4]
	mov	r0, r7
	bl	malloc
	subs	r8, r0, #0
	beq	.L60
	mov	r0, r4
	mov	r1, #0
	bl	open
	add	r2, sp, #8
	mov	r4, r0
	mov	r1, r0
	mov	r0, #3
	bl	__fxstat
	mov	ip, #0
	mov	r2, #1
	mov	r0, ip
	ldr	r1, [sp, #52]
	mov	r3, r2
	stmia	sp, {r4, ip}	@ phole stm
	bl	mmap
	ldr	r3, [r5, #12]
	mov	r2, r7
	add	r1, r0, r3
	mov	r0, r8
	bl	memcpy
	str	r8, [r5, #56]
	mov	r0, r4
	bl	close
	mov	r0, r6
	bl	fclose
	mov	r0, r5
	add	sp, sp, #96
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	ldr	r0, .L62+4
	bl	puts
	mvn	r0, #0
	bl	exit
.L61:
	mov	r1, r4
	ldr	r0, .L62+8
	bl	printf
	mov	r0, r6
	bl	fclose
	mvn	r0, #0
	bl	exit
.L63:
	.align	2
.L62:
	.word	.LC3
	.word	.LC0
	.word	.LC4
	.size	get_bmp_info, .-get_bmp_info
	.align	2
	.global	allocate_ycc_array
	.type	allocate_ycc_array, %function
allocate_ycc_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	mov	r0, #16
	bl	malloc
	subs	r5, r0, #0
	beq	.L73
	ldr	r0, [r4, #4]
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	str	r0, [r5, #4]
	ldr	r3, [r4, #0]
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [r5, #0]
	mov	r0, r0, asl #2
	bl	malloc
	subs	r6, r0, #0
	beq	.L73
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L67
	mov	r4, #0
.L69:
	ldr	r3, [r5, #0]
	mov	r0, r3, asl #4
	sub	r0, r0, r3, asl #2
	bl	malloc
	cmp	r0, #0
	beq	.L73
	ldr	r3, [r5, #4]
	str	r0, [r6, r4, asl #2]
	add	r4, r4, #1
	cmp	r3, r4
	bgt	.L69
.L67:
	str	r6, [r5, #12]
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L73:
	ldr	r0, .L74
	bl	puts
	mvn	r0, #0
	bl	exit
.L75:
	.align	2
.L74:
	.word	.LC0
	.size	allocate_ycc_array, .-allocate_ycc_array
	.align	2
	.type	get_rgb_pixel_array, %function
get_rgb_pixel_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	fstmfdd	sp!, {d8}
	mov	sl, r1
	ldr	r1, [r1, #4]
	sub	sp, sp, #28
	ands	r3, r1, #1
	movne	r2, r1
	str	r1, [sp, #8]
	addne	r2, r2, #1
	ldr	r1, [sl, #0]
	ldrb	r6, [sl, #10]	@ zero_extendqisi2
	movne	r3, #1
	strne	r2, [sp, #8]
	str	r3, [sp, #16]
	ands	r3, r1, #1
	movne	r2, r1
	str	r1, [sp, #4]
	ldr	r1, [sp, #8]
	addne	r2, r2, #1
	movne	r3, #1
	mov	r4, r0
	mov	r0, r1, asl #2
	strne	r2, [sp, #4]
	str	r3, [sp, #12]
	bl	malloc
	subs	fp, r0, #0
	beq	.L103
	mov	r0, #12
	bl	malloc
	subs	r5, r0, #0
	beq	.L103
	ldr	r3, [sl, #4]
	cmp	r3, #0
	ble	.L83
	flds	s16, .L104
	ldr	r1, [sp, #4]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	mov	r2, r6, asl #24
	str	r3, [sp, #20]
	mov	r9, r2, asr #24
	mov	r8, #0
.L88:
	ldr	r0, [sp, #20]
	bl	malloc
	subs	r7, r0, #0
	beq	.L103
	ldr	r6, [sl, #0]
	cmp	r6, #0
	str	r7, [fp, r8, asl #2]
	ble	.L85
	mov	lr, #0
	mov	ip, lr
.L86:
	ldrb	r3, [r4, #0]	@ zero_extendqisi2
	fmsr	s14, r3	@ int
	fuitos	s15, s14
	fmuls	s14, s15, s16
	fsts	s14, [r5, #8]
	ldrb	r3, [r4, #1]	@ zero_extendqisi2
	fmsr	s14, r3	@ int
	fuitos	s15, s14
	fmuls	s14, s15, s16
	fsts	s14, [r5, #4]
	ldrb	r3, [r4, #2]	@ zero_extendqisi2
	fmsr	s14, r3	@ int
	fuitos	s15, s14
	fmuls	s14, s15, s16
	fsts	s14, [r5, #0]
	add	lr, lr, #1
	ldmia	r5, {r0, r1, r2}
	add	r3, r7, ip
	cmp	r6, lr
	stmia	r3, {r0, r1, r2}
	add	r4, r4, #3
	add	ip, ip, #12
	bgt	.L86
.L85:
	ldr	r3, [sl, #4]
	cmp	r9, #0
	add	r8, r8, #1
	addgt	r4, r4, r9
	cmp	r3, r8
	bgt	.L88
.L83:
	ldr	r1, [sp, #16]
	cmp	r1, #0
	beq	.L89
	ldr	r6, [sl, #0]
	cmp	r6, #0
	ble	.L90
	ldr	r2, [sp, #8]
	mov	r3, r2, asl #2
	sub	r3, r3, #4
	sub	r2, r2, #2
	mov	lr, #0
	ldr	r7, [fp, r3]
	ldr	r4, [fp, r2, asl #2]
	mov	ip, lr
.L91:
	add	r3, r4, ip
	ldmia	r3, {r0, r1, r2}
	add	lr, lr, #1
	add	r3, r7, ip
	cmp	r6, lr
	stmia	r3, {r0, r1, r2}
	add	ip, ip, #12
	bgt	.L91
.L90:
	ldr	r3, [sp, #8]
	str	r3, [sl, #4]
.L89:
	ldr	r1, [sp, #12]
	cmp	r1, #0
	beq	.L92
	ldr	r2, [sp, #8]
	cmp	r2, #0
	ble	.L93
	ldr	r1, [sp, #4]
	mov	r3, r1, asl #4
	sub	r3, r3, r1, asl #2
	sub	r6, r3, #24
	sub	r4, r3, #12
	mov	lr, #0
.L94:
	ldr	ip, [fp, lr, asl #2]
	add	r3, ip, r6
	ldmia	r3, {r0, r1, r2}
	ldr	r3, [sp, #8]
	add	lr, lr, #1
	add	ip, ip, r4
	cmp	r3, lr
	stmia	ip, {r0, r1, r2}
	bgt	.L94
.L93:
	ldr	r1, [sp, #4]
	mov	r2, r1, asr #31
	mov	r2, r2, lsr #30
	add	r3, r1, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [sl, #10]
	str	r1, [sl, #0]
.L92:
	str	fp, [sl, #12]
	mov	r0, r5
	bl	free
	add	sp, sp, #28
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L103:
	ldr	r0, .L104+4
	bl	puts
	mvn	r0, #0
	bl	exit
.L105:
	.align	2
.L104:
	.word	998244352
	.word	.LC0
	.size	get_rgb_pixel_array, .-get_rgb_pixel_array
	.align	2
	.global	get_pixel_array
	.type	get_pixel_array, %function
get_pixel_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r5, r0
	mov	r0, #16
	bl	malloc
	subs	r4, r0, #0
	beq	.L109
	ldr	r1, [r5, #20]
	mov	r2, r1, asr #31
	mov	r2, r2, lsr #30
	add	r3, r1, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [r4, #10]
	str	r1, [r4, #0]
	ldr	r3, [r5, #24]
	str	r3, [r4, #4]
	ldrh	r3, [r5, #30]
	ldr	r0, [r5, #56]
	strh	r3, [r4, #8]	@ movhi
	mov	r1, r4
	bl	get_rgb_pixel_array
	mov	r0, r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L109:
	ldr	r0, .L110
	bl	puts
	mvn	r0, #0
	bl	exit
.L111:
	.align	2
.L110:
	.word	.LC0
	.size	get_pixel_array, .-get_pixel_array
	.align	2
	.global	allocate_rgb_array
	.type	allocate_rgb_array, %function
allocate_rgb_array:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r0, #16
	mov	r4, r1
	mov	r5, r2
	bl	malloc
	subs	r8, r0, #0
	beq	.L121
	strb	r5, [r8, #10]
	stmia	r8, {r4, r6}	@ phole stm
	mov	r0, r6, asl #2
	bl	malloc
	subs	r7, r0, #0
	beq	.L121
	cmp	r6, #0
	ble	.L115
	mov	r3, r4, asl #1
	add	r5, r3, r4
	mov	r4, #0
.L117:
	mov	r0, r5
	bl	malloc
	cmp	r0, #0
	beq	.L121
	str	r0, [r7, r4, asl #2]
	add	r4, r4, #1
	cmp	r6, r4
	bgt	.L117
.L115:
	str	r7, [r8, #12]
	mov	r0, r8
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L121:
	ldr	r0, .L122
	bl	puts
	mvn	r0, #0
	bl	exit
.L123:
	.align	2
.L122:
	.word	.LC0
	.size	allocate_rgb_array, .-allocate_rgb_array
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	fstmfdd	sp!, {d8}
	sub	sp, sp, #44
	mov	r4, r0
	mov	r5, r1
	add	r0, sp, #32
	mov	r1, #0
	bl	gettimeofday
	bl	clock
	str	r0, [sp, #8]
	mov	r1, r0
	ldr	r0, .L154
	bl	printf
	cmp	r4, #2
	bne	.L152
	ldr	r0, [r5, #4]
	bl	get_bmp_info
	str	r0, [sp, #12]
	mov	r0, #16
	bl	malloc
	subs	r7, r0, #0
	beq	.L151
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #20]
	str	r2, [r7, #0]
	ldr	r3, [r3, #20]
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #30
	add	r3, r3, r2
	and	r3, r3, #3
	rsb	r3, r2, r3
	strb	r3, [r7, #10]
	ldr	r3, [sp, #12]
	ldr	r2, [r3, #24]
	str	r2, [r7, #4]
	ldrh	r2, [r3, #30]
	ldr	r0, [r3, #56]
	strh	r2, [r7, #8]	@ movhi
	mov	r1, r7
	bl	get_rgb_pixel_array
	bl	clock
	mov	r1, r0
	ldr	r0, .L154
	bl	printf
	ldrsh	r3, [r7, #8]
	cmp	r3, #24
	beq	.L153
	ldr	r0, .L154+4
	bl	puts
.L141:
	ldr	r2, [sp, #12]
	ldr	r0, [r2, #56]
	bl	free
	ldr	r0, [sp, #12]
	bl	free
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ble	.L142
	mov	r4, #0
.L143:
	ldr	r3, [r7, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r7, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L143
.L142:
	ldr	r0, [r7, #12]
	bl	free
	mov	r0, r7
	bl	free
	bl	clock
	ldr	r1, [sp, #8]
	mov	r4, r0
	ldr	r0, .L154
	bl	printf
	mov	r1, r4
	ldr	r0, .L154
	bl	printf
	ldr	r3, [sp, #8]
	ldr	r0, .L154
	rsb	r1, r3, r4
	bl	printf
	mov	r1, #0
	add	r0, sp, #24
	bl	gettimeofday
	ldr	r2, [sp, #24]
	mov	r3, r2, asl #8
	sub	r3, r3, r2, asl #3
	ldr	ip, [sp, #32]
	mov	r1, r3, asl #6
	rsb	r1, r3, r1
	mov	r0, ip, asl #8
	ldr	r3, [sp, #36]
	add	r1, r1, r2
	sub	r0, r0, ip, asl #3
	mov	r1, r1, asl #6
	mov	r2, r0, asl #6
	rsb	r1, r3, r1
	ldr	r3, [sp, #28]
	rsb	r2, r0, r2
	add	r1, r1, r3
	add	r2, r2, ip
	sub	r1, r1, r2, asl #6
	ldr	r0, .L154+8
	bl	printf
	mov	r0, #0
	add	sp, sp, #44
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	.LC5
	.word	.LC8
	.word	.LC9
	.word	.LC7
	.word	1149239296
.L153:
	ldr	r0, .L154+12
	bl	printf
	mov	r0, r7
	bl	allocate_ycc_array
	ldr	r3, [r0, #4]
	cmp	r3, #0
	str	r3, [sp, #4]
	str	r0, [sp, #16]
	ldr	r3, [r7, #12]
	ble	.L128
	flds	s8, .L154+16
	str	r3, [sp, #20]
	ldr	r9, [r0, #0]
	fldd	d0, .L156
	fldd	d1, .L156+8
	fldd	d2, .L156+16
	mov	fp, #0
.L129:
	cmp	r9, #0
	ble	.L131
	add	r2, sp, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r5, #0
	ldmia	r3, {r4, lr}	@ phole ldm
	ldr	r8, [r2, #12]
	fldd	d8, .L156+24
	fldd	d3, .L156+32
	fldd	d31, .L156+40
	fldd	d29, .L156+48
	fldd	d30, .L156+56
	mov	sl, fp, asl #2
	mov	r6, r5
.L130:
	flds	s15, [r4, #4]
	flds	s13, [r4, #0]
	fmuls	s14, s8, s15
	fmuls	s12, s8, s13
	ftosizs	s15, s14
	flds	s14, [r4, #8]
	fsitod	d17, s15
	ftosizs	s13, s12
	fmuls	s15, s8, s14
	flds	s12, [r4, #16]
	fsitod	d20, s13
	ftosizs	s14, s15
	flds	s13, [r4, #12]
	fmuls	s11, s8, s12
	fmuld	d16, d17, d1
	flds	s12, [r4, #20]
	fsitod	d21, s14
	fmuls	s10, s8, s13
	ftosizs	s15, s11
	fmuld	d19, d17, d30
	fmuld	d18, d17, d31
	fmacd	d16, d20, d0
	flds	s13, [lr, #4]
	fsitod	d17, s15
	fmuls	s14, s8, s12
	ftosizs	s15, s10
	fmacd	d19, d20, d29
	fmacd	d18, d20, d3
	fmacd	d16, d21, d2
	fldd	d28, .L156+64
	fsitod	d22, s15
	fmuls	s10, s8, s13
	ftosizs	s15, s14
	fmacd	d19, d21, d28
	flds	s14, [lr, #0]
	fmacd	d18, d21, d29
	faddd	d16, d16, d8
	fmuld	d20, d17, d1
	flds	s12, [lr, #8]
	fsitod	d23, s15
	ftosizd	s13, d16
	fmuls	s11, s8, s14
	ftosizs	s15, s10
	faddd	d18, d18, d8
	faddd	d19, d19, d8
	fmuld	d25, d17, d30
	fmuld	d21, d17, d31
	fmacd	d20, d22, d0
	ftosizd	s10, d18
	ftosizd	s9, d19
	fmacd	d20, d23, d2
	fmacd	d25, d22, d29
	fmacd	d21, d22, d3
	fsitod	d26, s13
	fsitod	d22, s15
	flds	s13, [lr, #16]
	ftosizs	s15, s11
	fmuls	s14, s8, s12
	fsitod	d17, s15
	fmacd	d25, d23, d28
	fmacd	d21, d23, d29
	ftosizs	s12, s14
	fmuls	s11, s8, s13
	flds	s14, [lr, #12]
	fsitod	d27, s10
	fsitod	d24, s9
	faddd	d26, d26, d20
	fmuld	d18, d22, d1
	fsitod	d16, s12
	faddd	d24, d24, d25
	flds	s12, [lr, #20]
	ftosizs	s15, s11
	faddd	d27, d27, d21
	fmuld	d20, d22, d30
	fmuld	d19, d22, d31
	ftosizd	s13, d26
	fmacd	d18, d17, d0
	fmuls	s10, s8, s14
	ftosizd	s9, d24
	fmacd	d18, d16, d2
	fsitod	d24, s15
	ftosizs	s14, s10
	fmacd	d20, d17, d29
	ftosizd	s11, d27
	fmacd	d19, d17, d3
	fsitod	d25, s13
	fmuls	s13, s8, s12
	fmacd	d20, d16, d28
	fmacd	d19, d16, d29
	ftosizs	s15, s13
	fsitod	d16, s14
	fsitod	d17, s11
	fsitod	d23, s9
	faddd	d25, d25, d18
	fmuld	d22, d24, d1
	faddd	d17, d17, d19
	faddd	d23, d23, d20
	ftosizd	s14, d25
	fsitod	d20, s15
	fmacd	d22, d16, d0
	fmuld	d19, d24, d31
	ftosizd	s15, d17
	fmacd	d19, d16, d3
	fsitod	d18, s14
	fmuld	d21, d24, d30
	fmacd	d22, d20, d2
	fmacd	d21, d16, d29
	ftosizd	s13, d23
	fsitod	d17, s15
	fmacd	d19, d20, d29
	faddd	d18, d18, d22
	fsitod	d16, s13
	ftosizd	s15, d18
	fmacd	d21, d20, d28
	faddd	d17, d17, d19
	fmrs	r3, s15	@ int
	faddd	d16, d16, d21
	ftosizd	s15, d17
	fmrs	r1, s15	@ int
	ftosizd	s15, d16
	add	r2, r3, #3
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #2
	fmrs	r0, s15	@ int
	fmsr	s15, r3	@ int
	add	r2, r1, #3
	cmp	r1, #0
	movlt	r1, r2
	mov	r1, r1, asr #2
	fsitos	s9, s15
	fmsr	s15, r1	@ int
	cmp	r0, #0
	add	ip, r0, #3
	movlt	r0, ip
	mov	r0, r0, asr #2
	fsitos	s12, s15
	fmsr	s15, r0	@ int
	flds	s14, .L156+72
	fconsts	s13, #48
	fsitos	s11, s15
	flds	s15, .L156+76
	fmacs	s13, s9, s14
	fcpys	s10, s15
	fmrs	r2, s13
	fmacs	s10, s12, s14
	fmacs	s15, s11, s14
	ldr	r3, [r8, sl]
	add	r5, r5, #1
	str	r2, [r3, r6]!	@ float
	cmp	r9, r5
	fsts	s15, [r3, #8]
	fsts	s10, [r3, #4]
	add	r4, r4, #24
	add	lr, lr, #24
	add	r6, r6, #12
	bgt	.L130
.L131:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #4]
	add	fp, fp, #1
	add	r2, r2, #8
	cmp	r3, fp
	str	r2, [sp, #20]
	bgt	.L129
.L128:
	mov	r0, #16
	ldmia	r7, {r4, r8}	@ phole ldm
	ldrb	r6, [r7, #10]	@ zero_extendqisi2
	bl	malloc
	subs	r5, r0, #0
	beq	.L151
	strb	r6, [r5, #10]
	stmia	r5, {r4, r8}	@ phole stm
	mov	r0, r8, asl #2
	bl	malloc
	subs	sl, r0, #0
	beq	.L151
	cmp	r8, #0
	ble	.L134
	mov	r3, r4, asl #1
	add	r6, r3, r4
	mov	r4, #0
.L136:
	mov	r0, r6
	bl	malloc
	cmp	r0, #0
	beq	.L151
	str	r0, [sl, r4, asl #2]
	add	r4, r4, #1
	cmp	r8, r4
	bgt	.L136
.L134:
	ldr	r0, [sp, #16]
	mov	r1, r5
	str	sl, [r5, #12]
	bl	convert_ycc_to_rgb
	ldr	r0, [sp, #12]
	mov	r1, r5
	bl	write_to_bmp
	ldr	r2, [sp, #16]
	ldr	r3, [r2, #4]
	cmp	r3, #0
	ble	.L137
	ldr	r2, [sp, #16]
	mov	r4, #0
.L138:
	ldr	r3, [r2, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r2, [sp, #16]
	ldr	r3, [r2, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L138
.L137:
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #12]
	bl	free
	ldr	r0, [sp, #16]
	bl	free
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L139
	mov	r4, #0
.L140:
	ldr	r3, [r5, #12]
	ldr	r0, [r3, r4, asl #2]
	bl	free
	ldr	r3, [r5, #4]
	add	r4, r4, #1
	cmp	r4, r3
	blt	.L140
	b	.L157
.L158:
	.align	3
.L156:
	.word	549755814
	.word	1070625456
	.word	-1683627180
	.word	1071653060
	.word	721554506
	.word	1069094535
	.word	0
	.word	0
	.word	-68719477
	.word	-1077743191
	.word	1992864825
	.word	-1076715586
	.word	1958505087
	.word	1071388819
	.word	-549755814
	.word	-1076392625
	.word	1443109011
	.word	-1078842098
	.word	973078528
	.word	1124073472
	.word	.LC0
	.word	.LC6
.L157:
.L139:
	ldr	r0, [r5, #12]
	bl	free
	mov	r0, r5
	bl	free
	b	.L141
.L151:
	ldr	r0, .L156+80
	bl	puts
	mvn	r0, #0
	bl	exit
.L152:
	ldr	r0, .L156+84
	bl	puts
	mvn	r0, #0
	bl	exit
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Error allocating memory. Exiting.\000"
	.space	2
.LC1:
	.ascii	"converted.bmp\000"
	.space	2
.LC2:
	.ascii	"wb\000"
	.space	1
.LC3:
	.ascii	"rb\000"
	.space	1
.LC4:
	.ascii	"Unable to open file: %s. Exiting.\012\000"
	.space	1
.LC5:
	.ascii	"%f\012\000"
.LC6:
	.ascii	"Usage: ./csc <bmp_file_name>\000"
	.space	3
.LC7:
	.ascii	"Proper input file. Converting now\000"
	.space	2
.LC8:
	.ascii	"Can only read 24bpp bmp files to convert from rgb t"
	.ascii	"o ycc.\000"
	.space	2
.LC9:
	.ascii	"Time in clock: %f\012\000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
