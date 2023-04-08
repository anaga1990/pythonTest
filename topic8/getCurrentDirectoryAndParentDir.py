import os

print(os.getcwd())
print(os.getpid())
print("*" * 30)

# get current directory
curDir = os.getcwd()
print("Current Directory", curDir)

# prints parent directory
print(os.path.abspath(os.path.join(curDir, os.pardir)))
print("^" * 70)

# get current directory
cdir = os.getcwd()
print("Current Directory", cdir)

# parent directory
parent = os.path.dirname(cdir)
print("Parent directory", parent)

