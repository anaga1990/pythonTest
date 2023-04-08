# Varaibales
name = 'nag'
age = 32
is_married = True

print(name)
print(age)
print(is_married)

print("*" * 40)

"""
Casting from one Data type to Another Data Type
"""
print(str(is_married))
print(float(age))  # convert from int to float
# print(float(name)) # could not convert string to float
# print(int(name)) # invalid literal for int() with base 10:
print(bool(age))  # if Number is 0 => False, if other '+ve' or '+ve' numbers return as True
print(bool(name))  # if String is None => False , other than None will return as True
name = None
print(bool(name))

"""
Get Data type of Varibale
"""
print(" ************** Get Data type of Varibale ***********")
ex_of_string = 'worldline'
ex_of_int = 3
ex_of_float = 100.99
ex_of_boolean = False
ex_of_list = ["apple", "banana", "cherry"]
ex_of_set = {"apple", "banana", "cherry"}
ex_of_dict = {"name": "John", "age": 36}
print("ex_of_string => ", type(ex_of_string))
print("ex_of_int => ", type(ex_of_int))
print("ex_of_float => ", type(ex_of_float))
print("ex_of_boolean => ", type(ex_of_boolean))
print("ex_of_list => ", type(ex_of_list))
print("ex_of_set => ", type(ex_of_set))
print("ex_of_dict => ", type(ex_of_dict))

"""
assign values to multiple variables in one line
"""
print("*********** assign values to multiple variables in one line ***********")
wgs, wi = 3, 8
print(wgs)
print(wi)
name, age, is_aval = 'naga', 3, False
print(name)
print(age)
print(is_aval)

"""
same value to multiple variables in one line
"""
print("*********** same value to multiple variables in one line ***********")
java = python = c = "programing launguage"
print(java)
print(python)
print(c)

"""
Get Values from Collection
"""
print("*********** Get Values from Collection ***********")
fruits = ["apple", "banana", "cherry"]
x, y, z = fruits
print(x, y, z)
print(x + y + z)

a = 10
b = 20
c = 'naga'
print(a + b)
# print(a+c)  #TypeError: unsupported operand type(s) for +: 'int' and 'str'
print(a, c)
