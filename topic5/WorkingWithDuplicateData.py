set1 = {1,2,3,4}
set2 = {2,3,12,10,30}
print(set1)
print(set2)
"""
Keep ONLY the Duplicates
"""
set1.intersection_update(set2)
print(set1)

"""
Get the Common/Duplicate Elements from set's and return new Set  
"""
print("************ Get the Common/Duplicate Elements from set's and return new Set *****************")
set1 = {1,2,3,4}
set2 = {2,3,12,10,30}
set3 = set1.intersection(set2)
print(set3)

"""
Remove Duplicate Elements from set's 
"""
print("************ Remove Duplicate Elements from set's retun to new Set *****************")
set1 = {1,2,3,4}
set2 = {2,3,12,10,30}
set3 = set1.difference(set2)
print(set3)
"""
Remove Duplicate Elements from set 
"""
print("************ Remove Duplicate Elements from set's *****************")
set1 = {1,2,3,4}
set2 = {2,3,12,10,30}
set1.difference_update(set2)
print(set1)

"""
Remove Duplicate Elements from set1 and set2 and all set2 Unique elements to set1 
"""
print("************ symmetric_difference_update from set's *****************")
set1 = {1,2,3,4}
set2 = {2,3,12,10,30}
set1.symmetric_difference_update(set2)
print(set1)