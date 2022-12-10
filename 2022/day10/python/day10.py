'''
During the 20th cycle, register X has the value 21, so the signal strength is 20 * 21 = 420. 
(The 20th cycle occurs in the middle of the second addx -1, so the value of register X is the starting value, 1, 
plus all of the other addx values up to that point: 1 + 15 - 11 + 6 - 3 + 5 - 1 - 8 + 13 + 4 = 21.)
During the 60th cycle, register X has the value 19, so the signal strength is 60 * 19 = 1140.
During the 100th cycle, register X has the value 18, so the signal strength is 100 * 18 = 1800.
During the 140th cycle, register X has the value 21, so the signal strength is 140 * 21 = 2940.
During the 180th cycle, register X has the value 16, so the signal strength is 180 * 16 = 2880.
During the 220th cycle, register X has the value 18, so the signal strength is 220 * 18 = 3960.
'''

# import sys
# from collections import Counter
# d=[[x for x in l.split()]for l in sys.stdin]
d=[[x for x in l.split()]for l in open("2022/day10/input.txt").read().split("\n")]
mv=[1]
for a in d:
    print(f"a:{a}")
    mv.append(0)
    if a[0]!="noop":
        mv.append(int(a[1]))
print(f"Answer 1={sum([sum(mv[:a]*a) for a in range(20,220+1,40)])}")

def v1():
    x=1
    count=1
    out=20
    outputs=[]
    for i,a in enumerate(d):
        print(f"a:{a}")
        if count == out:
            print('here1')
            outputs.append(x * out)
            out+=40
        if a[0] != "noop":
            count+=1
            if count == out:
                print('here2')
                outputs.append(x * out)
                out+=40    
            x+=int(a[1])
        count+=1




        #mv.append(0 if a[0]=="noop" else int(a[1]))




# print(len(d))

