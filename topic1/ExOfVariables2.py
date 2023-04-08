company = "worldline"


def company_name():
    print(company)


company_name()
"""
LOCAL Variables
"""
print("*" * 40)
company = "worldline"


def company_name():
    company = "WGS"
    print(company)


company_name()
print(company)

"""
Updating Global Variable from Method or Function
"""
print("*" * 40)
name = "worldline"


def company_name():
    global name
    name = "WGS"
    print(name)


company_name()
print(name)
