/* rexx */
foo = 'bar';
call sub1;
call sub2;
exit 

sub1: 
	procedure expose foo
	say foo;
	return 

sub2: 
	procedure 
	say foo 
	return 
