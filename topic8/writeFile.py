"""
"a" for append at end
"""
file = open("letsWrite.txt", "a")
file.write("Explicit waits are available to Selenium clients for imperative")
file.close()
file = open("letsWrite.txt", "r")
print(file.read())
file.close()
"""
"w" for overwrite 
"""
print("*" * 30)
file = open("letsWrite.txt", "w")
file.write("Explicit waits are available to Selenium clients for imperative")
file.close()
file = open("letsWrite.txt", "r")
print(file.read())
file.close()
