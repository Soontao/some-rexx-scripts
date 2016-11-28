/* rexx */

/* use to monit system info */

arg run . 

if strip(run) = 'MAIN' then main()
else test()

exit

/* Functions */

main:
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
  say memg()
  showscreen()
  return ''  

showscreen:
 s = buildscreen();
  do row=1 to 24
    /* skip uninited value */
    if s.row \= 'S.'row then say s.row
  end
  return ''

buildscreen:
  s.1 = rexx sys monit '09'X '|'  ver 0.0.1 '09'X '|'  uestc 2016
  s.2 = user  upper(getusername()) '09'X '|' time  gettime()
  s.3 = mifo  getmeminfo() '09'X '|' muse memg()
  s.4 = uptm upper(getuptime())

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