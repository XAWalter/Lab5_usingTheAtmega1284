/*	Author: xwalt001
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab #  Exercise #
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    /* Insert DDR and PORT initializations */
    DDRA = 0x00; PORTA = 0xFF;
    DDRC = 0xFF; PORTC = 0x00;
    unsigned char tmpA = 0x00;
    unsigned char tmpC = 0x00;
    /* Insert your solution below */
    while (1) {
        tmpA = PINA;
        

	if(tmpA <= 4){
	    tmpC = (tmpC | 0x40);
	}
	else{
	    tmpC = (tmpC & 0xB0);
	}

	
	switch (tmpA){

	case 0:
	    tmpC = (tmpC & 0xC0);
	    break;
	case 1:
	case 2:
            tmpC = ((tmpC | 0x20) & 0xE0);
	    break;
	case 3:
	case 4:
            tmpC = ((tmpC | 0x03) & 0xF0);
	    break;
        case 5: 
        case 6:
            tmpC = ((tmpC | 0x38) & 0xF8);
	    break;
	case 7:
	case 8:
	case 9:
            tmpC = ((tmpC | 0x3C) & 0xFC);
	    break;
	case 10:
	case 11:
	case 12:
            tmpC = ((tmpC | 0x3E) & 0xFE);
	    break;
	case 13:
	case 14:
	case 15:
            tmpC = ((tmpC | 0x3F) & 0xFF);
	    break;
	    
	}
	
    PORTC = tmpC; 
	 
    }
    return 1;
}
