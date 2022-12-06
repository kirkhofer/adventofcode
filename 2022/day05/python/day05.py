#From Nicole again...sweet stuff
#Use the first line to determine how many crates
b=int((len(open("../input.txt").read().split("\n")[0])+1)/4)
#Use list comprehension to get all the moves
d=[[int(x)for x in l.split()if x.isdigit()]for l in open("../input.txt").read().split("\n")if l.startswith("move")]
#Get all the crates and store them in s
s=[[r[k]for r in [l[1::4]for l in open("../input.txt").read().split("\n")if"["in l]if r[k]!=" "]for k in range(b)]
#Create a copy of the array
z=s[:]
for i in d:
   a,f,t=i[0],i[1]-1,i[2]-1
   s[t]=s[f][:a][::-1]+s[t]
   s[f]=s[f][a:]
   z[t]=z[f][:a]+z[t]
   z[f]=z[f][a:]
print("".join(x[0]for x in s))
print("".join(x[0]for x in z))

#move = [[int(x) for x in l.split()if x.isdigit()]for l in open("../input.txt").read().split("\n")if l.startswith("move")]
#move = [x in l]for l in open("../input.txt").read().split("\n")]
# b=len(open("../input.txt").read().split("\n")[0])
# # a=[[for x in l.split() if x.isdigit]for l in open("../input.txt").read().split("\n")]

# #d=[[int(x)for x in l.split()if x.isdigit()]for l in open("../input.txt").read().split("\n")if l.startswith("move")]
# #s=[[r[k]for r in [l[1:][::4]for l in open("../input.txt").read().split("\n")if"["in l]if r[k]!=" "]for k in range(9)]
# [[r[k] for r in [l[1::4] for l in open("../input.txt").read().split("\n")if"["in l]if r[k]!=" "]for k in range(9)]

# l="                [B]     [L]     [S]"
# l[1:]

# for k in range(9):
#     print(k)


# d=[]
# for l in open("../input.txt").read().split("\n"):
#     if l.startswith("move"):
#     a=[l for l in l.split()if l.isdigit()]
#     d.append(a)
# print(d)


    # print(l)
    # if l.startswith("move"):
    #     print(len(move))
    # print(s)

#From Nicole again...sweet stuff
#d=[[int(x)for x in l.split()if x.isdigit()]for l in open("day05/input.txt").read().split("\n")if l.startswith("move")]
#s=[[r[k]for r in [l[1:][::4]for l in open("day05/input.txt").read().split("\n")if"["in l]if r[k]!=" "]for k in range(9)]
#z=s[:]
#for i in d:
#    a,f,t=i[0],i[1]-1,i[2]-1
#    s[t]=s[f][:a][::-1]+s[t]
#    s[f]=s[f][a:]
#    z[t]=z[f][:a]+z[t]
#    z[f]=z[f][a:]
#print("".join(x[0]for x in s))
#print("".join(x[0]for x in z))