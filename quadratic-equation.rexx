/* rexx */

/* 用于求一元二次方程的根 */

numeric digits 4

arg a b c .

if a = 0 | a = '' then 
do 
  say 'usage: rexx quadratic-equation.rexx a b c'
  say 'VAR a SHOULD NOT EQUAL to ZERO or EMPTY'
  exit
end

/* if var not init, make it be zero */
if b = '' then b = 0 
if c = '' then c = 0

d = delta(a b c)
r = (-b) / (2 * a) '±' (sqrt(d) / (2 * a))
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
  if n < 0 then n = -n 
  if n =0 then return 0
  r=1   
  do forever /* Newton's method */
      rr=(n/r+r)/2
      if r=rr then leave
      r=rr
  end
  return r
