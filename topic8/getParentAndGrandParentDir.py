import os
from pathlib import Path


print("@" * 50)
print("current dir           ", os.getcwd())
getParentDirOfCurrDir = Path(os.getcwd()).resolve().parents[0]
print("Parent Directory      ", getParentDirOfCurrDir)
getGrantParentDirOfCurrDir = Path(os.getcwd()).resolve().parents[1]
print("Grant Parent Directory", getGrantParentDirOfCurrDir)
# getGrantParentDirOfCurrDir = Path(os.getcwd()).resolve().parents[10]  # raise IndexError(idx)
# print("Grant Parent Directory", getGrantParentDirOfCurrDir)

"""
another Way to get Parent and GrandParent Directory
"""
print("current dir                  ", os.getcwd())
print("Parent Directory             ", Path(os.getcwd()).resolve().parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent.parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent.parent.parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent.parent.parent.parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent.parent.parent.parent.parent)
print("Grant Parent Directory       ", Path(os.getcwd()).resolve().parent.parent.parent.parent.parent.parent.parent)



