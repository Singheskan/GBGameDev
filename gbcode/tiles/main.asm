;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _set_sprite_data
	.globl _delay
	.globl _TileLabel
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_TileLabel::
	.ds 32
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
;Export.c:26: unsigned char TileLabel[] =
	ld	hl, #_TileLabel
	ld	(hl), #0xff
	ld	hl, #(_TileLabel + 0x0001)
	ld	(hl), #0xff
	ld	hl, #(_TileLabel + 0x0002)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0003)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0004)
	ld	(hl), #0xe7
	ld	hl, #(_TileLabel + 0x0005)
	ld	(hl), #0xe7
	ld	hl, #(_TileLabel + 0x0006)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0007)
	ld	(hl), #0xa5
	ld	hl, #(_TileLabel + 0x0008)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x0009)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x000a)
	ld	(hl), #0x5a
	ld	hl, #(_TileLabel + 0x000b)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x000c)
	ld	(hl), #0x3c
	ld	hl, #(_TileLabel + 0x000d)
	ld	(hl), #0x3c
	ld	hl, #(_TileLabel + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_TileLabel + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_TileLabel + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_TileLabel + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_TileLabel + 0x0012)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0013)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0014)
	ld	(hl), #0xe7
	ld	hl, #(_TileLabel + 0x0015)
	ld	(hl), #0xe7
	ld	hl, #(_TileLabel + 0x0016)
	ld	(hl), #0x81
	ld	hl, #(_TileLabel + 0x0017)
	ld	(hl), #0xa5
	ld	hl, #(_TileLabel + 0x0018)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x0019)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x001a)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x001b)
	ld	(hl), #0x42
	ld	hl, #(_TileLabel + 0x001c)
	ld	(hl), #0x3c
	ld	hl, #(_TileLabel + 0x001d)
	ld	(hl), #0x3c
	ld	hl, #(_TileLabel + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_TileLabel + 0x001f)
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:6: UINT8 currentspriteindex = 0;
	ld	c, #0x00
;main.c:8: set_sprite_data(0, 2, TileLabel);
	ld	hl, #_TileLabel
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x4e
	ld	(hl+), a
	ld	(hl), #0x58
;main.c:11: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:13: while(1){
00105$:
;main.c:14: if(currentspriteindex==0){
	ld	a, c
	or	a, a
;main.c:15: currentspriteindex = 1;
;main.c:18: currentspriteindex = 0;
	ld	c, #0x01
	jr	Z, 00103$
	ld	c, #0x00
00103$:
;c:/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), c
;main.c:21: delay(1000);
	push	bc
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
	pop	bc
;c:/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;c:/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (de)
	ld	(de), a
	inc	de
	ld	a, (de)
	add	a, #0x0a
	ld	(de), a
;main.c:22: scroll_sprite(0,10,0);
;main.c:24: }
	jr	00105$
	.area _CODE
	.area _CABS (ABS)
