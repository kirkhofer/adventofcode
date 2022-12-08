'''
Need to start at 1,1
Go North, South, East, West
Learned several functions and methods
'''
def dist(nsew, arr):
    d = 0
    for t in arr:
        d += 1
        if t >= nsew:
            break
    return d

l = [[int(x) for x in l] for l in open("../input.txt").read().split("\n")]

agg=[]
visible=0
for i,r in enumerate(l):
    #Get NSEW direction
    for j,c in enumerate(r):
        w = r[:j]
        e = r[j + 1:] 
        n = [rt[j] for rt in l[:i]]
        s = [rb[j] for rb in l[i + 1: ]]
        if any([all([x < c for x in w]),all([x < c for x in e]),all([x < c for x in n]),all([x < c for x in s])]):
            visible+=1
            print(f'NSEW is good {i},{j}')
        agg.append(dist(c, reversed(w)) * dist(c, e) * dist(c, reversed(n)) * dist(c, s))
#1859
print(f"{visible} are visible")
#332640
print(f"{max(agg)} max viewable")
