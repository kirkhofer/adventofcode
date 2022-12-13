'''
taken from https://www.youtube.com/watch?v=DESEu78nxSY or https://www.reddit.com/user/nthistle/
'''
import string
from collections import defaultdict,deque
dirs = [(0,1),(1,0),(0,-1),(-1,0)]

with open("2022/day12/input.txt") as f:
    s = f.read().strip()
print("\n".join(x[:60] for x in s.split("\n")[:10]))            

g = [list(x) for x in s.split("\n")]
n = len(g)
m = len(g[0])

#Get the coordinates for S and E
sx,sy = [(i,j) for i in range(n) for j in range(m) if g[i][j] == "S"][0]
tx,ty = [(i,j) for i in range(n) for j in range(m) if g[i][j] == "E"][0]

#Make S an a and E a z
g[sx][sy] = "a"
g[tx][ty] = "z"

#Swap all the positions a-z with 0-25
g = [[ord(c) - ord("a") for c in r] for r in g]

from collections import defaultdict,deque

dst = defaultdict(lambda : 1000000)
dst[sx,sy] = 0

q = deque([(sx,sy)])

while True:
    cx,cy = q.popleft()
    if (cx,cy) == (tx,ty):
        print(dst[tx,ty])
        break
    for dx,dy in dirs:
        nx,ny = cx+dx,cy+dy
        if nx in range(n) and ny in range(m):
            if g[cx][cy] >= g[nx][ny] - 1:
                ndst = dst[cx,cy] + 1
                if ndst < dst[nx,ny]:
                    q.append((nx,ny))
                    dst[nx,ny] = ndst
