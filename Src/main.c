/*
 * File-Name: main.c
 *
 *  Created on: 2000/1/1
 *  Author: name
 *
 *  Feature:
 *      write main program      
 *   
 *  File-History:
 * 	  >date Detail
 *    >2016/9/10 generate this file
 */
#include <stdio.h>
#include <stdlib.h>
#include "main.h"
#include "sample.h"
/*user define*/

#define SAMPLE 0 //disp sample message when 1

int main(void)
{
#if SAMPLE
  sampritnf();
#endif 
/* user program area*/


  return EXIT_SUCCESS;
}
