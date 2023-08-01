
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,4 :: 		void interrupt()
;MyProject.c,6 :: 		if(intf_bit == 1)
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;MyProject.c,8 :: 		intf_bit = 0 ;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;MyProject.c,9 :: 		while(portb.B0 == 1) {
L_interrupt1:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt2
;MyProject.c,10 :: 		if(portb.b5 == 1)
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt3
;MyProject.c,12 :: 		if((portc.b0 ==1) || (portc.b1 == 1))
	BTFSC      PORTC+0, 0
	GOTO       L__interrupt67
	BTFSC      PORTC+0, 1
	GOTO       L__interrupt67
	GOTO       L_interrupt6
L__interrupt67:
;MyProject.c,14 :: 		if(portc.b0 == 1)
	BTFSS      PORTC+0, 0
	GOTO       L_interrupt7
;MyProject.c,15 :: 		portc = 0b00010010 ;
	MOVLW      18
	MOVWF      PORTC+0
L_interrupt7:
;MyProject.c,16 :: 		porta.b0 = 1 ;
	BSF        PORTA+0, 0
;MyProject.c,17 :: 		porta.b1 = 0 ;
	BCF        PORTA+0, 1
;MyProject.c,18 :: 		for(count_units = 3 ; count_units >= 0 ; count_units--)
	MOVLW      3
	MOVWF      _count_units+0
	MOVLW      0
	MOVWF      _count_units+1
L_interrupt8:
	MOVLW      128
	XORWF      _count_units+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt76
	MOVLW      0
	SUBWF      _count_units+0, 0
L__interrupt76:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt9
;MyProject.c,20 :: 		portd = count_units ;
	MOVF       _count_units+0, 0
	MOVWF      PORTD+0
;MyProject.c,21 :: 		delay_ms(500) ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt11:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt11
	DECFSZ     R12+0, 1
	GOTO       L_interrupt11
	DECFSZ     R11+0, 1
	GOTO       L_interrupt11
	NOP
	NOP
;MyProject.c,18 :: 		for(count_units = 3 ; count_units >= 0 ; count_units--)
	MOVLW      1
	SUBWF      _count_units+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count_units+1, 1
;MyProject.c,22 :: 		}
	GOTO       L_interrupt8
L_interrupt9:
;MyProject.c,23 :: 		porta.B1 = 1 ;
	BSF        PORTA+0, 1
;MyProject.c,24 :: 		portc = 0b01000100 ;
	MOVLW      68
	MOVWF      PORTC+0
;MyProject.c,25 :: 		flag = 3 ;
	MOVLW      3
	MOVWF      _flag+0
;MyProject.c,26 :: 		while(portb.B0 == 1 && portb.b5 ==1) ;
L_interrupt12:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt13
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt13
L__interrupt66:
	GOTO       L_interrupt12
L_interrupt13:
;MyProject.c,27 :: 		}
	GOTO       L_interrupt16
L_interrupt6:
;MyProject.c,28 :: 		else if(portc.b6 == 1 || portc.b5 ==1)
	BTFSC      PORTC+0, 6
	GOTO       L__interrupt65
	BTFSC      PORTC+0, 5
	GOTO       L__interrupt65
	GOTO       L_interrupt19
L__interrupt65:
;MyProject.c,30 :: 		if(portc.b6 == 1)
	BTFSS      PORTC+0, 6
	GOTO       L_interrupt20
;MyProject.c,31 :: 		portc = 0b00100100 ;
	MOVLW      36
	MOVWF      PORTC+0
L_interrupt20:
;MyProject.c,32 :: 		porta.B1 = 1 ;
	BSF        PORTA+0, 1
;MyProject.c,33 :: 		porta.b0 = 0 ;
	BCF        PORTA+0, 0
;MyProject.c,34 :: 		for(count_units = 3 ; count_units >= 0 ; count_units--)
	MOVLW      3
	MOVWF      _count_units+0
	MOVLW      0
	MOVWF      _count_units+1
L_interrupt21:
	MOVLW      128
	XORWF      _count_units+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt77
	MOVLW      0
	SUBWF      _count_units+0, 0
L__interrupt77:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt22
;MyProject.c,36 :: 		portd = count_units ;
	MOVF       _count_units+0, 0
	MOVWF      PORTD+0
;MyProject.c,37 :: 		delay_ms(500) ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_interrupt24:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt24
	DECFSZ     R12+0, 1
	GOTO       L_interrupt24
	DECFSZ     R11+0, 1
	GOTO       L_interrupt24
	NOP
	NOP
;MyProject.c,34 :: 		for(count_units = 3 ; count_units >= 0 ; count_units--)
	MOVLW      1
	SUBWF      _count_units+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count_units+1, 1
;MyProject.c,38 :: 		}
	GOTO       L_interrupt21
L_interrupt22:
;MyProject.c,39 :: 		porta.b0 = 1 ;
	BSF        PORTA+0, 0
