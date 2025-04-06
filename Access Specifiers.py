class Demo:
    def __init__(self):
        self.public_var = "I am Public"
        self._protected_var = "I am Protected"
        self.__private_var = "I am Private"

    def show(self):
        print(self.public_var)
        print(self._protected_var)
        print(self.__private_var)

obj = Demo()
print(obj.public_var)           # ✅ public
print(obj._protected_var)       # ⚠️ technically accessible, but protected
# print(obj.__private_var)      # ❌ will cause error
print(obj._Demo__private_var)   # ✅ private via name mangling

obj.show()                      # ✅ all values printed inside class
