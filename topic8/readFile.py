data = open("demo.txt").read(5)
print(data)
print("*" * 50)
data = open("demo.txt").read()
print(data)

print("*" * 50)
data = open("demo.txt").readline()
print(data)
print("&" * 50)
data = open("demo.txt")
for tx in data:
    print(tx)

data.close()
