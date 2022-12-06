'''
x=4 or 14
Look back to find the first place the last `x` characters aren't repeated plus 1
'''
b=open("../input.txt").read()

for x in [4,14]:
    for r in range(x,len(b)):
        if(len(set(b[r-x:r]))==x):
            print(x,' is ',r)
            break
