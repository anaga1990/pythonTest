a = {1: "naga", 2: "nani", 3: "jani", 4: "lak", 5: "venki"}
print(a)
print(a[1])
print(a.get(3))

print(a.keys())
print(a.values())

print(a.items())
"""
update value of existing key
"""
a[1] = "lenovo"
print(a)

"""
add new data
"""
a[6] = "nagarjuna"
print(a)
