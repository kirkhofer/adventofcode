import sys
from collections import Counter
# d=[[x for x in l.split()]for l in sys.stdin]
d=[[x for x in l.split()]for l in open("2022/day09/input.txt").read().split("\n")]
h=[0,0]
t=[0,0]
mv=[]
for p,v in d:
    print(f"dir={p} val={v}")
    for i in range(int(v)):
        if   p == "U": h[0]+=1
        elif p == "D": h[0]-=1
        elif p == "L": h[1]-=1
        elif p == "R": h[1]+=1
        if abs(h[0] - t[0]) > 1 or abs(h[1] - t[1]) > 1:
            t[0] += (h[0] > t[0]) - (h[0] < t[0])
            t[1] += (h[1] > t[1]) - (h[1] < t[1])
            mv.append(f"{t[0]},{t[1]}")
#6337
print(len(set(mv)))
#2455
#Coudn't get this to work. Oh well
# vals=Counter(mv).values()
#unq=[v for v in list(Counter(mv).values()) if v > 1]
#print(len(unq))