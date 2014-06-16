def chain(length):
    cores = [ Core([]) for i in range(length) ]
    for i, c in enumerate(cores):
        if i != length-1:
            c.out_cores = [Output(cores[i+1], 0)]

    return cores

def grid(dim):
    cores = [ [ Core([None]*4) for i in range(dim) ] for j in range(dim) ]

    for j in range(dim):
        for i in range(dim):
            c = cores[j][i]
            if i + 1 < dim:
                c.out_cores[0] = Output(cores[j][i+1], 1)
            if i - 1 >= 0:
                c.out_cores[1] = Output(cores[j][i-1], 0)
            if j + 1 < dim:
                c.out_cores[2] = Output(cores[j+1][i], 3)
            if j - 1 >= 0:
                c.out_cores[3] = Output(cores[j-1][i], 2)

    return [ c for row in cores for c in row]
