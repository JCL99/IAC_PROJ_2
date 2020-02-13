;------------------------------------------------------------------------------;
; Projeto de IAC - Versao final
;
; Numero 90705	André Miguel Santos Silva
; Numero 90710	Diogo De Melo Pinto
; Numero 90732	João Carlos Soares Marnoto Gaspar Lopes
;------------------------------------------------------------------------------;
;Constantes
LIN EQU 0C000H             ; ENDEREÇO DE ENTRADA TECLADO (LINHA)
COL EQU 0E000H             ; ENDEREÇO DE SAIDA TECLADO (COLUNA)
HEX EQU 0A000H             ; ENDEREÇO DOS DISPLAYS HEXA
PIX EQU 08000H             ; ENDEREÇO DO PIXEL SCREEN
;------------------------------------------------------------------------------;
;Variáveis de estado
PLACE 2000H
incrementador:
							WORD 0H
jogo:      WORD 0H
pausa:     WORD 0000H
score:     WORD 0000H
tecla:     WORD 0FFH
ultimaTecla: WORD 0FFH
gerador:   WORD 000H
controlo:  WORD 000H

descerNinjas: WORD 0H
mexerArmas: WORD 0H

mascaras:
	        STRING 80H, 40H, 20H, 10H, 8H, 4H, 2H, 1H


ninja1Vivo:
            STRING 1H
ninja2Vivo:
						STRING 1H
ninja3Vivo:
						STRING 1H
ninja4Vivo:
						STRING 1H


PLACE 3000H
ninja1_pos:
           STRING 0FH, 0H
ninja2_pos:
           STRING 0FH, 4H
ninja3_pos:
           STRING 0FH, 8H
ninja4_pos:
           STRING 0FH, 0CH

arma_pos:
           STRING 0H, 1CH
presente_pos:
           STRING 01DH, 1CH

figuraNinja:
           STRING 3,4
           STRING 0,1,0
           STRING 1,1,1
           STRING 0,1,0
           STRING 1,0,1
figuraArma:
           STRING 3,3
           STRING 1,0,1
           STRING 0,1,0
           STRING 1,0,1
figuraPresente:
           STRING 3,3
           STRING 0,1,0
           STRING 1,1,1
           STRING 0,1,0
figuraApagaNinja:
            STRING 3,4
            STRING 0,0,0
            STRING 0,0,0
            STRING 0,0,0
            STRING 0,0,0
figuraApagaArma:
            STRING 3,3
            STRING 0,0,0
            STRING 0,0,0
            STRING 0,0,0
figuraApagaPresente:
            STRING 3,3
            STRING 0,0,0
            STRING 0,0,0
            STRING 0,0,0

ecraInicio:
			STRING 11111111b,11111111b,11111111b,11111111b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000001b,10000000b,00000001b
			STRING 10000000b,00000010b,01000000b,00000001b
			STRING 10000000b,00000010b,00000000b,00000001b
			STRING 10000000b,00000010b,00000000b,00000001b
			STRING 10000000b,00000010b,01000000b,00000001b
			STRING 10000000b,00000001b,10000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10111110b,11001110b,10000010b,01000101b
			STRING 10001001b,00101001b,10000101b,00101001b
			STRING 10001001b,00101001b,10001000b,10010001b
			STRING 10001001b,00101110b,10001111b,10010001b
			STRING 10001001b,00101000b,10001000b,10010001b
			STRING 10001000b,11001000b,11111000b,10010001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 10000000b,00000000b,00000000b,00000001b
			STRING 11111111b,11111111b,11111111b,11111111b

