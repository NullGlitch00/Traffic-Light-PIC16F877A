
_mask:

;MAIN.c,6 :: 		unsigned short mask(unsigned short num){
;MAIN.c,7 :: 		switch (num){
	GOTO       L_mask0
;MAIN.c,8 :: 		case 0: return 0xC0;
L_mask2:
	MOVLW      192
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,9 :: 		case 1: return 0xF9;
L_mask3:
	MOVLW      249
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,10 :: 		case 2: return 0xA4;
L_mask4:
	MOVLW      164
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,11 :: 		case 3: return 0xB0;
L_mask5:
	MOVLW      176
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,12 :: 		case 4: return 0x99;
L_mask6:
	MOVLW      153
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,13 :: 		case 5: return 0x92;
L_mask7:
	MOVLW      146
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,14 :: 		case 6: return 0x82;
L_mask8:
	MOVLW      130
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,15 :: 		case 7: return 0xF8;
L_mask9:
	MOVLW      248
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,16 :: 		case 8: return 0x80;
L_mask10:
	MOVLW      128
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,17 :: 		case 9: return 0x90;
L_mask11:
	MOVLW      144
	MOVWF      R0+0
	GOTO       L_end_mask
;MAIN.c,18 :: 		}
L_mask0:
	MOVF       FARG_mask_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_mask2
	MOVF       FARG_mask_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_mask3
	MOVF       FARG_mask_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_mask4
	MOVF       FARG_mask_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_mask5
	MOVF       FARG_mask_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_mask6
	MOVF       FARG_mask_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_mask7
	MOVF       FARG_mask_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_mask8
	MOVF       FARG_mask_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_mask9
	MOVF       FARG_mask_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_mask10
	MOVF       FARG_mask_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_mask11
;MAIN.c,19 :: 		}
L_end_mask:
	RETURN
; end of _mask

_dendo_xanh1:

