#Read file into list of
from itertools import takewhile
d=[[x for x in l]for l in open("2022/day12/input.txt").read().split("\n")]
a=[chr(i) for i in range(ord('a'),ord('z')+1)]
i=0
s=[]
m=[]


#TODO: Make this simple
for x,a in enumerate(range(len(d))):
    for y,b in enumerate(range(len(d[a]))):
        if "S"==d[x][y]:
            s=(x,y)
            break
print(s)
x=s[0]
y=s[1]
#takewhile(lambda x:)
# p=list(takewhile(lambda x,y:d[x][y] != "S",range(len(d)),range(len(d[0]))))
# print(p)

def findit(char,x,y,d):
    for _ in range(26):
        #up
        if a[i]==d[x-1][y]:
            m.append((x-1,y))
        #down
        elif a[i]==d[x-1][y]:
            m.append((x-1,y))
        i+=1
    return (x,y)