ecraPausa:
          STRING 00000000b, 00000000b, 00000000b, 00000000b
          STRING 00000000b, 00000111b, 11100000b, 00000000b
          STRING 00000000b, 00111111b, 11111100b, 00000000b
          STRING 00000000b, 11111111b, 11111111b, 00000000b
          STRING 00000001b, 11111110b, 01111111b, 10000000b
          STRING 00000111b, 11100000b, 00000111b, 11100000b
          STRING 00000111b, 11000000b, 00000011b, 11100000b
          STRING 00001111b, 00000000b, 00000000b, 11110000b
          STRING 00011110b, 00000000b, 00000000b, 01111000b
          STRING 00011110b, 00000100b, 00100000b, 01111000b
          STRING 00111100b, 00001110b, 01110000b, 00111100b
          STRING 00111000b, 00001110b, 01110000b, 00011100b
          STRING 00111000b, 00001110b, 01110000b, 00011100b
          STRING 01111000b, 00001110b, 01110000b, 00011110b
          STRING 01111000b, 00001110b, 01110000b, 00011110b
          STRING 01110000b, 00001110b, 01110000b, 00001110b
          STRING 01110000b, 00001110b, 01110000b, 00001110b
          STRING 01111000b, 00001110b, 01110000b, 00011110b
          STRING 01111000b, 00001110b, 01110000b, 00011110b
          STRING 00111000b, 00001110b, 01110000b, 00011100b
          STRING 00111000b, 00001110b, 01110000b, 00011100b
          STRING 00111100b, 00001110b, 01110000b, 00111100b
          STRING 00011110b, 00000100b, 00100000b, 01111000b
          STRING 00011110b, 00000000b, 00000000b, 01111000b
          STRING 00001111b, 00000000b, 00000000b, 11110000b
          STRING 00000111b, 11000000b, 00000011b, 11100000b
          STRING 00000111b, 11100000b, 00000111b, 11100000b
          STRING 00000001b, 11111110b, 01111111b, 10000000b
          STRING 00000000b, 11111111b, 11111111b, 00000000b
          STRING 00000000b, 00111111b, 11111100b, 00000000b
          STRING 00000000b, 00000111b, 11100000b, 00000000b
		  STRING 00000000b, 00000000b, 00000000b, 00000000b

tab:        WORD    rot0
			      WORD	  rot1

;------------------------------------------------------------------------------;
;INICIALIZAR O SP
	PLACE 4000H
	pilha: TABLE 50H
	fim_pilha:
	PLACE 0000H
	MOV SP, fim_pilha
	MOV BTE, tab           ; incializa BTE
	EI0
	EI1
	EI
;------------------------------------------------------------------------------;
  CALL rot_resetScore
  CALL rot_resetScreen
game:
	CALL rot_inicioJogo
  CALL rot_Score
  CALL rot_Teclado
  CALL rot_pausa
  CALL rot_ninja
  CALL rot_armaPresente
  ;CALL rot_controlo
  ;CALL rot_gerador
  CALL rot_fimDeJogo
game_fim:
JMP game
;------------------------------------------------------------------------------;
rot_ninja:

	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R7

	MOV R1, jogo			;se nao estiver em pausa ou no inicio do jogo
	MOV R2, [R1]
	CMP R2, 0000H
	JNZ allowed____
	JMP fim_rot_ninja

allowed____:
	CMP R2, 0002H      ;se nao estiver em pausa ou no fim do jogo
	JNZ allowed_____
	JMP fim_rot_ninja

allowed_____:
	MOV R0, pausa       ;se nao estiver em pausa ou no fim do jogo
	MOV R1, [R0]
	MOV R0, 0FFFFH
	CMP R1, R0
	JNZ allowed
	JMP fim_rot_ninja

allowed:

	CALL aux_desceNinjas   ;descer ninjas caso a flag das interrupcoes esteja ativa

	MOV R0, tecla
	MOV R1, [R0]
	MOV R0, 7H
	SUB R0, R1
	JNN nextStep
	JMP desenhar_ninjas       ; ver se foi carregada uma tecla relacionada com os ninjas

nextStep:

	MOV R0, tecla             ;decidir a operacao de acordo com a tecla
	MOV R1, [R0]

	MOV R0, 0H
	CMP R0, R1
	JZ sobeNinja1
	MOV R0, 1H
	CMP R0, R1
	JZ sobeNinja2
	MOV R0, 2H
	CMP R0, R1
	JZ sobeNinja3
	MOV R0, 3H
	CMP R0, R1
	JZ sobeNinja4
	MOV R0, 4H
	CMP R0, R1
	JZ desceNinja1
	MOV R0, 5H
	CMP R0, R1
	JZ desceNinja2
	MOV R0, 6H
	CMP R0, R1
	JZ desceNinja3
	MOV R0, 7H
	CMP R0, R1
	JZ desceNinja4

sobeNinja1:                  ;sobe ninja respectivo se ainda estiver vivo
	MOV R0, figuraApagaNinja
	MOV R7, ninja1_pos
	MOVB R1, [R7]
	CMP R1, 0H
	JZ desenhar_ninjas
	CALL desenha_figura
	MOV R0, ninja1_pos
	MOVB R1, [R0]
	SUB R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

