import datetime
import time
a=datetime.datetime.now()
time.sleep(3)
b=datetime.datetime.now()
k=str(b-a).split(":")
print(k)
# if b-a>=3:
    # print("yes")