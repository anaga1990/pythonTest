import os
import shutil
from pathlib import Path

parent_dir = Path(os.getcwd()).resolve().parent
to_be_delete_dir = os.path.join(parent_dir, "topic9")
print(to_be_delete_dir)
try:
    shutil.rmtree(to_be_delete_dir)
    print(to_be_delete_dir, "deleted sub files and folders and topic9")
except OSError:
    print("Error occurred: %s : %s" % (to_be_delete_dir, OSError.strerror))