sobeNinja2:
	MOV R0, figuraApagaNinja
	MOV R7, ninja2_pos
	MOVB R1, [R7]
	CMP R1, 0H
	JZ desenhar_ninjas
	CALL desenha_figura
	MOV R0, ninja2_pos
	MOVB R1, [R0]
	SUB R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

sobeNinja3:
	MOV R0, figuraApagaNinja
	MOV R7, ninja3_pos
	MOVB R1, [R7]
	CMP R1, 0H
	JZ desenhar_ninjas
	CALL desenha_figura
	MOV R0, ninja3_pos
	MOVB R1, [R0]
	SUB R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

sobeNinja4:
	MOV R0, figuraApagaNinja
	MOV R7, ninja4_pos
	MOVB R1, [R7]
	CMP R1, 0H
	JZ desenhar_ninjas
	CALL desenha_figura
	MOV R0, ninja4_pos
	MOVB R1, [R0]
	SUB R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

desceNinja1: 									;desce ninja respectivo se ainda estiver vivo
	MOV R0, figuraApagaNinja
	MOV R7, ninja1_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja1_allowed
	MOV R1, ninja1Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja1_allowed:
	CALL desenha_figura
	MOV R0, ninja1_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

desceNinja2:
	MOV R0, figuraApagaNinja
	MOV R7, ninja2_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja2_allowed
	MOV R1, ninja2Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja2_allowed:
	CALL desenha_figura
	MOV R0, ninja2_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

desceNinja3:
	MOV R0, figuraApagaNinja
	MOV R7, ninja3_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja3_allowed
	MOV R1, ninja3Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja3_allowed:
	CALL desenha_figura
	MOV R0, ninja3_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

desceNinja4:
	MOV R0, figuraApagaNinja
	MOV R7, ninja4_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja4_allowed
	MOV R1, ninja4Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja4_allowed:
	CALL desenha_figura
	MOV R0, ninja4_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1
	JMP desenhar_ninjas

desenhar_ninjas:							;desenhar os 4 ninjas
	MOV R7, ninja1_pos
	MOV R8, ninja1Vivo

proxNinja:
	MOV R0, figuraNinja ;se esta vivo entao desenha o ninja
	MOV R2, 2H
	MOVB R3, [R8]
	ADD R8, 1H
	CMP R3, 1H
	JZ ninjaEstaMorto
	MOV R0, figuraApagaNinja ; Se esta morto, entao desenha nada

ninjaEstaMorto:
	CALL desenha_figura
	MOV R3, ninja4_pos
	ADD R3, 2H
	ADD R7 ,2H
	CMP R7, R3
	JNZ proxNinja

fim_rot_ninja:

	POP R7
	POP R3
	POP R2
	POP R1
	POP R0

	RET
;------------------------------------------------------------------------------;
rot_Score:

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;
  PUSH R3              ;
	PUSH R4

  MOV R1, HEX          ;R1 <--- ENDEREÇO DOS DISPLAYS HEXA
  MOV R2, score        ;R2 <--- ENDEREÇO DO SCORE
  MOV R3, [R2]         ;R2 <--- SCORE

	MOV R4, R3           ;conversao de hexadecimal para decimal
	MOV R2, 0AH
	MOD R3, R2
	DIV R4, R2
	SHL R4, 4
	OR R3, R4

  MOVB [R1], R3         ;UPDATE DO SCORE

	fim_rot_score:
	POP R4
  POP R3               ;Repor os registos com os seus valores antes da rotina ser chamada
  POP R2               ;
  POP R1               ;

  RET
;------------------------------------------------------------------------------;
rot_teclaNaoPrimida:
;Esta rotina altera o valor da variavel de estado score para 0

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;

  MOV R1, tecla        ;R1 <--- ENDERÇO DO SCORE
  MOV R2, 0FFH
  MOV [R1], R2
	MOV R1, ultimaTecla        ;R1 <--- ENDERÇO DO SCORE
  MOV R2, 0FFH
  MOV [R1], R2

  POP R2               ;Repor os registos com os seus valores antes da rotina ser chamada
  POP R1               ;

RET
;------------------------------------------------------------------------------;
rot_resetScore:
;Esta rotina altera o valor da variavel de estado score para 0

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;

  MOV R1, score        ;R1 <--- ENDERÇO DO SCORE
  MOV R2, 00H
  MOV [R1], R2

  POP R2               ;Repor os registos com os seus valores antes da rotina ser chamada
  POP R1               ;

RET
;------------------------------------------------------------------------------;
rot_Teclado:

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;
  PUSH R3              ;
  PUSH R4              ;
  PUSH R5              ;
  PUSH R6              ;
  PUSH R7              ;
  PUSH R8              ;

