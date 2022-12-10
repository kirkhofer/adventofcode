#Interesting code I found during the run today
from functools import reduce
import math

def solution(monkeys,part=1):
    inspections = [0] * len(monkeys)

    mod = reduce(lambda acc, x: acc * x, map(lambda monkey: monkey[3], monkeys), 1)

    ev = "math.floor(({}) / 3)" if 1==part else "({}) % mod"
    rng = 20 if 1==part else 10000

    for _ in range(rng):
        for i, monkey in enumerate(monkeys):
            while len(monkey[1]) > 0:
                item = monkey[1].pop(0)
                new_worry = eval(ev.format(monkey[2].replace('old', str(item))))
                if new_worry % monkey[3] == 0:
                    monkeys[monkey[4]][1].append(new_worry)
                else:
                    monkeys[monkey[5]][1].append(new_worry)

                inspections[i] += 1

    print(inspections)
    return reduce(lambda acc, x: acc * x, sorted(inspections, reverse=True)[:2], 1)

def parse(input):

    def parse_monkey(descr):
        lines = descr.splitlines()

        id_ = int(lines[0].strip(": ")[len("Monkey "):])
        items = list(map(int, lines[1].strip()[len("Starting items: "):].split(", ")))
        operation = lines[2].strip()[len("Operation: new = "):]
        test = int(lines[3].strip()[len("Test: divisible by "):])
        test_true = int(lines[4].strip()[len("If true: throw to monkey "):])
        test_false = int(lines[5].strip()[len("If false: throw to monkey "):])

        return (id_, items, operation, test, test_true, test_false)

    return list(map(parse_monkey, input.split("\n\n")))

input = open("2022/day11/input.txt", "r").read()
#input = open("2022/day11/sample.txt", "r").read()

##32059801242
monkeys=parse(input)
rt = solution(monkeys,part=2)
assert rt == 32059801242
print(f"Part 2:{rt}")

#120384
monkeys=parse(input)
rt = solution(monkeys,part=1)
assert rt == 120384
print(f"Part 1:{rt}")



