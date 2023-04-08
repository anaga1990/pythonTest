data = "worldline is payment company"

print(len(data))

for i in data:
    print(i)

print(data[:10])

product_ref = "PDT_NN_10004_MCD_VRT"
if 'VRT' in product_ref:
    print(True)
else:
    print(False)

account_ref = "REF_ROOT_NN_AT"
if 'ROOT' not in account_ref:
    print('its Child Account')
else:
    print("its a Root Account")