inicio_rot_teclado:
  MOV R7, 8H    ;ULTIMA LINHA DO TECLADO
  MOV R1, LIN                  ;ENDEREÇO DAS LINHAS  ---> R1
  MOV R2, COL                  ;ENDEREÇO DAS COLUNAS ---> R2\
  MOV R5, 1H
procurarTecla:
  MOVB [R1], R5       ;ENVIA A LINHA A PROCURAR, LINHA ---> ENDEREÇO DA LINHA (PERIFERICO)
  MOVB R6, [R2]       ;RECEBE O OUTPUT DA COLUNA NO R6
  CMP R6, 0H          ;SE NAO RECEBEU NENHUMA TECLA:
  JZ proxLinha        ;PROCURA NA PROXIMA LINHA
  JMP teclaPrimida    ;TECLA FOI PRIMIDA
proxLinha:
  CMP R5, R7          ;SE CHEGAR A ULTIMA LINHA:
  JNZ next ;CONTINUAR O PROGRAMA
  CALL rot_teclaNaoPrimida
  JMP fim_rot_teclado
  next:
  MOV R8, 2H
  MUL R5, R8
  JMP procurarTecla   ;PROCURAR TECLA NA PROXIMA LINHA
teclaPrimida:
  MOV R1, 0H          ;R4 É UM CONTADOR INICIALIDZADO A 0: NUMERO DA LINHA EM HEXA (0 A 3)
  MOV R2, 0H          ;R5 É UM CONTADOR INICIALIDZADO A 0: NUMERO DA COLUNA EM HEXA (0 A 3)
descodLin:
  CMP R5, 1H          ;SE R5 = 1000H:
  JZ descodCol        ;DESCODIFICAR A COLUNA SE JA SE TIVER DESCODIFICADO A LINHA
  SHR R5, 1H          ;SHIFTRIGHT DE 1 BIT PARA VER EM QUE LINHA SE ENCONTRA A TECLA PRIMIDA (HEXA)
  ADD R1, 1H          ;INCREMENTAR O CONTADOR R4 EM 1 PARA CONTAR O NUMERO DA LINHA
  JMP descodLin       ;VOLTAR A CONTAR
descodCol:
  CMP R6, 1H          ;SE R6 = 0001H:
  JZ teclaReal        ;DESCODIFICAR A TECLA NO FORMATO FINAL (0H A FH)
  SHR R6, 1H          ;SHIFTRIGHT DE 1 BIT PARA VER EM QUE COLUNA SE ENCONTRA A TECLA PRIMIDA (HEXA)
  ADD R2, 1H          ;INCREMENTAR O CONTADOR R5 EM 1 PARA CONTAR O NUMERO DA COLUNA
  JMP descodCol       ;VOLTAR A CONTAR
teclaReal:
  MOV R3, 4
  MUL R1, R3          ;R4 = R4*4 (LINHA * 4)
  ADD R1, R2          ;R4 = R4 + R5 (LINHA * 4 + COLUNA) A TECLA FINAL (0H A FH) É DADA POR ESTA FORMULA
	MOV R3, ultimaTecla
  MOV R2, [R3]        ;Tecla primida guardada na "tecla"
	CMP R2, R1
	JNZ teclaContinuamentePrimida
	MOV R3, tecla
	MOV R2, 0FFH
	MOV [R3], R2
	JMP fim_rot_teclado
	teclaContinuamentePrimida:
	MOV R3, tecla
	MOV [R3], R1        ;Tecla primida guardada na "tecla"
	MOV R3, ultimaTecla
	MOV [R3], R1        ;Tecla primida guardada na "tecla"
  fim_rot_teclado:

  POP R8              ;Salvaguardar os regsitos modificados pela rotina
  POP R7              ;
  POP R6              ;
  POP R5              ;
  POP R4              ;
  POP R3              ;
  POP R2              ;
  POP R1              ;

