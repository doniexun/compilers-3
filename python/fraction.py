# Programming language and compilers, Sp 2011
#	Project 4
#	Ashim Ghimire

class fraction:
	"A class for fraction numbers"

	def __init__(self,numerator=0,denominator=1):
		self.a=numerator
		self.b=denominator

	def __str__(self):
		return str(self.a)+"/"+str(self.b)

	def __eq__(self, f):
		left=self.a * f.b
		right=self.b * f.a
		return left == right

	def set(self,a,b):
		self.a=a
		self.b=b

	def multiply(self,f):
		product=fraction(self.a*f.a,self.b*f.b)
		return product

	def divide(self,f):
		quotient=fraction(self.a*f.b,self.b*f.a)
		return quotient

	def flip(self):
		numer=self.a
		self.a=self.b
		self.b=numer

	def reduce(self):
		while 1:
			num=self.a
			den=self.b
			while 1:
				r = num%den
				if r == 0:
				        break
				else:
					num,den = den,r
			gcf=den
			self.a=self.a/gcf
			self.b=self.b/gcf
			if gcf == 1:
				break
