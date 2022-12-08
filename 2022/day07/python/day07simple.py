#Some tight solutions from the reddit
'''
from collections import defaultdict
from itertools import accumulate


dirs = defaultdict(int)

for line in open('in.txt'):
    match line.split():
        case '$', 'cd', '/': curr = ['/']
        case '$', 'cd', '..': curr.pop()
        case '$', 'cd', x: curr.append(x+'/')
        case '$', 'ls': pass
        case 'dir', _: pass
        case size, _:
            for p in accumulate(curr):
                dirs[p] += int(size)

print(sum(s for s in dirs.values() if s <= 100_000),
      min(s for s in dirs.values() if s >= dirs['/'] - 40_000_000))
'''
tuple(map(lambda func: func(__import__("functools").reduce((lambda data, x: dict(cwd={"/":[], "..":data["cwd"][:-1]}.get(x[5:].strip(), data["cwd"] + [x[5:].strip()]), fs=data["fs"]) if x.startswith("$ cd") else (dict(cwd=data["cwd"], fs= data["fs"] + __import__("collections").Counter({"/".join(data['cwd'][:i]): int(x.split(" ")[0]) for i in range(len(data["cwd"]) + 1)})) if x.split(" ")[0].isdigit() else data)),open("input7.txt").read().strip().split('\n'),dict(cwd=[], fs=__import__("collections").Counter()))["fs"]),[lambda fs: sum(dirsize for dirsize in fs.values() if dirsize < 100000), lambda fs: min(x for x in ((v + 40000000 - fs[""],v) for k,v in fs.items()) if x[0] > 0)[1]]))      