RET
;------------------------------------------------------------------------------;
rot_fimDeJogo:
;ESTA ROTINA ALTERA TODA A TABELA DE PIXEIS PARA UM PADRAO XADREZ

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;
  PUSH R3              ;
  PUSH R4              ;
  PUSH R5              ;
  PUSH R6              ;

	MOV R1, tecla					;se carregou na tecla E
	MOV R2, [R1]
	MOV R1, 0EH
	CMP R1, R2
	JNZ _nextStep___
	MOV R1, jogo					;ATIVAR FLAG DE fim de jogo
	MOV R2, 2H
	MOV [R1], R2
	_nextStep___:

	MOV R1, jogo					;se nao estiver em fim de jogo
	MOV R2, 2H
	MOV R3, [R1]
	CMP R3, R2
	JNZ _nextStep__
	MOV R1, tecla         ;se a tecla for C
	MOV R2, [R1]
	MOV R1, 0CH
	CMP R2, R1
	JNZ _nextStep_        ;COMECA O JOGO, reiniciando
	MOV R1, jogo
	MOV R2, 1H
	MOV [R1], R2
	MOV R1, pausa
	MOV R2, 0H
	MOV [R1], R2
	CALL rot_resetNinjas
	CALL rot_resetScreen
	CALL rot_resetScore
	JMP fim_rot_fimDeJogo
	_nextStep__:

	MOV R1, ninja1Vivo
	MOV R3, 0H
	MOVB R2, [R1]
	CMP R2, 0H
	JNZ fim_rot_fimDeJogo
	ADD R1, 1H
	MOVB R2, [R1]
	CMP R2, 0H
	JNZ fim_rot_fimDeJogo
	ADD R1, 1H
	MOVB R2, [R1]
	CMP R2, 0H
	JNZ fim_rot_fimDeJogo
	ADD R1, 1H
	MOVB R2, [R1]
	CMP R2, 0H
	JNZ fim_rot_fimDeJogo

	MOV R1, jogo
	MOV R2, 2H
	MOV [R1], R2

	_nextStep_:

  MOV R1, 1H           ;R1 É UM INCREMENTO = 1
  MOV R2, PIX        ;R2(2000H) É O INICIO DA TABELA DE BYTES QUE VAI REPRESENTAR O PIXELSCREEN
  MOV R3, 55H         ;055H É 10101010 QUE VAI DESENHAR A QUADRICULA FINAL ALTERNADA
  MOV R4, R2
  MOV R5, 80H
  ADD R4, R5       ;É O FIM DA TABELA
  MOV R5, 0H           ;R5 É CONTADOR = 0
  MOV R6, 0AAH          ;0AAH É IGUAL A 0AAH MAS COM 0 NO INICO I.E. 01010101

  draw_Pixel_ciclo:
  CMP R5, 4H           ;DE 4 em 4 bytes
  JNZ ror_ciclo_return
  MOV R5, 0H           ;REINICIAR O O CONTADOR
  SWAP R6, R3          ;TROCAR DE 10101010 PARA 01010101
  ror_ciclo_return:
  MOVB [R2], R3        ;ESCREVER BYTE DA TABELA NO BYTE DO PIXELSCREEN
  ADD R2, 1H           ;PROXIMO BYTE
  ADD R5, 1H           ;CONTADOR DE BYTES += 1
  CMP R2, R4           ;CHEGOU AO FIM DA TABELA ?
  JNZ draw_Pixel_ciclo

	fim_rot_fimDeJogo:
  POP R6               ;Repor os registos com os seus valores antes da rotina ser chamada
  POP R5               ;
  POP R4               ;
  POP R3               ;
  POP R2               ;
  POP R1               ;

  RET
;------------------------------------------------------------------------------;
rot_resetScreen:
;ESTA ROTINA ALTERA TODO O PIXEL SCREEN PARA UM ECRA BRANCO

  PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
  PUSH R2              ;
  PUSH R3              ;

  MOV R1, PIX					;escrever 0 em todos os bytes do pixelscreen
  MOV R2, PIX
  MOV R3, 80H
  ADD R2, R3
  MOV R4, 0H

  ciclo_:
  MOVB [R1], R4        ;ESCREVER BYTE NO PIXELSCREEN
  ADD R1, 1H           ;CONTADOR DE BYTES += 1
  CMP R1, R2           ;CHEGOU AO FIM DA TABELA ?
  JNZ ciclo_

  POP R3               ;Repor os registos com os seus valores antes da rotina ser chamada
  POP R2               ;
  POP R1               ;

  RET
;------------------------------------------------------------------------------;
desenha_figura:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	PUSH R9
	PUSH R10

	MOVB R3, [R7] ; coordenada da linha
	ADD  R7, 1
	MOVB R4, [R7] ; coordenada da coluna


	MOV  R10, R0   ; figura a desenhar
	MOVB R9, [R10] ; contador coluna
	ADD  R10, 1
	MOVB R8, [R10] ; contador linha

