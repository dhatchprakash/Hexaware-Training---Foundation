class Operations:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def add(self):
        return self.a + self.b

    def subtract(self):
        return self.a - self.b

    def multiply(self):
        return self.a * self.b

    def divide(self):
        if self.b != 0:
            return self.a / self.b
        else:
            return "Cannot divide by zero"

    def modulus(self):
        if self.b != 0:
            return self.a % self.b
        else:
            return "Cannot perform modulus with zero"

# Example usage
obj = Operations(10, 0)
print("Addition:", obj.add())
print("Subtraction:", obj.subtract())
print("Multiplication:", obj.multiply())
print("Division:", obj.divide())
print("Modulus:", obj.modulus())
