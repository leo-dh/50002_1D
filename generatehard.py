from random import randint, choice, shuffle
import operator
import itertools
import pprint

i = 0

operator = {
    "+":operator.add,
    "-":operator.sub,
    "*":operator.mul,
    "/":operator.truediv
}



opcode = {
    "+":"000000",
    "-":"000001",
    "*":"000010",
    "/":"100010"
}

ans = {}

def permutations(tup):
    allperms = list(itertools.permutations(tup))
    return allperms


while (i<200):
    a = randint(2,9)
    b = randint(2,9)
    c = randint(2,9)
    operator1 = choice(list(operator.keys()))
    operator2 = choice(list(operator.keys()))
    if (a == b) or (a == c) or (b == c) or (operator1 == operator2):
        continue

    d = eval(str(a) + operator1 + str(b) + operator2 + str(c))
    if ((d * 10 % 10) > 0):
        continue
    if (0<=d<10):
        valueset = ((str(a), str(b), str(c)), str(int(d)))
        if (valueset not in ans.values()):
            ans[i] = valueset
            i += 1

# pprint.pprint(ans)
operatortemp = ["+", "-", "*", "//"]
toberemoved = []
for ind,val in ans.items():
    perms = permutations(val[0])
    d = val[1]
    for perm in perms:
        a,b,c = perm
        for op1 in operatortemp:
            for op2 in operatortemp:
                mojo = str(eval(a+op1+b+op2+c))
                if op1 == "//": op1 = "/"
                if op2 == "//": op2 = "/"
                actual = str(eval(a+op1+b+op2+c))
                if (float(mojo) == float(d)) and not(float(actual) == float(d)) and ((op1 == "/") or (op2 == "/")):
                    print (ind, mojo, actual, d)
                    toberemoved.append(ind)
                    break
                else:
                    continue
                break
            else:
                continue
            break
        else:
            continue
        break


print ("To be removed:" + str(len(toberemoved)))

for i in toberemoved:
    ans.pop(i, None)


with open ("generatehard2.txt", 'w') as f:
    i = 0
    for key, value in ans.items():
        a, b, c = value[0]
        d = value[1]
        operandlist = [a,b,c]
        shuffle(operandlist)
        f.write("d"+str(i)+":\n")
        f.write("\ta = " + str(operandlist[0]) +";\n")
        f.write("\tb = " + str(operandlist[1]) +";\n")
        f.write("\tc = " + str(operandlist[2]) +";\n")
        f.write("\td = " + str(d) +";\n")
        f.write("\n")
        i+=1





