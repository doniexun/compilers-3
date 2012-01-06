from fraction import*

f = fraction()		# f = 0/1
g = fraction(3, 4)	# g = 3/4
h = fraction(1, 2)	# h = 1/2
r = fraction()
r.set(15, 20)		# r = 15/20
p = g.multiply(h)	# p = 3/4 * 1/2
q = g.divide(h)		# q = 3/4 / 1/2
print "f = ", f
print "g = ", g
print "h = ", h
print "r = ", r
print "g*h = ", p
print "g/h = ", q
p.flip()
print "Reverse of 3/8 = ", p
if g == r:
	print "g is equal to r"
else: 
	print "g is not equal to r"

s = fraction(24, 68)
print "s = ", s
s.reduce()
print "reducing the fraction, s = ", s
