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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.3, %function
updateBullet.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #9
	ble	.L2
	ldr	r1, [r0, #20]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	sub	r1, r3, #1
	cmp	r1, #237
	bls	.L5
.L2:
	mov	r3, #0
	str	r3, [r0, #32]
	bx	lr
.L5:
	ldr	r1, [r0, #16]
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
	.size	updateBullet.part.3, .-updateBullet.part.3
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets.part.5, %function
updateEnemyBullets.part.5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L7
	ldr	r1, [r0, #20]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	sub	ip, r3, #1
	cmp	ip, #237
	movhi	r1, #0
	movls	r1, #1
	cmp	r2, #160
	movgt	r1, #0
	cmp	r1, #0
	bne	.L12
.L7:
	mov	r3, #0
	str	r3, [r0, #32]
	bx	lr
.L12:
	ldr	r1, [r0, #16]
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
	.size	updateEnemyBullets.part.5, .-updateEnemyBullets.part.5
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullets.part.6, %function
fireEnemyBullets.part.6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L23
	mov	r3, #0
	mov	r2, ip
	b	.L16
.L14:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #48
	bxeq	lr
.L16:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L14
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	r2, [r0, #16]
	add	r3, r3, r3, lsl r4
	add	r1, r2, r2, lsr #31
	lsl	r3, r3, #4
	ldr	r2, [r0, #4]
	add	lr, ip, r3
	add	r2, r2, r1, asr r4
	ldr	r1, [lr, #28]
	ldr	r5, [r0]
	add	r1, r1, r1, lsr #31
	sub	r2, r2, r1, asr r4
	str	r5, [ip, r3]
	str	r2, [lr, #4]
	str	r4, [lr, #32]
	pop	{r4, r5, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	enemybullets
	.size	fireEnemyBullets.part.6, .-fireEnemyBullets.part.6
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #0
	ldr	ip, .L45
	ldr	r3, [ip, #4]
	ldr	r1, .L45+4
	orr	r3, r3, #16384
	ldr	ip, [ip]
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, .L45+8
	mov	r0, r1
	mov	r2, r1
	mov	r5, #512
	strh	ip, [r1]	@ movhi
	strh	lr, [r1, #4]	@ movhi
	add	r4, r3, #1200
	b	.L28
.L27:
	add	r3, r3, #48
	cmp	r3, r4
	add	r2, r2, #8
	beq	.L43
.L28:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	strheq	r5, [r2, #48]	@ movhi
	beq	.L27
	ldr	lr, [r3, #36]
	ldr	ip, [r3, #28]
	ldr	r1, [r3, #4]
	ldr	r6, [r3]
	add	lr, lr, #1
	add	r3, r3, #48
	add	ip, ip, lr, lsl #6
	orr	r1, r1, #16384
	cmp	r3, r4
	strh	ip, [r2, #52]	@ movhi
	strh	r1, [r2, #50]	@ movhi
	strh	r6, [r2, #48]	@ movhi
	add	r2, r2, #8
	bne	.L28
.L43:
	ldr	r3, .L45+12
	mov	r4, #512
	mov	r5, #5
	add	ip, r3, #880
	b	.L31
.L29:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldreq	r2, [r3, #40]
	add	r3, r3, #44
	lsleq	r2, r2, #3
	strheq	r4, [r0, r2]	@ movhi
	cmp	r3, ip
	beq	.L44
.L31:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L29
	ldr	r2, [r3, #40]
	ldr	r1, [r3, #4]
	ldr	r6, [r3]
	lsl	r2, r2, #3
	add	r3, r3, #44
	add	lr, r0, r2
	orr	r1, r1, #16384
	cmp	r3, ip
	strh	r6, [r0, r2]	@ movhi
	strh	r5, [lr, #4]	@ movhi
	strh	r1, [lr, #2]	@ movhi
	bne	.L31
.L44:
	mov	lr, #512
	mov	r4, #192
	ldr	r3, .L45+16
	add	r1, r3, #72
.L34:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #16]
	ldrne	ip, [r3, #4]
	ldrne	r5, [r3]
	lslne	r2, r2, #3
	orrne	ip, ip, #16384
	strhne	r5, [r0, r2]	@ movhi
	lsleq	r2, r2, #3
	addne	r2, r0, r2
	add	r3, r3, #24
	strhne	r4, [r2, #4]	@ movhi
	strhne	ip, [r2, #2]	@ movhi
	strheq	lr, [r0, r2]	@ movhi
	cmp	r3, r1
	bne	.L34
	mov	r4, #512
	mov	r6, #3
	ldr	r3, .L45+20
	add	ip, r3, #480
.L37:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	ldr	r2, [r3, #40]
	ldrne	r1, [r3, #4]
	lslne	r2, r2, #3
	ldrne	r5, [r3]
	addne	lr, r0, r2
	orrne	r1, r1, #16384
	lsleq	r2, r2, #3
	add	r3, r3, #48
	strhne	r5, [r0, r2]	@ movhi
	strhne	r6, [lr, #4]	@ movhi
	strhne	r1, [lr, #2]	@ movhi
	strheq	r4, [r0, r2]	@ movhi
	cmp	ip, r3
	bne	.L37
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	player
	.word	shadowOAM
	.word	enemies
	.word	bullets
	.word	lives
	.word	enemybullets
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #16
	mov	lr, #142
	mov	r2, #2
	mov	ip, #112
	mov	r0, #20
	ldr	r3, .L49
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r3, .L52
	ldm	r3, {r0, r2}
	ldr	r3, .L52+4
	orr	r2, r2, #16384
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L78
	ldrh	r3, [r3, #48]
	tst	r3, #16
	sub	sp, sp, #20
	ldr	r5, .L78+4
	bne	.L55
	ldr	r2, [r5, #4]
	ldr	r3, [r5, #16]
	add	r3, r2, r3
	cmp	r3, #238
	addle	r2, r2, #1
	strle	r2, [r5, #4]
.L55:
	ldr	r3, .L78
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L56
	ldr	r3, [r5, #4]
	cmp	r3, #1
	subgt	r3, r3, #1
	strgt	r3, [r5, #4]
.L56:
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L57
	ldr	r3, .L78+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	beq	.L76
.L57:
	ldr	r4, .L78+16
	mov	r9, #0
	ldr	r8, .L78+20
	ldr	r7, .L78+24
	add	r6, r4, #480
	b	.L64
.L62:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L77
.L64:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	bne	.L62
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5, #4]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r7]
	strne	r9, [r4, #32]
	subne	r3, r3, #1
	add	r4, r4, #48
	strne	r3, [r7]
	cmp	r4, r6
	bne	.L64
.L77:
	ldr	r3, [r5, #24]
	add	r3, r3, #1
	str	r3, [r5, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L76:
	ldr	r2, [r5, #24]
	cmp	r2, #19
	ble	.L57
	ldr	r0, .L78+28
	mov	r2, r0
	b	.L60
.L58:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	beq	.L59
.L60:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L58
	mov	r2, #1
	add	ip, r3, r3, lsl #2
	add	r3, r3, ip, lsl r2
	ldr	ip, [r5]
	lsl	r3, r3, #2
	str	ip, [r0, r3]
	ldr	ip, [r5, #4]
	add	r3, r0, r3
	str	r1, [r3, #36]
	str	ip, [r3, #4]
	str	r2, [r3, #32]
.L59:
	mov	r3, #0
	str	r3, [r5, #24]
	b	.L57
.L79:
	.align	2
.L78:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	enemybullets
	.word	collision
	.word	.LANCHOR0
	.word	bullets
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	ip, r1
	mov	fp, #10
	mov	r7, r1
	mov	r0, r1
	mov	r6, #2
	mvn	r9, #0
	mov	lr, #14
	mov	r8, #1
	ldr	r3, .L89
	ldr	r10, .L89+4
	b	.L83
.L88:
	cmp	ip, #3
	str	fp, [r3, #48]
	add	r7, r7, #18
	addle	ip, ip, #2
	movgt	ip, r2
.L82:
	add	r1, r1, #1
	cmp	r1, #25
	str	r7, [r3, #44]
	str	r6, [r3, #52]
	str	r9, [r3, #56]
	str	lr, [r3, #60]
	str	lr, [r3, #64]
	str	r8, [r3, #68]
	str	ip, [r3, #72]
	str	r0, [r3, #76]
	str	r0, [r3, #80]
	str	r6, [r3, #84]
	str	r0, [r3, #88]
	add	r3, r3, #48
	beq	.L87
.L83:
	smull	r4, r5, r1, r10
	asr	r2, r1, #31
	rsb	r2, r2, r5, asr #1
	add	r2, r2, r2, lsl #2
	subs	r2, r1, r2
	beq	.L88
	ldr	r2, [r3]
	add	r2, r2, #25
	str	r2, [r3, #48]
	b	.L82
.L87:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	enemies-44
	.word	1717986919
	.size	initEnemies, .-initEnemies
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L98
	mov	r2, #512
	ldr	r3, .L99
	lsl	r1, r1, #3
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L98:
	push	{r4, lr}
	ldr	ip, [r0, #36]
	ldr	r2, [r0, #4]
	ldr	lr, .L99
	ldr	r3, [r0, #28]
	ldr	r4, [r0]
	lsl	r1, r1, #3
	add	r0, ip, #1
	add	r3, r3, r0, lsl #6
	orr	r2, r2, #16384
	add	r0, lr, r1
	strh	r4, [lr, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #32]
	ldr	r3, .L167
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	sub	sp, sp, #16
	bne	.L102
	add	r0, r5, #36
	ldm	r0, {r0, r1}
	sub	r1, r1, #1
	cmp	r0, r1
	addlt	r0, r0, #1
	strlt	r0, [r5, #36]
	strge	r3, [r5, #36]
.L102:
	ldr	r3, [r5, #16]
	ldr	r0, [r5, #4]
	rsb	r3, r3, #240
	add	r2, r2, #1
	cmp	r0, r3
	str	r2, [r5, #32]
	blt	.L104
	ldr	r2, [r5, #12]
	cmn	r2, #1
	beq	.L154
.L104:
	ldr	r2, [r5, #52]
	cmp	r3, r2
	bgt	.L106
	ldr	r2, [r5, #60]
	cmn	r2, #1
	beq	.L155
.L106:
	ldr	r2, [r5, #100]
	cmp	r3, r2
	bgt	.L107
.L165:
	ldr	r2, [r5, #108]
	cmn	r2, #1
	beq	.L156
.L107:
	ldr	r2, [r5, #148]
	cmp	r3, r2
	bgt	.L108
.L166:
	ldr	r2, [r5, #156]
	cmn	r2, #1
	beq	.L157
.L108:
	ldr	r2, [r5, #196]
	cmp	r3, r2
	ble	.L158
.L109:
	cmp	r0, #1
	ble	.L159
.L111:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	ble	.L160
.L113:
	ldr	r3, [r5, #100]
	cmp	r3, #0
	ble	.L161
.L114:
	ldr	r3, [r5, #148]
	cmp	r3, #0
	ble	.L162
.L115:
	ldr	r3, [r5, #196]
	cmp	r3, #0
	ble	.L163
.L116:
	ldr	r3, [r5, #24]
	cmp	r3, #1
	bne	.L118
	ldr	r3, [r5]
	cmp	r3, #146
	mvngt	r2, #0
	ldrgt	r3, .L167+4
	strgt	r2, [r3]
.L118:
	ldr	r3, [r5, #12]
	ldr	r4, .L167+8
	sub	r0, r0, r3
	mov	r8, #0
	str	r0, [r5, #4]
	ldr	r7, .L167+12
	ldr	r9, .L167+16
	add	r6, r4, #880
	b	.L122
.L120:
	add	r4, r4, #44
	cmp	r4, r6
	beq	.L164
.L122:
	ldr	r3, [r4, #32]
	cmp	r3, #1
	bne	.L120
	ldr	ip, [r5, #16]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	r10, [r5, #20]
	ldr	lr, [r5, #4]
	str	ip, [sp, #12]
	ldr	ip, [r5]
	ldm	r4, {r0, r1}
	str	r10, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L120
	ldr	r3, [r5, #24]
	cmp	r3, #1
	ldreq	r3, [r9]
	streq	r8, [r4, #32]
	addeq	r3, r3, #1
	add	r4, r4, #44
	streq	r3, [r9]
	streq	r8, [r5, #24]
	cmp	r4, r6
	bne	.L122
.L164:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L158:
	ldr	r3, [r5, #204]
	cmn	r3, #1
	bne	.L109
	ldr	r3, [r5, #216]
	cmp	r3, #1
	bne	.L109
	b	.L105
.L159:
	ldr	r3, [r5, #12]
	cmp	r3, #1
	bne	.L111
	ldr	r3, [r5, #24]
	cmp	r3, #1
	bne	.L111
.L112:
	ldr	r3, .L167+20
	add	r2, r3, #12
	add	ip, r3, #1200
.L117:
	ldr	r1, [r3, #12]
	rsb	r1, r1, #0
	str	r1, [r3, #12]
	ldr	r1, [r2, #-12]
	add	r3, r3, #48
	add	r1, r1, #5
	cmp	ip, r3
	str	r1, [r2, #-12]
	add	r2, r2, #48
	bne	.L117
	b	.L116
.L160:
	ldr	r3, [r5, #60]
	cmp	r3, #1
	bne	.L113
	ldr	r3, [r5, #72]
	cmp	r3, #1
	bne	.L113
	b	.L112
.L161:
	ldr	r3, [r5, #108]
	cmp	r3, #1
	bne	.L114
	ldr	r3, [r5, #120]
	cmp	r3, #1
	bne	.L114
	b	.L112
.L162:
	ldr	r3, [r5, #156]
	cmp	r3, #1
	bne	.L115
	ldr	r3, [r5, #168]
	cmp	r3, #1
	bne	.L115
	b	.L112
.L163:
	ldr	r3, [r5, #204]
	cmp	r3, #1
	bne	.L116
	ldr	r3, [r5, #216]
	cmp	r3, #1
	bne	.L116
	b	.L112
.L154:
	ldr	r2, [r5, #24]
	cmp	r2, #1
	bne	.L104
.L105:
	ldr	r3, .L167+20
	add	r2, r3, #12
	add	ip, r3, #1200
.L110:
	ldr	r1, [r3, #12]
	rsb	r1, r1, #0
	str	r1, [r3, #12]
	ldr	r1, [r2, #-12]
	add	r3, r3, #48
	add	r1, r1, #5
	cmp	ip, r3
	str	r1, [r2, #-12]
	add	r2, r2, #48
	bne	.L110
	b	.L109
.L155:
	ldr	r2, [r5, #72]
	cmp	r2, #1
	beq	.L105
	ldr	r2, [r5, #100]
	cmp	r3, r2
	bgt	.L107
	b	.L165
.L156:
	ldr	r2, [r5, #120]
	cmp	r2, #1
	beq	.L105
	ldr	r2, [r5, #148]
	cmp	r3, r2
	bgt	.L108
	b	.L166
.L157:
	ldr	r2, [r5, #168]
	cmp	r2, #1
	bne	.L108
	b	.L105
.L168:
	.align	2
.L167:
	.word	1717986919
	.word	.LANCHOR0
	.word	bullets
	.word	collision
	.word	.LANCHOR1
	.word	enemies
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #8
	mov	r1, #1
	mov	r0, #0
	mov	r5, #11
	mov	r4, #2
	mov	lr, #21
	mov	ip, #3
	ldr	r3, .L171
	str	r5, [r3, #28]
	str	r4, [r3, #40]
	str	lr, [r3, #52]
	str	r0, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #48]
	str	ip, [r3, #64]
	str	r1, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #44]
	str	r1, [r3, #68]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #60]
	str	r2, [r3, #56]
	pop	{r4, r5, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L179
	ldr	r2, .L179+4
	ldr	r1, .L179+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L179+12
	ldr	r1, .L179+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #16
	mov	lr, #142
	mov	ip, #112
	mov	r0, #20
	mov	r2, #2
	ldr	r3, .L179+20
	mvn	r4, #1
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	bl	initEnemies
	mov	r0, #61
	mov	r1, #0
	mov	ip, #8
	ldr	r3, .L179+24
	add	lr, r3, #880
.L174:
	ldr	r2, [r3, #24]
	rsb	r2, r2, #0
	str	r0, [r3, #40]
	str	r1, [r3, #4]
	str	ip, [r3, #28]
	str	r4, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	str	r2, [r3]
	str	ip, [r3, #24]
	add	r3, r3, #44
	cmp	r3, lr
	add	r0, r0, #1
	bne	.L174
	bl	initLives
	mov	r2, #85
	mov	r0, #8
	mvn	lr, #7
	mov	r1, #0
	mov	ip, #2
	ldr	r3, .L179+28
.L175:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, #95
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	lr, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	add	r3, r3, #48
	bne	.L175
	pop	{r4, lr}
	bx	lr
.L180:
	.align	2
.L179:
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	player
	.word	bullets
	.word	enemybullets
	.size	initGame, .-initGame
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ldr	r3, [r0, #16]
	bne	.L188
	mov	r1, #512
	ldr	r2, .L189
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L188:
	str	lr, [sp, #-4]!
	mov	lr, #192
	ldr	r2, [r0, #4]
	ldr	ip, .L189
	ldr	r0, [r0]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L190:
	.align	2
.L189:
	.word	shadowOAM
	.size	drawLives, .-drawLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L196
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L195
	cmp	r3, #1
	bne	.L194
	mov	r2, #0
	ldr	r3, .L196+4
	str	r2, [r3, #44]
	bx	lr
.L194:
	cmp	r3, #0
	ldreq	r2, .L196+4
	streq	r3, [r2, #20]
	bx	lr
.L195:
	mov	r2, #0
	ldr	r3, .L196+4
	str	r2, [r3, #68]
	bx	lr
.L197:
	.align	2
.L196:
	.word	.LANCHOR0
	.word	lives
	.size	updateLives, .-updateLives
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L225
	bl	updatePlayer
	mov	r4, r5
	mov	r8, #1
	ldr	r7, .L225+4
	add	r6, r5, #1200
.L201:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	mov	r0, r4
	ble	.L199
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	cmp	r3, #239
	ble	.L200
.L199:
	str	r8, [r7]
.L200:
	add	r4, r4, #48
	bl	updateEnemy
	cmp	r4, r6
	bne	.L201
	ldr	r4, .L225+8
	add	r6, r4, #880
	b	.L203
.L202:
	add	r4, r4, #44
	cmp	r6, r4
	beq	.L222
.L203:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L202
	mov	r0, r4
	add	r4, r4, #44
	bl	updateBullet.part.3
	cmp	r6, r4
	bne	.L203
.L222:
	ldr	r0, .L225+12
	bl	updateLives
	ldr	r4, .L225+16
	ldr	r0, .L225+20
	bl	updateLives
	ldr	r0, .L225+24
	bl	updateLives
	add	r6, r4, #480
	b	.L205
.L204:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L223
.L205:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L204
	mov	r0, r4
	add	r4, r4, #48
	bl	updateEnemyBullets.part.5
	cmp	r4, r6
	bne	.L205
.L223:
	ldr	r3, [r5, #44]
	ldr	r2, .L225+28
	smull	r0, r1, r3, r2
	asr	r2, r3, #31
	add	r1, r3, r1
	rsb	r2, r2, r1, asr #5
	rsb	r2, r2, r2, lsl #4
	cmp	r3, r2, lsl #2
	addne	r3, r3, #1
	beq	.L224
	str	r3, [r5, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L224:
	ldr	r3, .L225+32
	mov	lr, pc
	bx	r3
	rsbs	r2, r0, #0
	and	r2, r2, #7
	and	r3, r0, #7
	rsbpl	r3, r2, #0
	add	r3, r3, r3, lsl #1
	add	r0, r5, r3, lsl #4
	ldr	r3, [r0, #24]
	cmp	r3, #0
	blne	fireEnemyBullets.part.6
.L208:
	mov	r3, #1
	str	r3, [r5, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L226:
	.align	2
.L225:
	.word	enemies
	.word	move
	.word	bullets
	.word	lives
	.word	enemybullets
	.word	lives+24
	.word	lives+48
	.word	-2004318071
	.word	rand
	.size	updateGame, .-updateGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #61
	mov	r1, #0
	mov	ip, #8
	mvn	r4, #1
	ldr	r3, .L231
	add	lr, r3, #880
.L228:
	ldr	r2, [r3, #24]
	rsb	r2, r2, #0
	str	r0, [r3, #40]
	str	r1, [r3, #4]
	str	ip, [r3, #28]
	str	r4, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	str	r2, [r3]
	str	ip, [r3, #24]
	add	r3, r3, #44
	cmp	r3, lr
	add	r0, r0, #1
	bne	.L228
	pop	{r4, lr}
	bx	lr
.L232:
	.align	2
.L231:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bne	.L240
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r1, #512
	ldreq	r3, [r0, #40]
	ldreq	r2, .L241
	lsleq	r3, r3, #3
	strheq	r1, [r2, r3]	@ movhi
	bx	lr
.L240:
	str	lr, [sp, #-4]!
	mov	lr, #5
	ldr	r3, [r0, #40]
	ldr	r2, [r0, #4]
	ldr	ip, .L241
	ldr	r0, [r0]
	lsl	r3, r3, #3
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L242:
	.align	2
.L241:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.3
	.size	updateBullet, .-updateBullet
	.align	2
	.global	firePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayerBullet, %function
firePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L255
	mov	r3, #0
	mov	r2, r0
	b	.L248
.L246:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #44
	bxeq	lr
.L248:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L246
	mov	ip, #1
	ldr	r2, .L255+4
	str	lr, [sp, #-4]!
	add	lr, r3, r3, lsl #2
	add	r3, r3, lr, lsl ip
	ldr	lr, [r2]
	lsl	r3, r3, #2
	ldr	r2, [r2, #4]
	str	lr, [r0, r3]
	add	r3, r0, r3
	str	r1, [r3, #36]
	str	r2, [r3, #4]
	str	ip, [r3, #32]
	ldr	lr, [sp], #4
	bx	lr
.L256:
	.align	2
.L255:
	.word	bullets
	.word	player
	.size	firePlayerBullet, .-firePlayerBullet
	.align	2
	.global	initEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyBullets, %function
initEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #85
	mov	r0, #8
	mvn	lr, #7
	mov	r1, #0
	mov	ip, #2
	ldr	r3, .L261
.L258:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, #95
	str	r0, [r3, #24]
	str	r0, [r3, #28]
	str	lr, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #32]
	add	r3, r3, #48
	bne	.L258
	ldr	lr, [sp], #4
	bx	lr
.L262:
	.align	2
.L261:
	.word	enemybullets
	.size	initEnemyBullets, .-initEnemyBullets
	.align	2
	.global	drawEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyBullets, %function
drawEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	ldr	r3, [r0, #40]
	bne	.L270
	mov	r1, #512
	ldr	r2, .L271
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L270:
	str	lr, [sp, #-4]!
	mov	lr, #3
	ldr	r2, [r0, #4]
	ldr	ip, .L271
	lsl	r3, r3, lr
	ldr	r0, [r0]
	add	r1, ip, r3
	orr	r2, r2, #16384
	strh	lr, [r1, #4]	@ movhi
	strh	r0, [ip, r3]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L272:
	.align	2
.L271:
	.word	shadowOAM
	.size	drawEnemyBullets, .-drawEnemyBullets
	.align	2
	.global	updateEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets, %function
updateEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemyBullets.part.5
	.size	updateEnemyBullets, .-updateEnemyBullets
	.align	2
	.global	fireEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullets, %function
fireEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	fireEnemyBullets.part.6
	.size	fireEnemyBullets, .-fireEnemyBullets
	.comm	shadowOAM,1024,4
	.comm	enemybullets,480,4
	.comm	lives,72,4
	.comm	bullets,880,4
	.comm	enemies,1200,4
	.comm	player,28,4
	.global	enemiesCaught
	.global	livesRemaining
	.comm	move,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	livesRemaining, %object
	.size	livesRemaining, 4
livesRemaining:
	.word	3
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	enemiesCaught, %object
	.size	enemiesCaught, 4
enemiesCaught:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
