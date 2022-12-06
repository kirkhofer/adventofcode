'''
I did do this in PowerShell first ;)

x=4 or 14
Look back to find the first place the last `x` characters aren't repeated plus 1
'''
b=open("../input.txt").read()

print("Pattern A: Just make it work")
#long way
for i,x in enumerate([4,14]):
    for r in range(x,len(b)):
        if(len(set(b[r-x:r]))==x):
            print("Answer {}={}".format(i+1,r))
            break

print("Pattern B: List Comprehension")
#Let's try this in list comprehension
l = [[r for r in range(x,len(b)) if(len(set(b[r-x:r]))==x)][0] for x in [4,14]]
print("Answer 1={}".format(l[0]))
print("Answer 2={}".format(l[1]))

#Whoa, I got inline with Nicole's thinking finally 