;MyProject.c,40 :: 		portc = 0b00010001 ;
	MOVLW      17
	MOVWF      PORTC+0
;MyProject.c,41 :: 		flag = 2  ;
	MOVLW      2
	MOVWF      _flag+0
;MyProject.c,42 :: 		while(portb.B0 == 1 && portb.b5 ==1) ;
L_interrupt25:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt26
	BTFSS      PORTB+0, 5
	GOTO       L_interrupt26
L__interrupt64:
	GOTO       L_interrupt25
L_interrupt26:
;MyProject.c,43 :: 		}
L_interrupt19:
L_interrupt16:
;MyProject.c,44 :: 		}
L_interrupt3:
;MyProject.c,45 :: 		}
	GOTO       L_interrupt1
L_interrupt2:
;MyProject.c,46 :: 		}
L_interrupt0:
;MyProject.c,47 :: 		}
L_end_interrupt:
L__interrupt75:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,48 :: 		void main() {
;MyProject.c,49 :: 		ADCON1 =  6  ;
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,50 :: 		trisa = 0 ;
	CLRF       TRISA+0
;MyProject.c,51 :: 		porta = 0 ;
	CLRF       PORTA+0
;MyProject.c,52 :: 		trisc = 0 ;
	CLRF       TRISC+0
;MyProject.c,53 :: 		portc = 0;
	CLRF       PORTC+0
;MyProject.c,54 :: 		trisd = 0 ;
	CLRF       TRISD+0
;MyProject.c,55 :: 		portd = 255 ;
	MOVLW      255
	MOVWF      PORTD+0
;MyProject.c,56 :: 		trisb.b0 = 1 ;
	BSF        TRISB+0, 0
;MyProject.c,57 :: 		trisb.b5 = 1 ;
	BSF        TRISB+0, 5
;MyProject.c,58 :: 		while(portb.b0) ;
L_main29:
	BTFSS      PORTB+0, 0
	GOTO       L_main30
	GOTO       L_main29
L_main30:
;MyProject.c,59 :: 		while(1)
L_main31:
;MyProject.c,61 :: 		if(flag == 0 || flag == 2)
	MOVF       _flag+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L__main73
	MOVF       _flag+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__main73
	GOTO       L_main35
L__main73:
;MyProject.c,63 :: 		porta = 0 ;
	CLRF       PORTA+0
;MyProject.c,64 :: 		portc.b4 = 1 ;
	BSF        PORTC+0, 4
;MyProject.c,65 :: 		portc.b0 = 1 ;
	BSF        PORTC+0, 0
;MyProject.c,66 :: 		for(count_tenth = 35 ; count_tenth >= 0 ; count_tenth -- )
	MOVLW      35
	MOVWF      _count_tenth+0
	MOVLW      0
	MOVWF      _count_tenth+1
L_main36:
	MOVLW      128
	XORWF      _count_tenth+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      0
	SUBWF      _count_tenth+0, 0
L__main79:
	BTFSS      STATUS+0, 0
	GOTO       L_main37
;MyProject.c,68 :: 		if(count_tenth <= 31 && count_tenth >= 26 || (count_tenth <= 15 && count_tenth >= 10))
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count_tenth+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVF       _count_tenth+0, 0
	SUBLW      31
L__main80:
	BTFSS      STATUS+0, 0
	GOTO       L__main72
	MOVLW      128
	XORWF      _count_tenth+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      26
	SUBWF      _count_tenth+0, 0
L__main81:
	BTFSS      STATUS+0, 0
	GOTO       L__main72
	GOTO       L__main70
L__main72:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count_tenth+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVF       _count_tenth+0, 0
	SUBLW      15
L__main82:
	BTFSS      STATUS+0, 0
	GOTO       L__main71
	MOVLW      128
	XORWF      _count_tenth+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      10
	SUBWF      _count_tenth+0, 0
L__main83:
	BTFSS      STATUS+0, 0
	GOTO       L__main71
	GOTO       L__main70
L__main71:
	GOTO       L_main45
L__main70:
;MyProject.c,69 :: 		continue ;
	GOTO       L_main38
L_main45:
;MyProject.c,70 :: 		if( count_tenth == 0x03)
	MOVLW      0
	XORWF      _count_tenth+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      3
	XORWF      _count_tenth+0, 0
L__main84:
	BTFSS      STATUS+0, 2
	GOTO       L_main46
;MyProject.c,72 :: 		portc.b0 = 0 ;
	BCF        PORTC+0, 0
;MyProject.c,73 :: 		portc.b1 = 1 ;
	BSF        PORTC+0, 1
;MyProject.c,74 :: 		}
L_main46:
;MyProject.c,75 :: 		portd = count_tenth ;
	MOVF       _count_tenth+0, 0
	MOVWF      PORTD+0
