/* rexx */

/*
用于获取命令行参数
只能获取一个
*/
say 'arg len is:' arg()
say 'first arg is:' arg(1)

parse value arg(1) with arg0 arg1 arg2

say arg2