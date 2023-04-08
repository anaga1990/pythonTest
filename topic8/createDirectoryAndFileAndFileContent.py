import os
from pathlib import Path

currecnt_dir = os.getcwd()
parent_dir = Path(currecnt_dir).resolve().parent

new_dir = os.path.join(parent_dir, "topic9")
file = None
try:
    os.makedirs(new_dir, exist_ok=True)
    print(new_dir, "=> created success")
    file = open(new_dir+'/'+"letWiteFile.txt", 'a')
    file.write(
        "Suppose we want to create directory 'topic9' but Directory 'PycharmProjects' are unavailable in the path.")
    file.write(" Then os.makedirs() method will create all unavailable/missing directories in the specified path")
finally:
    file.close()

new_dir = os.path.join(parent_dir, "topic9/test")

try:
    os.makedirs(new_dir, exist_ok=True)
    print(new_dir, "=> created success")
    file = open(new_dir+'/'+"car.xml", 'a')

    file.write(
        "<a>car</a>")
    file.write("<b>car</b>")
finally:
    file.close()
