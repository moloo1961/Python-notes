# STRING FUNCTIONS
# Types
name = "Marlene"
print(type(name))

age  = 27
print(type(age))
# To make age string use str()
print("Your Age is:" + str(age))
# However that does'nt convert the variable 
# To convert the variable age to string
age = str(age) # Now the variable age is a string 
# math functions wont work



# Math
# A. You can use len() to make sure password is a certain length
password = "123arfjter"
print(len(password))
# To check that condition is met:
if len(password) < 8:
    print("Your password is too short!")
# if condition is not met the warning will be printed 
# if condition is met nothing happens
# len() counts everything ..even spaces


# B. You can use count() to see how many times a value appears
text = """
Python is easy to learn.
Python is powerful.
Many people love python.
"""
print(text.count("Python"))



# DATA TRANSFORMATIONS
# A. You can use replace() to swap part of text with something new
price = "1534,54"
print(price.replace(",", "."))
# Its still a string so we need to make that a float 

phone = "254-7117252-89"
print(phone.replace("-", "/"))


# B. You can also replace value with no value
phone = "254-7117252-89"
print(phone.replace("-", ""))


# C. You can also use replace() to clean numeric formats
price2 = "$1,299.99"
print(price2.replace("$", "").replace(",", "")) # Replaced 2 values at the same time
print(type(price2))

messy_phone = "+49 (176) 123-4567"
print(messy_phone.replace("+", "00").replace("9 (1", "91")
     .replace("6) 1", "61").replace("-", ""))



# JOINT STRINGS
# + operator
# A. Use to join strings
first_name = "Marlene"
last_name = "Achieng"
last_name = first_name + "-" + last_name
# Space needs to be added into the joint string as "-"
# In this case "-"
print(last_name)


# B. Use to build file paths 
folder = "C:/Users/Marlene"
file = "report.csv"
full_file_path = folder + "/" + file
# To separate folder from file - can also add / after Marlene
print(full_file_path)



# f-string (formatted)
# A. modern, super-easy way to format and build strings
name1 = "Sam"
age1 = 34
is_student = False
print("My name is " + name + ", I am " + str(age1) + "years old, and student status is " + str(is_student) +".")
# INSTEAD DO THIS
print(f"My name is {name}, I am {age1} years old, and student status is {is_student}.")
# f-string: Shorter, cleaner, easier to read
# especially with multiple variables


# B. Use with expressions too
print(f"2 + 3 = {2 + 3}")

# To have curly brackets in output - use twice
print(f"{{This is me}}")



# SPLIT STRINGS
# A. You can use method split() to separate values
stamp = "2026-09-20 14:30"
print(stamp.split(" "))
# Note the sepator. In this case its "space" and place that in the brackets

stamp1 = "2026-09-20"
print(stamp1.split("-"))
# Note the separator. In this case its "-"" and place that in the brackets
# This creates a list


# B. You can use method split() to break comma-separated values
csv_file = "1234,Marlene,USA,1998-21-09,F"
print(csv_file.split(","))



# string * number 
# A. Repeat string multiple times
print("ha" * 3)
print("=" * 30)
print("#" * 30)
# To maybe have separations in cells and create the separation easily



# A. EXTRACTION
# Using the positive and negative indexes
# Positive are counted from left to right starting at 0
class_text = "Python"
print(class_text[0]) # This will extract first character
# Negatives are counted from right to left starting at -1
print(class_text[-5]) # 


# B. Slicing
# Start index is included while End index is not included 
# Values gotten are between the start index and before the end idex [2:4] to get 2 to 3
# If all values are needed - specify start and leave end blank [1: ] to get everything after
# You can also skip indexes [0:4:2] 0 and 4 creates boundary, 2 denotes what is skipped to get every other number skipped twice
class_date = "2026-09-20"
print(class_date[0:4]) # Extract year
print(class_date[:4]) # the lazy way

print(class_date[5:7]) # Extract month

print(class_date[8:10]) # Extract day
print(class_date[8:]) # the lazy way


# C. When to use positive vs negative
# If extracting from left use positive indexes
# If extracting from right use negative indexes
print(class_date[-2:]) # Getting everything after that index -2



# CLEANING
# A. Remove Whitespaces
# You can use method strip() to clean spaces from right and left
white_space = " Engineering ".strip()
print(white_space)

# To clean left whitespaces use lstrip()
white_space = " Engineering".lstrip()
print(white_space)

# To clean right whitespaces use rstrip()
white_space = "Engineering ".rstrip()
print(white_space)

# To remove specific character, you need to specify
blue_space = "###ABC###".strip("#")
print(blue_space)

# To detect extra spaces
# Check length before and after strip to find unwanted spaces
white_space = "Engineering"
print(len(white_space))
print(len(white_space.strip()))

Numb_of_spaces = len(white_space) - len(white_space.strip())
is_clean = len(white_space) == len(white_space.strip())
print("Num_of_spaces:", Numb_of_spaces)
print("Is my data clean?", is_clean)


# B. Case Conversion
# You can use method lower() to make letters lowercase
learn = "python PROGRAMMING"
print(learn.lower())

# You can use method upper() to make letters uppercase
learn = "python PROGRAMMING"
print(learn.upper())

# Clean data for matching
search = "Email".lower().strip()
data = " EMAIL".lower().strip() 
print(search == data)
# You take care of spaces as well as upper or lowercases

messy_string = "968-Marlene, ( D@t@ Engineer ),, 27y  "
print(messy_string.replace("968-M", "name : m").replace(", ( ", " | ").replace(" | D", "| role: D").replace("@", "a").replace(" ),, ", "| age: ").replace("27y", "27").strip().lower())



# SEARCH 
