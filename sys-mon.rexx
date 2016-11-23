/* rexx */

/* use to monit system info */

main()

exit

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
  return ''  

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