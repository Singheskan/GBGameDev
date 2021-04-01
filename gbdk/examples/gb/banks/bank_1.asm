;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module bank_1
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_bank_1
	.globl _bank_1
	.globl _puts
	.globl _var_1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA_1
_var_1::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;bank_1.c:6: void bank_1() BANKED /* In ROM bank 1 */
;	---------------------------------
; Function bank_1
; ---------------------------------
	b_bank_1	= 1
_bank_1::
;bank_1.c:8: puts("I'm in ROM bank 1");
	ld	hl, #___str_0
	push	hl
	call	_puts
	add	sp, #2
;bank_1.c:9: }
	ret
___str_0:
	.ascii "I'm in ROM bank 1"
	.db 0x00
	.area _CODE_1
	.area _CABS (ABS)