;MyProject.c,76 :: 		flag = 1 ;
	MOVLW      1
	MOVWF      _flag+0
;MyProject.c,77 :: 		delay_ms(500) ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
;MyProject.c,78 :: 		if(portb.b0 == 1)
	BTFSS      PORTB+0, 0
	GOTO       L_main48
;MyProject.c,80 :: 		INTE_BIT = 1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;MyProject.c,81 :: 		INTEDG_BIT = 1 ;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;MyProject.c,82 :: 		GIE_BIT = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,83 :: 		}
L_main48:
;MyProject.c,84 :: 		if(flag != 1)
	MOVF       _flag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main49
;MyProject.c,85 :: 		break ;
	GOTO       L_main37
L_main49:
;MyProject.c,86 :: 		}
L_main38:
;MyProject.c,66 :: 		for(count_tenth = 35 ; count_tenth >= 0 ; count_tenth -- )
	MOVLW      1
	SUBWF      _count_tenth+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count_tenth+1, 1
;MyProject.c,86 :: 		}
	GOTO       L_main36
L_main37:
;MyProject.c,87 :: 		}
	GOTO       L_main50
L_main35:
;MyProject.c,88 :: 		else if(flag == 1 || flag == 3)
	MOVF       _flag+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__main69
	MOVF       _flag+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__main69
	GOTO       L_main53
L__main69:
;MyProject.c,90 :: 		porta =  0 ;
	CLRF       PORTA+0
;MyProject.c,91 :: 		portc = 0 ;
	CLRF       PORTC+0
;MyProject.c,92 :: 		portc.b6 =1 ;
	BSF        PORTC+0, 6
;MyProject.c,93 :: 		portc.b2 = 1 ;
	BSF        PORTC+0, 2
;MyProject.c,94 :: 		for(count_tenth = 21 ; count_tenth >= 0 ; count_tenth -- )
	MOVLW      21
	MOVWF      _count_tenth+0
	MOVLW      0
	MOVWF      _count_tenth+1
L_main54:
	MOVLW      128
	XORWF      _count_tenth+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      0
	SUBWF      _count_tenth+0, 0
L__main85:
	BTFSS      STATUS+0, 0
	GOTO       L_main55
;MyProject.c,96 :: 		if(count_tenth <= 15 && count_tenth >= 10)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count_tenth+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVF       _count_tenth+0, 0
	SUBLW      15
L__main86:
	BTFSS      STATUS+0, 0
	GOTO       L_main59
	MOVLW      128
	XORWF      _count_tenth+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      10
	SUBWF      _count_tenth+0, 0
L__main87:
	BTFSS      STATUS+0, 0
	GOTO       L_main59
L__main68:
;MyProject.c,97 :: 		continue ;
	GOTO       L_main56
L_main59:
;MyProject.c,98 :: 		if( count_tenth == 0x03)
	MOVLW      0
	XORWF      _count_tenth+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVLW      3
	XORWF      _count_tenth+0, 0
L__main88:
	BTFSS      STATUS+0, 2
	GOTO       L_main60
;MyProject.c,100 :: 		portc.B6 = 0 ;
	BCF        PORTC+0, 6
;MyProject.c,101 :: 		portc.B5 = 1 ;
	BSF        PORTC+0, 5
;MyProject.c,102 :: 		}
L_main60:
;MyProject.c,103 :: 		portd = count_tenth ;
	MOVF       _count_tenth+0, 0
	MOVWF      PORTD+0
;MyProject.c,104 :: 		flag = 0 ;
	CLRF       _flag+0
;MyProject.c,105 :: 		delay_ms(500) ;
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	DECFSZ     R11+0, 1
	GOTO       L_main61
	NOP
	NOP
;MyProject.c,106 :: 		if(portb.b0 == 1)
	BTFSS      PORTB+0, 0
	GOTO       L_main62
;MyProject.c,108 :: 		INTE_BIT = 1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;MyProject.c,109 :: 		INTEDG_BIT = 1 ;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;MyProject.c,110 :: 		GIE_BIT = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;MyProject.c,111 :: 		}
L_main62:
;MyProject.c,112 :: 		if(flag != 0)
	MOVF       _flag+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main63
;MyProject.c,113 :: 		break ;
	GOTO       L_main55
L_main63:
;MyProject.c,114 :: 		}
L_main56:
;MyProject.c,94 :: 		for(count_tenth = 21 ; count_tenth >= 0 ; count_tenth -- )
	MOVLW      1
	SUBWF      _count_tenth+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count_tenth+1, 1
;MyProject.c,114 :: 		}
	GOTO       L_main54
L_main55:
;MyProject.c,115 :: 		}
L_main53:
L_main50:
;MyProject.c,116 :: 		portc = 0 ;
	CLRF       PORTC+0
;MyProject.c,117 :: 		}
	GOTO       L_main31
;MyProject.c,118 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
