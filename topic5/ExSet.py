myset = {"apple", "banana", "cherry", "dragen", "egg", "fox"}
print(myset)

"""
get Each Element in set
"""
print("*************  get all Valuse in set one by one ***********")
for i in myset:
    print(i)



"""
Add single Element in set
"""
print("*************  Add single Element in set ***********")
setOne = {1,2,3}
setOne.add(4)
print(setOne)

"""
Add one set to Another set
"""
print("*************  Add one set to Another set ***********")
setOne = {1,2,3}
setTwo = {11,12,13}
setOne.update(setTwo)
print(setOne)

"""
Remove value from Set
"""
print("*************  Remove value from Set ***********")
dataSet = {1,2,3,4,5,6}
print(dataSet)
dataSet.remove(2)
print(dataSet)
dataSet.pop()
print(dataSet)
dataSet.clear()
print(dataSet)

"""
Join Two Sets
"""
print("************* Join Two Sets ***********")
set1 = {1,2,3}
print(set1)
set2 = {10,12,2}
print(set2)
set3=set1.union(set2)
print(set1)
print(set3)

"""
add one set to another set
"""
print("************* add one set to another set ***********")
set1 = {1,2,3}
print(set1)
set2 = {10,12,2}
print(set2)
set1.update(set2)
print(set1)
