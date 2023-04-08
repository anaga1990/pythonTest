class Parent:
    def __init__(self, name, dob):
        print("Parent class init")
        self.name = name
        self.dob = dob

    def get_object_details(self):
        print(self.name, self.dob)


# parent_obj = Parent('Nagarjuna', dob='19-11-1990')
# parent_obj.get_object_details()
