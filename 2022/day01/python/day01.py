#From Nicole using map to do the leg work
print(max(sum(map(int,x.split()))for x in open('2022/day01/input.txt').read().split('\n\n')))
print(sum(sorted(sum(map(int,x.split()))for x in open('2022/day01/input.txt').read().split('\n\n'))[-3:]))

# for line in open('2022/day1/input.txt',).read().split('\n\n'):
#     print(line)
#     tot = map(int,line.split())
#     print(max(sum(tot)))


