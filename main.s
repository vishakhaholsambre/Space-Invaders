	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #18176
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100720640
	.word	startScreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L8
	ldr	r2, .L8+4
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #7296
	mov	lr, #4352
	mov	r3, #0
	mov	r1, #3
	strh	r0, [r2, #8]	@ movhi
	strh	lr, [r2]	@ movhi
	ldr	ip, .L8+24
	ldr	r2, .L8+28
	strh	r3, [ip]	@ movhi
	ldr	r0, .L8+32
	str	r1, [r2]
	ldr	r2, .L8+36
	str	r3, [r0]
	ldrh	r2, [r2, #48]
	ldr	r3, .L8+40
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100679680
	.word	spritesheetTiles
	.word	hideSprites
	.word	hOff
	.word	livesRemaining
	.word	enemiesCaught
	.word	67109120
	.word	buttons
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+8
	mov	r2, #100663296
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	skyPal
	.word	18848
	.word	skyTiles
	.word	100720640
	.word	skyMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L15:
	ldr	r4, .L21+12
	ldrh	r3, [r4]
	ldr	r2, .L21+16
	add	r3, r3, #1
	strh	r3, [r4]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #67108864
	ldrh	r2, [r4]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L20:
	bl	goToGame
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	b	.L15
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	waitForVBlank
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+8
	mov	r2, #100663296
	ldr	r1, .L25+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+16
	ldr	r1, .L25+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	pausePal
	.word	18368
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L34
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToGame
.L35:
	.align	2
.L34:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L38
	mov	r2, #83886080
	ldr	r1, .L38+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+8
	mov	r2, #100663296
	ldr	r1, .L38+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+16
	ldr	r1, .L38+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L38+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L39:
	.align	2
.L38:
	.word	DMANow
	.word	winPal
	.word	18528
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L47+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L40
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
.L40:
	pop	{r4, lr}
	bx	lr
.L46:
	pop	{r4, lr}
	b	initialize
.L48:
	.align	2
.L47:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L51
	mov	r2, #83886080
	ldr	r1, .L51+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+8
	mov	r2, #100663296
	ldr	r1, .L51+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L51+16
	ldr	r1, .L51+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L51+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	DMANow
	.word	losePal
	.word	15840
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L69
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L54
	ldr	r2, .L69+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L65
.L54:
	tst	r3, #2
	beq	.L55
	ldr	r3, .L69+4
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L66
.L55:
	ldr	r3, .L69+8
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L67
.L56:
	ldr	r3, .L69+12
	ldr	r3, [r3]
	cmp	r3, #25
	beq	.L68
.L57:
	ldr	r3, .L69+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+24
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L69+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToWin
	b	.L57
.L67:
	bl	goToLose
	b	.L56
.L66:
	bl	goToLose
	b	.L55
.L65:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L54
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	buttons
	.word	livesRemaining
	.word	enemiesCaught
	.word	updateGame
	.word	waitForVBlank
	.word	drawGame
	.word	DMANow
	.word	shadowOAM
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L82
	mov	lr, pc
	bx	r3
	ldr	r6, .L82+4
	ldr	fp, .L82+8
	ldr	r5, .L82+12
	ldr	r10, .L82+16
	ldr	r9, .L82+20
	ldr	r8, .L82+24
	ldr	r7, .L82+28
	ldr	r4, .L82+32
.L72:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L73:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L73
.L75:
	.word	.L74
	.word	.L76
	.word	.L77
	.word	.L78
	.word	.L78
.L78:
	mov	lr, pc
	bx	r7
	b	.L72
.L77:
	mov	lr, pc
	bx	r8
	b	.L72
.L76:
	mov	lr, pc
	bx	r9
	b	.L72
.L74:
	mov	lr, pc
	bx	r10
	b	.L72
.L83:
	.align	2
.L82:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	enemiesCaught,4,4
	.comm	livesRemaining,4,4
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
