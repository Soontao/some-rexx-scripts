/* rexx */

/* 用于求一元二次方程的根 */

numeric digits 4

arg a b c .

d = delta(a b c)
r = (-b) / (2 * a) '±' (sqrtdelta(a b c) / (2 * a))
if d < 0 then r = r'i' 
say a" * x^2 +" b "* x +" c "=" r 

exit


delta:
  /* use to get the delta */
  arg a b c 
  r = b * b - 4 * a * c
  return r

sqrt:
  /* get the root of square */
  arg n .
  numeric digits 4
  select 
    when n < 0 then
      n = -n
    when n = 0 then 
      return n
    otherwise 
      n = n
    end
    r=1   
    do forever /* Newton's method */
        rr=(n/r+r)/2
        if r=rr then leave
        r=rr
    end
  return r

sqrtdelta:
  /* root of delta */
  arg a b c
  r = delta(a b c)
  r = sqrt(r)
  return r 