coluna:
	ADD  R10, 1
	MOVB R2, [R10]
	CALL draw_pixel
	ADD  R4, 1	   ; proxima linha
	SUB  R9, 1
	CMP  R9, 0	   ; se acabarem as linhas, ver se ha proxima coluna
	JNZ  coluna

linha:
	MOV  R6, R0
	MOVB R9, [R6]
	MOVB R4, [R7]
	ADD  R3,  1     ; proxima coluna
	SUB  R8,  1
	CMP  R8,  0		; se acabarem as colunas entao acaba o ciclo
	JNZ  coluna

fim_rot_figura_pixel:
	POP R10
	POP R9
	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET
;------------------------------------------------------------------------------;
;
; ROTINA ALTERA PIXEL - Altera os pixeis conforme o input
;
; Recebe - R2 como Ligar/Desligar, R3 como LINHA, R4 como COLUNA
;
;------------------------------------------------------------------------------;
draw_pixel:
	PUSH R1
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	PUSH R9
	PUSH R10

	MOV  R5, R3 ; linha
	MOV  R6, R4	; coluna
	MOV  R1, 4
	MUL  R5, R1
	SHL  R1, 1
	DIV  R6, R1
	ADD  R5, R6 ; endere�o byte relativo
 	MOV  R7, PIX
	ADD  R7, R5 ; endere�o byte real
	MOV  R6, R4
	MOV  R8, 8
	MOD  R6, R8 ; BIT
	MOV  R8, mascaras
	ADD  R8, R6
	MOVB R9, [R8] ; escolher mascara
	MOVB R10, [R7] ; guardar byte atual
	CMP  R2, 1
	JZ   liga_pixel
	JMP  desliga_pixel

liga_pixel:
	OR   R10, R9 ; ligar pixel
	JMP  fim_rotina_draw_pixel

desliga_pixel:
	NOT  R9
	AND  R10, R9 ; desliga pixel

fim_rotina_draw_pixel:
	MOVB [R7], R10

	POP R10
	POP R9
	POP R8
	POP R7
	POP R6
	POP R5
	POP R1
	RET
;------------------------------------------------------------------------------;
rot_pausa:
;Esta rotina desenha o ecrã a partir da tabela de strings

	PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
	PUSH R2              ;
	PUSH R3              ;
	PUSH R4              ;
	PUSH R5              ;

	MOV R1, jogo
	MOV R2, [R1]
	CMP R2, 0000H
	JZ fim_rot_pausa ;se estiver em pausa
	CMP R2, 0002H    ;ou em fim de jogo
	JZ fim_rot_pausa

	MOV R1, tecla
	MOV R2, [R1]
	MOV R1, 0DH
	CMP R2, R1
	JNZ continua    ;se carregou na tecla D
	MOV R1, pausa
	MOV R2, [R1]
	NOT R2					;se tiver em pausa, a tecla D tira a pausa e vice versa
	MOV [R1], R2
	CALL rot_resetScreen  ;limpa ecra

continua:
	MOV R1, pausa
	MOV R2, [R1]
	MOV R1, 0FFFFH
	CMP R2, R1
	JNZ fim_rot_pausa

	MOV R1, 1H           ;R1 <--- INCREMENTO
	MOV R2, ecraPausa   ;INICIO DA MATRIZ DE PIXEIS EM STRINGS
	MOV R4, ecraPausa   ;
	MOV R5, 80H          ;NUMERO DE ESPACOS OCUPADOS EM STRINGS (128 - (80H))
	ADD R4, R5           ;R4 <--- ENDEREÇO DE FIM DA MATRIZ DE PIXEIS EM STRINGS
	MOV R5, PIX          ;ENDEREÇO BASE DO PIXEL SCREEN

draw_pix_ciclo:
	MOVB R3, [R2]        ;COPIAR STRING PARA ENDEREÇO DO PIXELSCREEN
	MOVB [R5], R3        ;
	ADD R2, 1H           ;AUMENTAR 1H EM ENDEREÇO DA MATRIZ EM STRINGS
	ADD R5, 1H           ;AUMENTAR 1H EM ENDEREÇO DO PIXELSCREEN
	CMP R2, R4           ;CHEGOU AO FIM DA MATRIZ ?
	JNZ draw_pix_ciclo   ;(PROXIMO BYTE)

fim_rot_pausa:
	POP R5               ;Repor os registos com os seus valores antes da rotina ser chamada
	POP R4               ;
	POP R3               ;
	POP R2               ;
	POP R1               ;

	RET
