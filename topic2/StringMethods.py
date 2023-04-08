"""
Text from Lower to Upper or Upper to lower
"""
data_text = "let CODE in PYTHON string"
print("actual data",data_text)
print("UPPER", data_text.upper())
print("lower", data_text.lower())

print("_" * 30)

"""
Remove Space of String from the beginning or the end
"""
data = "        welcome to Worldline"
print("removed starting white space of String =>",data.strip())
data = "welcome to Worldline        "
print("removed Ending white space of String =>",data.strip())
data = "        welcome to Worldline   "
print("removed starting and ending  white space of String =>",data.strip())

"""
Replace the String
"""
print('*********** Replace the String **********')
data = 'welcome to java'
newData=data.replace('java', 'python')
print(newData)
data = 'welcome to java, java is programing launguage and JAVA used diferent devices'
newData=data.replace('java', 'python')
print(newData)

"""
split the String
"""
print('*********** Split the String **********')
data = '127x0x0x1'
newData=data.split("x")
print(newData)
data = '2023:04:17'
newData=data.split(":")
print(newData)

"""
Get The Count of Word in String
"""
data = "java is java pro and JAVA ET"
coun = data.count('java')
print(coun)
