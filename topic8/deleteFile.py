import os

if os.path.exists("letsWrite.txt"):
    os.remove("letsWrite.txt")
    print("file deleted successfully")
else:
    print("The file does not exist")
