/* rexx */
numeric digits 3
arg n .
r=1
do forever /* Newton's method */
    rr=(n/r+r)/2
    if r=rr then leave
    r=rr
end
return r