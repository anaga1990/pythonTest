a = {1: "naga", 2: "nani", 3: "jani", 4: "lak", 5: "venki"}

if 3 in a:
    print(True)

a.pop(1)
print(a)
a.popitem()
print(a)

"""
clear dictionaries
"""
a.clear()
print(a)

"""
del dictionaries
"""
del a

print("*" * 30)

adict = {
    "brand": "Ford",
    "model": "Mustang",
    "year": 1964
}

for element in adict.keys():
    print(element)

print("*" * 30)

for element in adict.values():
    print(element)

print("*" * 30)

for key, value in adict.items():
    print(key, value)
