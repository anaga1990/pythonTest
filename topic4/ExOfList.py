numList = [1, 4, 7, 2, 5]

print("numList size => ", len(numList))
for i in numList:
    print(i)
mylist = ["apple", "banana", "cherry", "dragen", "egg", "fox"]
print(mylist[::-1])
print(mylist[0])
mylist[0] = 'nag'
print(mylist)
print(mylist[3:])
print(mylist[3:-2])

if "apple" in mylist:
    print("apple is present in mylist")
else:
    print("apple not present in mylist")

"""
add element to List
"""
listOfNum = [0, 'hhs', 2, 3, 4, 7]
print(listOfNum)

"""
add element in custom index
"""
listOfNum.insert(0, 'naga')
print(listOfNum)

"""
Remove based one value from list
"""
listOfNum.remove("naga")
print(listOfNum)

"""
Remove based one index from list
"""
listOfNum.pop(1)
print(listOfNum)

"""
Remove last inded from list
"""
listOfNum.pop()
print(listOfNum)

"""
adding one list to another List
"""
listONe = [1, 2, 3, 4]
listTwo = [100, 200, 300]
print(listONe)
listONe.extend(listTwo)
print(listONe)
