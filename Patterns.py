#Pattern 1: Right-Angled Triangle (* as a separator)
rows = 5
for i in range(1, rows + 1):
    print(" * ".join("*" * i))


#Pattern 2: Inverted Triangle (- as a separator)
rows = 5
for i in range(rows, 0, -1):
    print(" - ".join("-" * i))



#Pattern 3: Pyramid (# as a separator)
rows = 5
for i in range(1, rows + 1):
    print(" " * (rows - i) + " # ".join("#" * i)) 



#Pattern 4: Diamond (| as a separator)
rows = 5
for i in range(1, rows + 1, 2):
    print(" " * (rows - i) + " | ".join("|" * i))

for i in range(rows - 2, 0, -2):
    print(" " * (rows - i) + " | ".join("|" * i))



#Pattern 5: Number Triangle (+ as a separator)
rows = 5
for i in range(1, rows + 1):
    print(" + ".join(str(num) for num in range(1, i + 1)))








