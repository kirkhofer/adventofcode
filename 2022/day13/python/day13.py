s=open("2022/day13/input.txt").read().strip()
print("\n".join(x[:60] for x in s.split("\n")[:6]))            

s=s.split("\n\n")
s2=[]
for x in s:
    a,b = x.split("\n")
    s2.append((eval(a),eval(b)))
s=s2
# print(s2)

def comp(a,b):
    if type(a) is int and type(b) is int:
        if a < b: return -1
        elif a==b: return 0
        else: return 1
    else:
        if type(a) is list and type(b) is int:
            b=[b]
        elif type(a) is int and type(b) is list:
            a=[a]
        for aa,bb in zip(a,b):
            r=comp(aa,bb)
            if r != 0: return r
        n=len(a)
        m=len(b)
        return comp(n,m)

r=0
for i,(a,b) in enumerate(s):
    if comp(a,b) == -1:
        r+= i + 1
print(r)

#Part 2
p=[[[2]],[[6]]]
for a,b in s:
    p.append(a)
    p.append(b)

#bubble sort
for i in range(len(p)):
    for j in range(len(p)-1):
        if comp(p[j], p[j+1]) > 0:
            p[j], p[j+1] = p[j+1], p[j]

x, y = [i for i in range(len(p)) if p[i] == [[2]] or p[i] == [[6]]]
print((x + 1) * (y + 1))

