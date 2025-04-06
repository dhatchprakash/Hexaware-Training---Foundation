# 🔸 1. Single Inheritance
# Example: A Dog is an Animal

class Animal:
    def speak(self):
        print("Animal makes sound")

class Dog(Animal):  # Single inheritance
    def bark(self):
        print("Dog barks")

print("\n--- Single Inheritance ---")
d = Dog()
d.speak()
d.bark()


# 🔸 2. Multilevel Inheritance
# Example: Animal → Dog → Puppy

class Puppy(Dog):  # Inheriting from Dog which already inherits Animal
    def play(self):
        print("Puppy plays with ball")

print("\n--- Multilevel Inheritance ---")
p = Puppy()
p.speak()
p.bark()
p.play()


# 🔸 3. Hierarchical Inheritance
# Example: Vehicle → Car, Bike

class Vehicle:
    def fuel(self):
        print("Uses fuel")

class Car(Vehicle):
    def doors(self):
        print("Car has 4 doors")

class Bike(Vehicle):
    def wheels(self):
        print("Bike has 2 wheels")

print("\n--- Hierarchical Inheritance ---")
c = Car()
c.fuel()
c.doors()

b = Bike()
b.fuel()
b.wheels()


# 🔸 4. Multiple Inheritance
# Example: Father and Mother → Child

class Father:
    def drive(self):
        print("Father drives")

class Mother:
    def cook(self):
        print("Mother cooks")

class Child(Father, Mother):  # Multiple inheritance
    def code(self):
        print("Child codes")

print("\n--- Multiple Inheritance ---")
ch = Child()
ch.drive()
ch.cook()
ch.code()


# 🔸 5. Hybrid Inheritance
# Example: Person → Employee, Student → Intern

class Person:
    def info(self):
        print("Basic person info")

class Employee(Person):
    def work(self):
        print("Employee works in office")

class Student(Person):
    def study(self):
        print("Student studies in college")

class Intern(Employee, Student):  # Hybrid: Multiple + Hierarchical
    def task(self):
        print("Intern does office and college work")

print("\n--- Hybrid Inheritance ---")
i = Intern()
i.info()
i.work()
i.study()
i.task()