;------------------------------------------------------------------------------;
rot_inicioJogo:
	PUSH R1
	PUSH R2
	PUSH R3


	MOV R1, jogo
	MOV R2, [R1]
	CMP R2, 0000H
	JNZ fim_rot_inicioJogo

	MOV R1, tecla
	MOV R2, [R1]
	MOV R1, 0CH
	CMP R1, R2
	JNZ naoCarregou
	CALL rot_resetScreen
	MOV R1, jogo
	MOV R2, 1H
	MOV [R1], R2
	JMP fim_rot_inicioJogo

naoCarregou:

	MOV R1, 1H           ;R1 <--- INCREMENTO
	MOV R2, ecraInicio   ;INICIO DA MATRIZ DE PIXEIS EM STRINGS
	MOV R4, ecraInicio   ;
	MOV R5, 80H          ;NUMERO DE ESPACOS OCUPADOS EM STRINGS (128 - (80H))
	ADD R4, R5           ;R4 <--- ENDEREÇO DE FIM DA MATRIZ DE PIXEIS EM STRINGS
	MOV R5, PIX          ;ENDEREÇO BASE DO PIXEL SCREEN

draw_pix_ciclo_:
	MOVB R3, [R2]        ;COPIAR STRING PARA ENDEREÇO DO PIXELSCREEN
	MOVB [R5], R3        ;
	ADD R2, 1H           ;AUMENTAR 1H EM ENDEREÇO DA MATRIZ EM STRINGS
	ADD R5, 1H           ;AUMENTAR 1H EM ENDEREÇO DO PIXELSCREEN
	CMP R2, R4           ;CHEGOU AO FIM DA MATRIZ ?
	JNZ draw_pix_ciclo_   ;(PROXIMO BYTE)

fim_rot_inicioJogo:
	POP R3
	POP R2
	POP R1
	RET

;------------------------------------------------------------------------------;
rot_resetNinjas:
	PUSH R1              ;Salvaguardar os regsitos modificados pela rotina
	PUSH R2              ;
	PUSH R3              ;

	MOV R1, ninja1_pos		;Coloca as coordenasdas dos ninjas iguais as iniciais
	MOV R2, 0FH
	MOV R3, 0H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R3
	ADD R3, 4H
	ADD R1, 1H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R3
	ADD R1, 1H
	ADD R3, 4H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R3
	ADD R1, 1H
	ADD R3, 4H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R3

	MOV R1, ninja1Vivo		;coloca as flags de ninjas vivos iguais as iniciais
	MOV R2, 1H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R2
	ADD R1, 1H
	MOVB [R1], R2

	POP R3               ;
	POP R2               ;
	POP R1               ;
	RET
;------------------------------------------------------------------------------;
rot_armaPresente:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R7

	MOV R1, jogo
	MOV R2, [R1]
	CMP R2, 0000H
	JNZ _allowed____
	JMP fim_rot_armaPresente  ;se nao estiver em inicio de jogo

_allowed____:
	CMP R2, 0002H							;nem no fim de jogo
	JNZ _allowed_____
	JMP fim_rot_armaPresente

_allowed_____:

	MOV R0, pausa
	MOV R1, [R0]
	MOV R0, 0FFFFH
	CMP R1, R0
	JNZ _allowed
	JMP fim_rot_armaPresente	;se nao estiver em pausa

_allowed:
CALL aux_Armas

next_s:

desenhar_armaPresente:
	MOV R7, arma_pos
	MOV R0, figuraArma ;desenha a arma
	CALL desenha_figura
	MOV R7, presente_pos
	MOV R0, figuraPresente ;desenha o presente
	CALL desenha_figura

fim_rot_armaPresente:
	POP R7
	POP R3
	POP R2
	POP R1
	POP R0

	RET
;------------------------------------------------------------------------------;
rot_controlo:
;Rotina inacabada
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R7

	MOV R1, jogo
	MOV R2, [R1]
	CMP R2, 0000H
	JNZ __allowed____
	JMP fim_rot_controlo

__allowed____:
	CMP R2, 0002H
	JNZ __allowed_____
	JMP fim_rot_controlo

__allowed_____:
	MOV R0, pausa
	MOV R1, [R0]
	MOV R0, 0FFFFH
	CMP R1, R0
	JNZ __allowed
	JMP fim_rot_controlo

__allowed:



fim_rot_controlo:
	POP R7
	POP R3
	POP R2
	POP R1
	POP R0

