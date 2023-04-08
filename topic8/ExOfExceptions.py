a = 10
try:
    # print(b)
    a / 0
except ZeroDivisionError:
    print("value can't be div by zero")
except NameError:
    print("any error by pass")
finally:
    print("finally block called")
    del a

print("*****************")
