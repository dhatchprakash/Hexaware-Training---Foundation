#1) Check if a number is positive
num = int(input("Enter an integer: "))
if num > 0:
    print("Positive")


#2) Check if the temperature is hot
temperature = float(input("Enter the temperature: "))

if temperature > 30:
    print("Hot day!")


#3) Check if a number is even
num = int(input("Enter a number: "))

if num % 2 == 0:
    print("Even number")


#4) Check if a number is even or odd
num = int(input("Enter a number: "))

if num % 2 == 0:
    print("Even")
else:
    print("Odd")



#5) Check voting eligibility
age = int(input("Enter your age: "))

if age >= 18:
    print("Eligible to vote")
else:
    print("Not eligible to vote")



#6) Password check
password = input("Enter your password: ")

if password == "admin123":
    print("Access Granted")
else:
    print("Access Denied")


#7) Check if a number is positive, negative, or zero
num = int(input("Enter a number: "))

if num > 0:
    print("Positive")
elif num < 0:
    print("Negative")
else:
    print("Zero")


#8) Grading system
score = int(input("Enter your score (0-100): "))

if score >= 90:
    print("A")
elif score >= 80:
    print("B")
elif score >= 70:
    print("C")
elif score >= 60:
    print("D")
else:
    print("F")



#9) Check if a year is a leap year
year = int(input("Enter a year: "))

if (year % 400 == 0) or (year % 4 == 0 and year % 100 != 0):
    print("Leap year")
else:
    print("Not a leap year")



#10) Greet based on the time of day
time = int(input("Enter the current time (24-hour format): "))

if 5 <= time < 12:
    print("Good Morning")
elif 12 <= time < 17:
    print("Good Afternoon")
elif 17 <= time < 21:
    print("Good Evening")
else:
    print("Good Night")


#Using a While Loop (Continuous Input Until User Stops)
while True:
    score = int(input("Enter your score (0-100) or -1 to stop: "))

    if score == -1:
        print("Exiting...")
        break  # Exit the loop if the user enters -1

    if score >= 90:
        print("Grade: A")
    elif score >= 80:
        print("Grade: B")
    elif score >= 70:
        print("Grade: C")
    elif score >= 60:
        print("Grade: D")
    else:
        print("Grade: F")