;MAIN.c,21 :: 		void dendo_xanh1(int time, int plustime){
;MAIN.c,22 :: 		for(i = time; i >= 1; i--){
	MOVF       FARG_dendo_xanh1_time+0, 0
	MOVWF      _i+0
L_dendo_xanh112:
	MOVLW      1
	SUBWF      _i+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_xanh113
;MAIN.c,23 :: 		PORTC.F0 = 1;
	BSF        PORTC+0, 0
;MAIN.c,24 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;MAIN.c,25 :: 		PORTC.F2 = 0;
	BCF        PORTC+0, 2
;MAIN.c,26 :: 		PORTC.F3 = 0;
	BCF        PORTC+0, 3
;MAIN.c,27 :: 		PORTC.F4 = 0;
	BCF        PORTC+0, 4
;MAIN.c,28 :: 		PORTC.F5 = 1;
	BSF        PORTC+0, 5
;MAIN.c,29 :: 		UART1_Write_Text("13&");
	MOVLW      ?lstr1_MAIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MAIN.c,30 :: 		for( j = 20; j >= 1; j--){
	MOVLW      20
	MOVWF      _j+0
L_dendo_xanh115:
	MOVLW      1
	SUBWF      _j+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_xanh116
;MAIN.c,31 :: 		PORTD = mask((i + plustime) % 10);
	MOVF       FARG_dendo_xanh1_plustime+0, 0
	ADDWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_dendo_xanh1_plustime+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,32 :: 		PORTA.F0 = 1;
	BSF        PORTA+0, 0
;MAIN.c,33 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh118:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh118
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh118
	NOP
;MAIN.c,34 :: 		PORTA.F0 = 0;
	BCF        PORTA+0, 0
;MAIN.c,35 :: 		PORTD = mask((i + plustime) / 10);
	MOVF       FARG_dendo_xanh1_plustime+0, 0
	ADDWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_dendo_xanh1_plustime+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,36 :: 		PORTA.F1 = 1;
	BSF        PORTA+0, 1
;MAIN.c,37 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh119:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh119
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh119
	NOP
;MAIN.c,38 :: 		PORTA.F1 = 0;
	BCF        PORTA+0, 1
;MAIN.c,39 :: 		PORTB = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,40 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;MAIN.c,41 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh120:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh120
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh120
	NOP
;MAIN.c,42 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;MAIN.c,43 :: 		PORTB = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,44 :: 		PORTA.F3=1;
	BSF        PORTA+0, 3
;MAIN.c,45 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh121:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh121
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh121
	NOP
;MAIN.c,46 :: 		PORTA.F3=0;
	BCF        PORTA+0, 3
;MAIN.c,47 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh122:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh122
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh122
	NOP
;MAIN.c,48 :: 		if(UART1_Data_Ready() == 1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dendo_xanh123
;MAIN.c,49 :: 		return;
	GOTO       L_end_dendo_xanh1
;MAIN.c,50 :: 		}
L_dendo_xanh123:
;MAIN.c,30 :: 		for( j = 20; j >= 1; j--){
	DECF       _j+0, 1
;MAIN.c,51 :: 		}
	GOTO       L_dendo_xanh115
L_dendo_xanh116:
;MAIN.c,22 :: 		for(i = time; i >= 1; i--){
	DECF       _i+0, 1
;MAIN.c,52 :: 		}
	GOTO       L_dendo_xanh112
L_dendo_xanh113:
;MAIN.c,53 :: 		}
L_end_dendo_xanh1:
	RETURN
; end of _dendo_xanh1

_dendo_vang1:

;MAIN.c,54 :: 		void dendo_vang1(int plustime){
;MAIN.c,55 :: 		for(i = plustime; i >= 1; i--){
	MOVF       FARG_dendo_vang1_plustime+0, 0
	MOVWF      _i+0
L_dendo_vang124:
	MOVLW      1
	SUBWF      _i+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_vang125
;MAIN.c,56 :: 		PORTC.F0 = 1;
	BSF        PORTC+0, 0
;MAIN.c,57 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;MAIN.c,58 :: 		PORTC.F2 = 0;
	BCF        PORTC+0, 2
;MAIN.c,59 :: 		PORTC.F3 = 0;
	BCF        PORTC+0, 3
;MAIN.c,60 :: 		PORTC.F4 = 1;
	BSF        PORTC+0, 4
;MAIN.c,61 :: 		PORTC.F5 = 0;
	BCF        PORTC+0, 5
;MAIN.c,62 :: 		UART1_Write_Text("12&");
	MOVLW      ?lstr2_MAIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MAIN.c,63 :: 		for( j = 20; j >= 1; j--){
	MOVLW      20
	MOVWF      _j+0
L_dendo_vang127:
	MOVLW      1
	SUBWF      _j+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_vang128
;MAIN.c,64 :: 		PORTD = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,65 :: 		PORTA.F0 = 1;
	BSF        PORTA+0, 0
;MAIN.c,66 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang130:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang130
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang130
	NOP
;MAIN.c,67 :: 		PORTA.F0 = 0;
	BCF        PORTA+0, 0
;MAIN.c,68 :: 		PORTD = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,69 :: 		PORTA.F1 = 1;
	BSF        PORTA+0, 1
;MAIN.c,70 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang131:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang131
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang131
	NOP
;MAIN.c,71 :: 		PORTA.F1 = 0;
	BCF        PORTA+0, 1
;MAIN.c,72 :: 		PORTB = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,73 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;MAIN.c,74 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang132:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang132
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang132
	NOP
;MAIN.c,75 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;MAIN.c,76 :: 		PORTB = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,77 :: 		PORTA.F3=1;
	BSF        PORTA+0, 3
;MAIN.c,78 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang133:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang133
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang133
	NOP
;MAIN.c,79 :: 		PORTA.F3=0;
	BCF        PORTA+0, 3
;MAIN.c,80 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang134:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang134
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang134
	NOP
;MAIN.c,81 :: 		if(UART1_Data_Ready() == 1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dendo_vang135
;MAIN.c,82 :: 		return;
	GOTO       L_end_dendo_vang1
;MAIN.c,83 :: 		}
L_dendo_vang135:
;MAIN.c,63 :: 		for( j = 20; j >= 1; j--){
	DECF       _j+0, 1
;MAIN.c,84 :: 		}
	GOTO       L_dendo_vang127
L_dendo_vang128:
;MAIN.c,55 :: 		for(i = plustime; i >= 1; i--){
	DECF       _i+0, 1
;MAIN.c,85 :: 		}
	GOTO       L_dendo_vang124
L_dendo_vang125:
;MAIN.c,86 :: 		}
L_end_dendo_vang1:
	RETURN
; end of _dendo_vang1

_dendo_xanh2:

;MAIN.c,88 :: 		void dendo_xanh2(int time, int plustime){
;MAIN.c,89 :: 		for(i = time; i >= 1; i--){
	MOVF       FARG_dendo_xanh2_time+0, 0
	MOVWF      _i+0
L_dendo_xanh236:
	MOVLW      1
	SUBWF      _i+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_xanh237
;MAIN.c,90 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;MAIN.c,91 :: 		PORTC.F1 = 0;
	BCF        PORTC+0, 1
;MAIN.c,92 :: 		PORTC.F2 = 1;
	BSF        PORTC+0, 2
;MAIN.c,93 :: 		PORTC.F3 = 1;
	BSF        PORTC+0, 3
;MAIN.c,94 :: 		PORTC.F4 = 0;
	BCF        PORTC+0, 4
;MAIN.c,95 :: 		PORTC.F5 = 0;
	BCF        PORTC+0, 5
;MAIN.c,96 :: 		UART1_Write_Text("31&");
	MOVLW      ?lstr3_MAIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MAIN.c,97 :: 		for( j = 20; j >= 1; j--){
	MOVLW      20
	MOVWF      _j+0
L_dendo_xanh239:
	MOVLW      1
	SUBWF      _j+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_xanh240
;MAIN.c,98 :: 		PORTD = mask((i + plustime) % 10);
	MOVF       FARG_dendo_xanh2_plustime+0, 0
	ADDWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_dendo_xanh2_plustime+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,99 :: 		PORTA.F0 = 1;
	BSF        PORTA+0, 0
;MAIN.c,100 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh242:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh242
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh242
	NOP
;MAIN.c,101 :: 		PORTA.F0 = 0;
	BCF        PORTA+0, 0
;MAIN.c,102 :: 		PORTD = mask((i + plustime) / 10);
	MOVF       FARG_dendo_xanh2_plustime+0, 0
	ADDWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_dendo_xanh2_plustime+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,103 :: 		PORTA.F1 = 1;
	BSF        PORTA+0, 1
;MAIN.c,104 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh243:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh243
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh243
	NOP
;MAIN.c,105 :: 		PORTA.F1 = 0;
	BCF        PORTA+0, 1
;MAIN.c,106 :: 		PORTB = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,107 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;MAIN.c,108 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh244:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh244
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh244
	NOP
;MAIN.c,109 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;MAIN.c,110 :: 		PORTB = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,111 :: 		PORTA.F3=1;
	BSF        PORTA+0, 3
;MAIN.c,112 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh245:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh245
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh245
	NOP
;MAIN.c,113 :: 		PORTA.F3=0;
	BCF        PORTA+0, 3
;MAIN.c,114 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_xanh246:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_xanh246
	DECFSZ     R12+0, 1
	GOTO       L_dendo_xanh246
	NOP
;MAIN.c,115 :: 		if(UART1_Data_Ready() == 1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dendo_xanh247
;MAIN.c,116 :: 		return;
	GOTO       L_end_dendo_xanh2
;MAIN.c,117 :: 		}
L_dendo_xanh247:
;MAIN.c,97 :: 		for( j = 20; j >= 1; j--){
	DECF       _j+0, 1
;MAIN.c,118 :: 		}
	GOTO       L_dendo_xanh239
L_dendo_xanh240:
;MAIN.c,89 :: 		for(i = time; i >= 1; i--){
	DECF       _i+0, 1
;MAIN.c,119 :: 		}
	GOTO       L_dendo_xanh236
L_dendo_xanh237:
;MAIN.c,120 :: 		}
L_end_dendo_xanh2:
	RETURN
; end of _dendo_xanh2

_dendo_vang2:

;MAIN.c,121 :: 		void dendo_vang2(int plustime){
;MAIN.c,122 :: 		for(i = plustime; i >= 1; i--){
	MOVF       FARG_dendo_vang2_plustime+0, 0
	MOVWF      _i+0
L_dendo_vang248:
	MOVLW      1
	SUBWF      _i+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_vang249
;MAIN.c,123 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;MAIN.c,124 :: 		PORTC.F1 = 1;
	BSF        PORTC+0, 1
;MAIN.c,125 :: 		PORTC.F2 = 0;
	BCF        PORTC+0, 2
;MAIN.c,126 :: 		PORTC.F3 = 1;
	BSF        PORTC+0, 3
;MAIN.c,127 :: 		PORTC.F4 = 0;
	BCF        PORTC+0, 4
;MAIN.c,128 :: 		PORTC.F5 = 0;
	BCF        PORTC+0, 5
;MAIN.c,129 :: 		UART1_Write_Text("21&");
	MOVLW      ?lstr4_MAIN+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;MAIN.c,130 :: 		for(j = 20; j >= 1; j--){
	MOVLW      20
	MOVWF      _j+0
L_dendo_vang251:
	MOVLW      1
	SUBWF      _j+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_dendo_vang252
;MAIN.c,131 :: 		PORTD = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,132 :: 		PORTA.F0 = 1;
	BSF        PORTA+0, 0
;MAIN.c,133 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang254:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang254
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang254
	NOP
;MAIN.c,134 :: 		PORTA.F0 = 0;
	BCF        PORTA+0, 0
;MAIN.c,135 :: 		PORTD = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;MAIN.c,136 :: 		PORTA.F1 = 1;
	BSF        PORTA+0, 1
;MAIN.c,137 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang255:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang255
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang255
	NOP
;MAIN.c,138 :: 		PORTA.F1 = 0;
	BCF        PORTA+0, 1
;MAIN.c,139 :: 		PORTB = mask(i % 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,140 :: 		PORTA.F2=1;
	BSF        PORTA+0, 2
;MAIN.c,141 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang256:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang256
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang256
	NOP
;MAIN.c,142 :: 		PORTA.F2=0;
	BCF        PORTA+0, 2
;MAIN.c,143 :: 		PORTB = mask(i / 10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MAIN.c,144 :: 		PORTA.F3=1;
	BSF        PORTA+0, 3
;MAIN.c,145 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang257:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang257
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang257
	NOP
;MAIN.c,146 :: 		PORTA.F3=0;
	BCF        PORTA+0, 3
;MAIN.c,147 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_dendo_vang258:
	DECFSZ     R13+0, 1
	GOTO       L_dendo_vang258
	DECFSZ     R12+0, 1
	GOTO       L_dendo_vang258
	NOP
;MAIN.c,148 :: 		if(UART1_Data_Ready() == 1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_dendo_vang259
;MAIN.c,149 :: 		return;
	GOTO       L_end_dendo_vang2
;MAIN.c,150 :: 		}
L_dendo_vang259:
;MAIN.c,130 :: 		for(j = 20; j >= 1; j--){
	DECF       _j+0, 1
;MAIN.c,151 :: 		}
	GOTO       L_dendo_vang251
L_dendo_vang252:
;MAIN.c,122 :: 		for(i = plustime; i >= 1; i--){
	DECF       _i+0, 1
;MAIN.c,152 :: 		}
	GOTO       L_dendo_vang248
L_dendo_vang249:
;MAIN.c,153 :: 		}
L_end_dendo_vang2:
	RETURN
; end of _dendo_vang2

_run_programs:

;MAIN.c,159 :: 		void run_programs(int time) {
;MAIN.c,160 :: 		while (time >= 1) {
L_run_programs60:
	MOVLW      128
	XORWF      FARG_run_programs_time+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__run_programs86
	MOVLW      1
	SUBWF      FARG_run_programs_time+0, 0
L__run_programs86:
	BTFSS      STATUS+0, 0
	GOTO       L_run_programs61
;MAIN.c,161 :: 		time--; // Decrease time for the next iteration
	MOVLW      1
	SUBWF      FARG_run_programs_time+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_run_programs_time+1, 1
;MAIN.c,162 :: 		}
	GOTO       L_run_programs60
L_run_programs61:
;MAIN.c,163 :: 		}
L_end_run_programs:
	RETURN
; end of _run_programs

_delayms:

;MAIN.c,166 :: 		void delayms(unsigned int ms) {
;MAIN.c,168 :: 		for (i = 0; i < ms; i++) {
	CLRF       R1+0
	CLRF       R1+1
L_delayms62:
	MOVF       FARG_delayms_ms+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayms88
	MOVF       FARG_delayms_ms+0, 0
	SUBWF      R1+0, 0
L__delayms88:
	BTFSC      STATUS+0, 0
	GOTO       L_delayms63
;MAIN.c,169 :: 		for (j = 0; j < 1000; j++) {
	CLRF       R3+0
	CLRF       R3+1
L_delayms65:
	MOVLW      3
	SUBWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delayms89
	MOVLW      232
	SUBWF      R3+0, 0
L__delayms89:
	BTFSC      STATUS+0, 0
	GOTO       L_delayms66
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;MAIN.c,174 :: 		}
	GOTO       L_delayms65
L_delayms66:
;MAIN.c,168 :: 		for (i = 0; i < ms; i++) {
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MAIN.c,175 :: 		}
	GOTO       L_delayms62
L_delayms63:
;MAIN.c,176 :: 		}
L_end_delayms:
	RETURN
; end of _delayms

_main:

;MAIN.c,180 :: 		void main(){
;MAIN.c,181 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;MAIN.c,182 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MAIN.c,183 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;MAIN.c,184 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;MAIN.c,185 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;MAIN.c,186 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;MAIN.c,187 :: 		TRISC = 0b11000000;
	MOVLW      192
	MOVWF      TRISC+0
;MAIN.c,188 :: 		PORTA.F0 = 0;
	BCF        PORTA+0, 0
;MAIN.c,189 :: 		PORTA.F1 = 0;
	BCF        PORTA+0, 1
;MAIN.c,190 :: 		PORTA.F2 = 0;
	BCF        PORTA+0, 2
;MAIN.c,191 :: 		PORTA.F3 = 0;
	BCF        PORTA+0, 3
;MAIN.c,193 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MAIN.c,194 :: 		delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main68:
	DECFSZ     R13+0, 1
	GOTO       L_main68
	DECFSZ     R12+0, 1
	GOTO       L_main68
	DECFSZ     R11+0, 1
	GOTO       L_main68
	NOP
	NOP
;MAIN.c,196 :: 		while(1){
L_main69:
;MAIN.c,197 :: 		UART1_Read_Text(readbuff, "!", 7);
	MOVLW      _readbuff+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr5_MAIN+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      7
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;MAIN.c,198 :: 		UART1_Write(readbuff[0]);
	MOVF       _readbuff+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,199 :: 		UART1_Write(readbuff[1]);
	MOVF       _readbuff+1, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,200 :: 		UART1_Write(readbuff[2]);
	MOVF       _readbuff+2, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,201 :: 		UART1_Write(readbuff[3]);
	MOVF       _readbuff+3, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,202 :: 		UART1_Write(readbuff[4]);
	MOVF       _readbuff+4, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,203 :: 		UART1_Write(readbuff[5]);
	MOVF       _readbuff+5, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MAIN.c,204 :: 		data1[0] = readbuff[0];
	MOVF       _readbuff+0, 0
	MOVWF      _data1+0
;MAIN.c,205 :: 		data2[0] = readbuff[1];
	MOVF       _readbuff+1, 0
	MOVWF      _data2+0
;MAIN.c,206 :: 		data3[0] = readbuff[2];
	MOVF       _readbuff+2, 0
	MOVWF      _data3+0
;MAIN.c,207 :: 		data4[0] = readbuff[3];
	MOVF       _readbuff+3, 0
	MOVWF      _data4+0
;MAIN.c,208 :: 		data5[0] = readbuff[4];
	MOVF       _readbuff+4, 0
	MOVWF      _data5+0
;MAIN.c,209 :: 		data6[0] = readbuff[5];
	MOVF       _readbuff+5, 0
	MOVWF      _data6+0
;MAIN.c,210 :: 		data1[1] = '\0';
	CLRF       _data1+1
;MAIN.c,211 :: 		data2[1] = '\0';
	CLRF       _data2+1
;MAIN.c,212 :: 		data3[1] = '\0';
	CLRF       _data3+1
;MAIN.c,213 :: 		data4[1] = '\0';
	CLRF       _data4+1
;MAIN.c,214 :: 		data5[1] = '\0';
	CLRF       _data5+1
;MAIN.c,215 :: 		data6[1] = '\0';
	CLRF       _data6+1
;MAIN.c,216 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main71:
	DECFSZ     R13+0, 1
	GOTO       L_main71
	DECFSZ     R12+0, 1
	GOTO       L_main71
	NOP
;MAIN.c,217 :: 		value1 = atoi(data1);
	MOVLW      _data1+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value1+0
	MOVF       R0+1, 0
	MOVWF      _value1+1
;MAIN.c,218 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main72:
	DECFSZ     R13+0, 1
	GOTO       L_main72
	DECFSZ     R12+0, 1
	GOTO       L_main72
	NOP
;MAIN.c,219 :: 		value2 = atoi(data2);
	MOVLW      _data2+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value2+0
	MOVF       R0+1, 0
	MOVWF      _value2+1
;MAIN.c,220 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main73:
	DECFSZ     R13+0, 1
	GOTO       L_main73
	DECFSZ     R12+0, 1
	GOTO       L_main73
	NOP
;MAIN.c,221 :: 		value3 = atoi(data3);
	MOVLW      _data3+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value3+0
	MOVF       R0+1, 0
	MOVWF      _value3+1
;MAIN.c,222 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main74:
	DECFSZ     R13+0, 1
	GOTO       L_main74
	DECFSZ     R12+0, 1
	GOTO       L_main74
	NOP
;MAIN.c,223 :: 		value4 = atoi(data4);
	MOVLW      _data4+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value4+0
	MOVF       R0+1, 0
	MOVWF      _value4+1
;MAIN.c,224 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main75:
	DECFSZ     R13+0, 1
	GOTO       L_main75
	DECFSZ     R12+0, 1
	GOTO       L_main75
	NOP
;MAIN.c,225 :: 		value5 = atoi(data5);
	MOVLW      _data5+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value5+0
	MOVF       R0+1, 0
	MOVWF      _value5+1
;MAIN.c,226 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main76:
	DECFSZ     R13+0, 1
	GOTO       L_main76
	DECFSZ     R12+0, 1
	GOTO       L_main76
	NOP
;MAIN.c,227 :: 		value6 = atoi(data6);
	MOVLW      _data6+0
	MOVWF      FARG_atoi_s+0
	CALL       _atoi+0
	MOVF       R0+0, 0
	MOVWF      _value6+0
	MOVF       R0+1, 0
	MOVWF      _value6+1
;MAIN.c,228 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main77:
	DECFSZ     R13+0, 1
	GOTO       L_main77
	DECFSZ     R12+0, 1
	GOTO       L_main77
	NOP
;MAIN.c,229 :: 		rtime = 0;
	CLRF       _rtime+0
	CLRF       _rtime+1
;MAIN.c,230 :: 		ytime = (value3 * 10) + value4;
	MOVF       _value3+0, 0
	MOVWF      R0+0
	MOVF       _value3+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       _value4+0, 0
	ADDWF      R0+0, 0
	MOVWF      _ytime+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _value4+1, 0
	MOVWF      _ytime+1
;MAIN.c,231 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main78:
	DECFSZ     R13+0, 1
	GOTO       L_main78
	DECFSZ     R12+0, 1
	GOTO       L_main78
	NOP
;MAIN.c,232 :: 		gtime = (value5 * 10) + value6;
	MOVF       _value5+0, 0
	MOVWF      R0+0
	MOVF       _value5+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       _value6+0, 0
	ADDWF      R0+0, 0
	MOVWF      _gtime+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _value6+1, 0
	MOVWF      _gtime+1
;MAIN.c,233 :: 		delay_ms(10);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_main79:
	DECFSZ     R13+0, 1
	GOTO       L_main79
	DECFSZ     R12+0, 1
	GOTO       L_main79
	NOP
;MAIN.c,234 :: 		dendo_xanh1(gtime, ytime);
	MOVF       _gtime+0, 0
	MOVWF      FARG_dendo_xanh1_time+0
	MOVF       _gtime+1, 0
	MOVWF      FARG_dendo_xanh1_time+1
	MOVF       _ytime+0, 0
	MOVWF      FARG_dendo_xanh1_plustime+0
	MOVF       _ytime+1, 0
	MOVWF      FARG_dendo_xanh1_plustime+1
	CALL       _dendo_xanh1+0
;MAIN.c,235 :: 		dendo_vang1(ytime);
	MOVF       _ytime+0, 0
	MOVWF      FARG_dendo_vang1_plustime+0
	MOVF       _ytime+1, 0
	MOVWF      FARG_dendo_vang1_plustime+1
	CALL       _dendo_vang1+0
;MAIN.c,236 :: 		dendo_xanh2(gtime, ytime);
	MOVF       _gtime+0, 0
	MOVWF      FARG_dendo_xanh2_time+0
	MOVF       _gtime+1, 0
	MOVWF      FARG_dendo_xanh2_time+1
	MOVF       _ytime+0, 0
	MOVWF      FARG_dendo_xanh2_plustime+0
	MOVF       _ytime+1, 0
	MOVWF      FARG_dendo_xanh2_plustime+1
	CALL       _dendo_xanh2+0
;MAIN.c,237 :: 		dendo_vang2(ytime);
	MOVF       _ytime+0, 0
	MOVWF      FARG_dendo_vang2_plustime+0
	MOVF       _ytime+1, 0
	MOVWF      FARG_dendo_vang2_plustime+1
	CALL       _dendo_vang2+0
;MAIN.c,238 :: 		}
	GOTO       L_main69
;MAIN.c,239 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
