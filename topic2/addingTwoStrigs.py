s1 = 10
s2 = 20
print(s1 + s2)
# print(s1+""+s2) #unsupported operand type(s) for +: 'int' and 'str'

a = 'nag'
b = 'arjuna'
print(a + b)

x = 10
y = 'naga'
z = 30
t = str(x) + y + str(z)
print(t)

"""
format
"""
name = 'nagarjuna'
exp = 8.5
data = name + " work from last " + str(exp) + " years in testing"
print(data)

formatedData = "{} working from last {} years in WGS"
print(formatedData.format(name, exp))
new_way = formatedData.format(name, exp)
print(new_way)

# formatedData = "in testing python concepts used => oops , string, collection"
formatedData = "in testing {3} concepts used => {0} , {2}, {1}"
print(formatedData.format('oops', 'collection', 'string', 'python'))
