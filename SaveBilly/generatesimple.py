from random import randint
import operator

i = 0
op = {
    1:operator.add,
    2:operator.sub,
    3:operator.mul,
    4:operator.mod
}
opcode = {
    1:"000000",
    2:"000001",
    3:"000010",
    4:"100010"
}

ans = {}

while (i < 100):
    a = randint(1,9)
    b = randint(1,9)
    mathoperator = randint(1,4)
    c = op.get(mathoperator)(a, b)
    if mathoperator == 4:
        if (c == 0) and (a > b):
            d = a//b
            if b == 1:
                valueset = (a, b, d, opcode.get(3), opcode.get(4))
            else:
                valueset = (a, b, d, opcode.get(4), opcode.get(4))
    else:
        if (0 <= c < 10):
            if mathoperator == 3 and b == 1:
                valueset = (a, b, c, opcode.get(3), opcode.get(4))
            else:
                valueset = (a, b, c, opcode.get(mathoperator),opcode.get(mathoperator))
    if valueset not in ans.values():
        ans[i] = valueset
        i += 1

with open ('generatesimple.txt', 'w') as f:
    for key in ans.keys():
        aval, bval, cval, opcodeval1, opcodeval2 = ans.get(key)
        f.write("d"+str(key)+":\n")
        f.write("\ta = " + str(aval) +";\n")
        f.write("\tb = " + str(bval) +";\n")
        f.write("\tc = " + str(cval) +";\n")
        f.write("\tans1 = b" + opcodeval1 +";\n")
        f.write("\tans2 = b" + opcodeval2 +";\n")
        f.write("\n")



