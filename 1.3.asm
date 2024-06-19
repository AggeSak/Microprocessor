	

START:	   IN 10	// Init I/O

MAIN:		// Φορτώνουμε την τιμή του διακόπτη στον A
	   ANI 80	// Αναλύουμε το MSB του διακόπτη
	   JZ LEFT	// If 0
	   
                           JMP CHECK_LSB  // else check LSB

LEFT:		//  LED -> A
	   RLC	
	   STA 3000	// Store new value of LED
	   CALL DELAY	
	   JMP CHECK_LSB	// Check LSB

CHECK_LSB:		
	   ANI 01	
	   JZ LEFT_STOP	// if 0
	   JMP RIGHT	  // else right 

LEFT_STOP:	   JMP MAIN	

RIGHT:		// LED at A register
	   RRC	//
	   STA 3000	
	   CALL DELAY	
	   JMP CHECK_LSB	

DELAY:	   MVI B,0A	
	   MVI C,64	

LOOP:	   DCR C	
	   JNZ LOOP	
	   DCR B	
	   JNZ LOOP	 

	   RET	

END:	   JMP END	