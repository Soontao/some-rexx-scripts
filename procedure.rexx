/* rexx */
SAY RESULT IS PROG1(13,99)
EXIT

/* 
return num1 * num2
arg(1) : num1 
arg(2) : num2 
*/
PROG1: PROCEDURE
	IF ARG() <> 2 THEN 
		RETURN 'PARAM ERROR'
	ELSE 
	 	RETURN ARG(1) * ARG(2)

