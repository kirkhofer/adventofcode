from collections import defaultdict

s = open("2022/day14/input.txt").read().strip().split("\n")
print(s[:5])

vals=[[tuple(map(int,x.split(","))) for x in line.split(" -> ")] for line in s]
#x=l/r
#y=down
#sand=500,0
#, air as ., and the source of the sand as +
#0=air (default),1=rock,2=start
g = defaultdict(int)

vals[:1]
for v in vals:
    #print("v=",v)
    for (a,b),(x,y) in zip(v,v[1:]):
        #print(a,b,x,y)
        ax=x-a
        if ax != 0:
            ax //= abs(ax)
        by=y-b
        if by != 0:
            by //= abs(by)
        while (a,b) != (x,y):
            g[a,b]=1
            a+=ax
            b+=by
        g[a,b]=1

#len(g)
ymax=max(y for x,y in g)

part=int(input("Which part you running?"))
# part=1

if 2 == part:
    for a in range(-1000,10000):
        g[a,ymax+2]=1

sand=(500,0)
a,b=sand
while True:
    #print(a,b)
    blocked=True
    for x,y in ((0,1),(-1,1),(1,1)):
        if g[a+x,b+y] == 0:
            a+=x
            b+=y
            blocked=False
            break
    if 1==part and b > ymax: 
        break
    if blocked: 
        g[a,b]=2
        if (a,b) == sand:
            break
        a,b= sand

l=len([v for v in g.values() if v==2])
if 1 == part and 655 == l: print("Part 1=",l)
elif 2 == part and 26484 == l: print("Part 2=",l)
else: print("uh something is not right")

