/* rexx */



SAY 'FIBO(11):' FIBO(11);
EXIT


/*
fibonacci array
@param max : array length
*/
FIBO: PROCEDURE
    MAX = ARG(1) /* MAX = 10 */
    WHERE = 1
    DO FOREVER
        IF WHERE >= MAX THEN 
            LEAVE
        ELSE 
            WHERE = WHERE + 1
        IF WHERE = 2 THEN 
        DO
            PUSH 1
            PUS-H 1
        END
        ELSE 
        DO 
            PULL N_1
            PULL N_2
            PUSH N_2
            PUSH N_1
            PUSH N_1 + N_2
        END 
    END 
    FIBONUM = QUEUED(); /* FIBONUM = 10 */
    FIBOSTR = '';
    DO FIBONUM
        PULL ELE
        FIBOSTR = ELE FIBOSTR
    END
    RETURN FIBOSTR

