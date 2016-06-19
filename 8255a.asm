
ASSUME CS:CODE 
SSTACK SEGMENT 
	STACK DW 32 DUP(?) 
SSTACK ENDS 

CODE   SEGMENT 
START: 
	MOV DX, 0646H        ；控制端口地址0646H送DX 
	MOV AL, 80H          ；  方式选择控制字送AL 
	OUT DX, AL         
	MOV BX, 8001H 
AA1:   
	MOV DX, 0640H         ；控制端口A地址0640H送DX  
	MOV AL, BH           ；将BH中的值送给AL 
	OUT DX, AL            ；点亮D7对应的LED灯 
	ROR BH, 1             ‘1000000’数据循环右移，是数据灯D7—D0由左向右逐个点亮 
	MOV DX, 0642H        ；控制端口B地址0642H送DX  MOV AL, BL  
	OUT DX, AL            ；点亮D8对应的LED灯 
	ROL BL, 1             ‘00000001’数据循环左移，是数据灯D8—D15由右向左逐个点亮 
	CALL DELAY 
	CALL DELAY 
	JMP AA1 
DELAY: 
	PUSH CX 
	MOV CX, 0F000H 
AA2:   
	PUSH AX 
	POP  AX 
	LOOP AA2 
	POP  CX 
	RET 
CODE   ENDS 
END  START 
