a = 10
while a < 20:
    print(a)
    a += 1

print('*' * 30)
a = 10
while a < 20:
    if a == 14:
        print("found record")
        break
    a += 1

print('*' * 30)
a = 10
while a < 20:
    a += 1
    if a == 14:
        print("found record")
        continue

while a < 16:
    print(a)
    a += 1
else:
    print("while loop completed")
