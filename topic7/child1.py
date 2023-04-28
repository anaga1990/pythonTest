from topic7.parent import Parent


def calculate(val1, val2, opertaion):
    if opertaion == 'add':
        return val1 + val2
    elif opertaion == 'sub':
        return val1 - val2
    elif opertaion == 'mul':
        return val1 * val2
    elif opertaion == 'div':
        return val1 / val2


class Child1(Parent):
    def __init__(self, name, dob):
        self.name = name
        super().__init__(name, dob)
        self.dob = dob

    def get_child_obj_data(self):
        print(self.name, self.dob)


c1 = Child1('Hanvik', '30-04-2020')
c1.get_child_obj_data()
c1.get_object_details()
#c1.calculate(10, 20, 'sub')
#print(calculate(10, 20, 'sub'))
