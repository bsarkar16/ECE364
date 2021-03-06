import re

def is_valid_name(identifier):
    if re.match("^[A-Za-z0-9_-]*$", identifier):
        return True
    else:
        return False

def parse_pin_assignment(assignment):
    g = re.match("\.(.*)\((.*)\)",assignment)
    #print(g.group(1))
    if g:
        valid_wire = is_valid_name(g.group(1))
        valid_pin = is_valid_name(g.group(2))
        if(valid_pin == True and valid_wire == True):
            return g.group(1),g.group(2)
        else:
            raise ValueError(assignment)
    else:
        raise ValueError(assignment)

def parse_net(line):
    g = re.match("(.*?) +(.*?) ?\((.*)\)",line)
    #print(g.group(3))
    lst = []
    if g:
        comp_name = g.group(1)
        inst_name = g.group(2)
        valid_comp_name = is_valid_name(comp_name.strip())
        valid_inst_name = is_valid_name(inst_name.strip())
        if(valid_comp_name == False):
            raise ValueError(g.group(1))
        if(valid_inst_name == False):
            raise  ValueError(g.group(2))
        spl = g.group(3).split(",")
        #print(cmp)
        for i in spl:
            lst.append(parse_pin_assignment(i.strip()))
        #print("2")
        #print(lst)
        cmp = tuple(lst)
        return comp_name.strip(),inst_name.strip(),cmp
    else:
        raise ValueError(line)

        #valid_comp_name
