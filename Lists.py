# 1) Reverse a list
numbers = [1, 2, 3, 4, 5]
numbers.reverse()
print("Reversed List:", numbers)

# 2) Concatenate two lists index-wise
list1 = ["A", "B", "C"]
list2 = ["D", "E", "F"]
concat_list = [i + j for i, j in zip(list1, list2)]
print("Concatenated List:", concat_list)

# 3) Turn every item into its square
numbers = [1, 2, 3, 4, 5]
squared_numbers = [x ** 2 for x in numbers]
print("Squared Numbers:", squared_numbers)

# 4) Concatenate two lists in a specific order
list1 = ["Hello", "Good"]
list2 = ["World", "Morning"]
order_concat = [x + " " + y for x in list1 for y in list2]
print("Concatenated in Order:", order_concat)

# 5) Iterate both lists simultaneously
list1 = [1, 2, 3]
list2 = ['a', 'b', 'c']
print("Iterating Lists Simultaneously:")
for num, char in zip(list1, list2):
    print(num, char)

# 6) Remove empty strings from list
words = ["apple", "", "banana", "", "cherry"]
filtered_words = [word for word in words if word]
print("List after Removing Empty Strings:", filtered_words)

# 7) Add a new item after a specified item
items = [10, 20, 30, 40]
specified_item = 20
new_item = 25
index = items.index(specified_item) + 1
items.insert(index, new_item)
print("List after Adding New Item:", items)

# 8) Extend nested list by adding the sublist
nested_list = [1, [2, 3], 4]
sublist = [5, 6]
nested_list[1].extend(sublist)
print("Extended Nested List:", nested_list)

# 9) Replace a list item with a new value if found
numbers = [10, 20, 30, 40]
old_value = 20
new_value = 25
if old_value in numbers:
    index = numbers.index(old_value)
    numbers[index] = new_value
print("List after Replacing an Item:", numbers)

# 10) Remove all occurrences of a specific item
numbers = [1, 2, 2, 3, 2, 4, 5, 2]
item_to_remove = 2
filtered_numbers = [num for num in numbers if num != item_to_remove]
print("List after Removing All Occurrences:", filtered_numbers)
