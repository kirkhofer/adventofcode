import re
from collections import defaultdict

#s = open("2022/day15/sample.txt").read().strip().split("\n")
#vals=[[int(x) for x in re.findall('-?[0-9]+',line)] for line in s]

s = open("2022/day15/input.txt").read().strip()
y=2_000_000
'''
s="""Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3"""
y=10
'''
vals=[[int(x) for x in re.findall('-?[0-9]+',line)] for line in s.split("\n")]


# g = defaultdict(lambda:'X')

# for v in vals:
#     g[(v[0],v[1])]='S'
#     g[(v[2],v[3])]='B'


#maxX=max(max(bx,sx) for sx,sy,bx,by in vals)
#minX=min(min(bx,sx) for sx,sy,bx,by in vals)

maxX=max(max(v) for v in vals)
minX=min(min(v) for v in vals)
 
maxX=abs(minX) if abs(minX) > maxX else maxX
minX = maxX * -1
# maxX=max(x for x,y in g)
# minX=min(x for x,y in g)

def dist(x1,y1,x2,y2):
    return abs(x2-x1)+abs(y2-y1)

cnt=0
print("minX=",minX,"maxX=",maxX)
# for x in range(minX,maxX):
for x in range(-6_000_000,6_000_000):
    if x % 1_000_000 == 0:
        print(x,y)
    good=True

    for sx,sy,bx,by in vals:
        if (bx,by) == (x,y):
            good=True
            break
        if dist(sx,sy,x,y) <= dist(sx,sy,bx,by):
            good=False
            break
    if not good:
        cnt+=1

print(cnt)        

# 4_341_075 is too low
# 4_399_400 is too low
# 4_876_693 when 5_000_000 or 6_000_000

