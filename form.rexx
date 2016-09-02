/* rexx */

SAY FORM_DATE();
SLEEP(1) /* wait a second */
SAY totol mem is FORM_MEM() m;
EXIT

FORM_DATE:PROCEDURE
    CALL 'date' 
    PARSE VALUE result with year month .
    STR = 'Year is' year,
    'Month is' month
    return STR

FORM_ADVANCE:PROCEDURE
    CALL 'ps aux'
    PARSE VALUE RESULT WITH TITLE 80 .
    RETURN TITLE

FORM_MEM:PROCEDURE
    CALL 'free -m'
    PARSE VALUE RESULT WITH 81 MEM total . 160 .
    RETURN total