RET
;------------------------------------------------------------------------------;
rot0:
	PUSH R0
	PUSH R1

	MOV  R0, descerNinjas ;ativa a flag para descer os ninjas
	MOV  R1,1H
	MOV [R0],R1

	POP R1
	POP R0
	RFE
;------------------------------------------------------------------------------;
rot1:
	PUSH R0
	PUSH R1

	MOV  R0, mexerArmas		;ativa a flag para deslocar as armas
	MOV  R1,1H
	MOV [R0],R1

	POP R1
	POP R0
	RFE
;------------------------------------------------------------------------------;
rot_gerador:
	PUSH R0
	PUSH R1

	MOV R0, incrementador
	MOV R1, R0
	ADD R1, 1H
	MOV [R0], R1

fimGerador:
	POP R1
	POP R0
	RET
;------------------------------------------------------------------------------;
aleatoriedade:

	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8

	MOV R2, R0 ;recebe as coordenadas (usar memoria das coordenadas)
	MOV R3, R1 ; flag do tipo de objeto (lamina ou presente)

	MOV R4, incrementador ; gerar presente ou arma
	MOV R5, [R4]
	MOV R6, 2H		 ; saber se é lamina(50%) ou presente(50)
	MOD	R5, R6	 	 ; resultado do resto da divisao do incrementador por 2 -> 0 para arma, 1 para presente
	MOV [R3], R5

	MOV R7, [R4]
	MOV R8, 7H
	AND R7, R8		;gera uma coordenada entre 0 e 7
	MOVB R8, [R2]	;coordenadas para a primeira metade do ecra
	ADD R8, R7
	MOVB [R2], R8	;coordenadas para a segunda metade do ecra

	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	RET
;------------------------------------------------------------------------------;
aux_desceNinjas:

	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8

	MOV R1, descerNinjas		;se a flag de descer ninjas estiver ativa
	MOV R2, [R1]
	MOV R1, 1H
	CMP R1, R2
	JNZ fim_aux

desceNinja1_:									;desce o ninja respectivo
	MOV R0, figuraApagaNinja
	MOV R7, ninja1_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja1_allowed_
	MOV R1, ninja1Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja1_allowed_:
	CALL desenha_figura
	MOV R0, ninja1_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1

desceNinja2_:
	MOV R0, figuraApagaNinja
	MOV R7, ninja2_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja2_allowed_
	MOV R1, ninja2Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja2_allowed_:
	CALL desenha_figura
	MOV R0, ninja2_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1

desceNinja3_:
	MOV R0, figuraApagaNinja
	MOV R7, ninja3_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja3_allowed_
	MOV R1, ninja3Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja3_allowed_:
	CALL desenha_figura
	MOV R0, ninja3_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1

desceNinja4_:
	MOV R0, figuraApagaNinja
	MOV R7, ninja4_pos
	MOVB R1, [R7]
	MOV R2, 1BH
	CMP R1, R2
	JNZ ninja4_allowed_
	MOV R1, ninja4Vivo
	MOV R2, 0H
	MOVB [R1], R2

ninja4_allowed_:
	CALL desenha_figura
	MOV R0, ninja4_pos
	MOVB R1, [R0]
	ADD R1, 1H
	MOVB [R0], R1

fim_aux:

	MOV R1, descerNinjas			;desativar a flag
	MOV R2, 0H
	MOV [R1], R2

	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1

	RET
;------------------------------------------------------------------------------;
aux_Armas:

	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8

	MOV R1, mexerArmas				;se a flag de deslocar as armas estiver ativa
	MOV R2, [R1]
	MOV R1, 1H
	CMP R1, R2
	JNZ fim_auxA

mexeArma1:									;desloca a arma respectiva
	MOV R0, figuraApagaArma
	MOV R7, arma_pos
	CALL desenha_figura
	ADD R7, 1H
	MOVB R1, [R7]
	SUB R1, 1H
	MOVB [R7], R1
	MOV R0, figuraArma
	SUB R7, 1H
	CALL desenha_figura

mexeArma2:
	MOV R0, figuraApagaPresente
	MOV R7, presente_pos
	CALL desenha_figura
	ADD R7, 1H
	MOVB R1, [R7]
	SUB R1, 1H
	MOVB [R7], R1
	MOV R0, figuraPresente
	SUB R7, 1H
	CALL desenha_figura

fim_auxA:

	MOV R1, mexerArmas ;repor a flag
	MOV R2, 0H
	MOV [R1], R2

	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET
