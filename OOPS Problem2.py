from datetime import date

class EmployeeManagement:
    def __init__(self):
        self.emp_id = None
        self.name = None
        self.dob = None
        self.base_salary = 0
        self.leaves_allowed = 0
        self.leaves_taken = 0

    def input_info(self):
        print("\n--- Enter Employee Details ---")
        self.emp_id = input("Enter Employee ID: ")
        self.name = input("Enter Name: ")
        try:
            year = int(input("Enter Birth Year (YYYY): "))
            month = int(input("Enter Birth Month (1-12): "))
            day = int(input("Enter Birth Day (1-31): "))
            self.dob = (year, month, day)
        except ValueError:
            print("Invalid date format. Setting DOB to default (2000-01-01).")
            self.dob = (2000, 1, 1)

        self.base_salary = float(input("Enter Base Salary: "))
        self.leaves_allowed = int(input("Enter Leaves Allowed: "))
        print("Employee info recorded successfully.\n")

    def apply_leave(self):
        print("\n--- Apply Leave ---")
        try:
            leave_days = int(input("Enter number of leave days to apply: "))
            if leave_days < 0:
                print("Leave days cannot be negative.")
            else:
                self.leaves_taken += leave_days
                print(f"Leave applied successfully! Total leaves taken: {self.leaves_taken}")
        except ValueError:
            print("Invalid input. Please enter an integer.")

    def calculate_age(self):
        print("\n--- Age Calculation ---")
        today = date.today()
        try:
            birthdate = date(*self.dob)
            age = today.year - birthdate.year - ((today.month, today.day) < (birthdate.month, birthdate.day))
            print(f"Employee Age: {age} years")
        except:
            print("DOB is not set properly.")

    def calculate_salary(self):
        print("\n--- Salary Calculation ---")
        deduction = 0
        if self.leaves_taken > self.leaves_allowed:
            extra = self.leaves_taken - self.leaves_allowed
            deduction = extra * 1000
            print(f"Excess leaves taken: {extra}. Deduction: ₹{deduction}")
        else:
            print("No salary deduction.")

        final_salary = self.base_salary - deduction
        print(f"Final Salary: ₹{final_salary}")
        return final_salary

    def show_info(self):
        print("\n--- Employee Information ---")
        print(f"Employee ID: {self.emp_id}")
        print(f"Name: {self.name}")
        print(f"DOB: {self.dob}")
        print(f"Base Salary: ₹{self.base_salary}")
        print(f"Leaves Allowed: {self.leaves_allowed}")
        print(f"Leaves Taken: {self.leaves_taken}")
        self.calculate_age()
        self.calculate_salary()



def main():
    emp = EmployeeManagement()

    while True:
        print("\n========== EMPLOYEE MANAGEMENT ==========")
        print("1. Input Employee Info")
        print("2. Apply Leave")
        print("3. Show Employee Info")
        print("4. Exit")
        choice = input("Enter your choice (1-4): ")

        if choice == '1':
            emp.input_info()
        elif choice == '2':
            emp.apply_leave()
        elif choice == '3':
            emp.show_info()
        elif choice == '4':
            print("Exiting program.")
            break
        else:
            print("Invalid choice! Try again.")

main()
