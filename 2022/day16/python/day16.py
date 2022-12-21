import re
from collections import defaultdict

s = open("2022/day16/input.txt").read().strip()
# s="""Valve AA has flow rate=0; tunnels lead to valves DD, II, BB
# Valve BB has flow rate=13; tunnels lead to valves CC, AA
# Valve CC has flow rate=2; tunnels lead to valves DD, BB
# Valve DD has flow rate=20; tunnels lead to valves CC, AA, EE
# Valve EE has flow rate=3; tunnels lead to valves FF, DD
# Valve FF has flow rate=0; tunnels lead to valves EE, GG
# Valve GG has flow rate=0; tunnels lead to valves FF, HH
# Valve HH has flow rate=22; tunnel leads to valve GG
# Valve II has flow rate=0; tunnels lead to valves AA, JJ
# Valve JJ has flow rate=21; tunnel leads to valve II"""
# y=10
# vals=[[int(x) for x in re.findall('-?[0-9]+',line)] for line in s.split("\n")]

r={}
g={}
for line in s.split("\n"):
    valve=line[6:8]
    rate=int(re.findall("[0-9]+",line.split(";")[0])[0])
    #rate=int(line[24:][:2].replace(';',''))
    goto=line[20:].replace("valves","valve").split("valve")[1].strip().split(", ")
    r[valve]=rate
    g[valve]=goto

import functools

#@functools.lru_cache(maxsize=None)
def maxflow(cur,opened,min_left):
    if min_left <= 0: return 0
    print(opened,min_left)
    best=0
    if cur not in opened:
        val = (min_left-1) * r[cur]
        cur_opened = tuple(sorted(opened + (cur,)))
        for adj in g[cur]:
            if val != 0:
                best = max(best,val+maxflow(adj,cur_opened,min_left-2))
            best = max(best,val+maxflow(adj,opened,min_left-1))
    return best

print(maxflow("AA",(),30))



# open=defaultdict(int)

# #30 minutes
# valve=list(d1.keys())[0]
# totRate=0
# for _ in range(30):
#     for v in open:
#         totRate+=d1[v]
#     rate=d1[valve]
#     goto=d2[valve]
#     for v in goto:
#         if not open.get(v):
#             valve=v
#             break
#     #Sum up all open valves

#     print("valve=",valve)
#     if open.get(valve):
#         print("It is open")
#     else:
#         print("It is closed")
#         open[valve]=1

# print("totRate",totRate)
# for x,y in open.items():
#     print(x,y)



