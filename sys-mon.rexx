/* rexx */

/* use to monit system info */

arg run . 

if run = 'MAIN' then main()
else test()

exit

/* Functions */

main:
  say now is not available
  return ''

test:
  /* program entry */
  say getuptime()
  say gettime()
  say getmeminfo()
  say getusername()
  say getcpuload()
  say getcpunum()
  say gettasksnum()
  say getpsinfo()
  say memg()
  showscreen()
  return ''  

showscreen:
  s = buildscreen();
  say s
  return ''

lf:
  return '0A'X

tab:
  return '09'X

tabandvl:
  /* a tab and a vertical line */
  return '097C'X

splitline:
  r = ''
  do i=1 to 80
    r = r||'-'
  end
  return r
  
addnewline:
  arg s,add
  s = s||add lf();
  return s 


buildscreen:
  s = ''
  s = addnewline(s,(rexx sys monit tabandvl()  ver 0.0.1 tabandvl() uestc 2016))
  s = addnewline(s,(user  upper(getusername()) tabandvl() time gettime()tabandvl() total task gettasksnum()  file open getopenfilecount()))
  s = addnewline(s,(mifo  getmeminfo() tabandvl() muse memg()))
  s = addnewline(s,(uptm upper(getuptime() tabandvl() ctim gettime())))
  s = addnewline(s,(getcpuload() tabandvl() total cpu getcpunum()))
  s = addnewline(s,splitline())
  return s

memg:
  numeric digits 3
  parse value getmeminfo() with t f .
  t = strip(t,'T','G')
  f = strip(f,'T','G')
  memu = f / t *100
  r = memu'% [ '
  do i=1 to 10
    if i < ( memu / 10 ) then r = r'#'
    else r = r'-'
  end
  return r' ]'

getusername:
  call 'whoami'
  return result

getcpuload:
  call 'uptime'
  parse value result with . ',' . ',' r
  return strip(r)

gettime:
  call 'date'
  parse value result with . . . r .
  return r

getcpunum:
  call "cat /proc/cpuinfo |grep 'processor'|wc -l"
  return result

getmeminfo:
  call 'free -mh'
  parse value result with 80  real ruse . 160 . . . . swap suse .
  return real ruse swap suse

gettasksnum:
  call 'ps aux|wc -l'
  return result

getuptime:
  call 'uptime -p'
  return result

getopenfilecount:
  r = "lsof|wc -l"()
  return r

getpsinfo:
  /* need to fix */
  call 'ps ax'
  aline = result
  do i = 1 by 1 while aline <> ''
    parse value aline with t1 t2 t3 t4 t5 aline
    r.i = t1 tab()t2 tab()t3 tab()t4 tab()t5 
    say r.i
  end
  return r

  