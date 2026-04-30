# PRACTICE 
# input() gets info from users
# to retain value it is assigned a variable e.g name
# print then gives back the value (displays the info)
name = input("Enter Your name:")
country = "Kenya"
print(name, "comes from", country)
# note that the terminal is now interactive
# Input() then assign variable then add print()

def add_numbers_inputed_by_user(): #
    num1 = float(input("Enter the first number:"))
    num2 = float(input("Enterthe second number"))
    result = num1 + num2
    print(f"The sum of the {num1} and {num2} is {result}")

add_numbers_inputed_by_user()

print("NEW")

answer = 6.5 // 2 # divide and rounds off to nearest whole number
print(answer)

# Checking for Equality
print(7 == 7.10) # equal to

print(8 != 100) # not equal to


# A common use for this will be checking log details
# Your password and username should match exactly before login


print("---------------------")

# Numeric comparison numbers
print(5 > 3) # greater than
print(5 < 3) # less than
print(20 >= 5) # greater or equal to
print(5 <= 40) # less or equal

print("---------------------")

# Other unique comparison
print("Marlene" > "Marlic") #Strings are evaluated in alphabetical order - True
print("Marlene" < "Marlic") # False

print("---------------------")

print("Hazel" >= "Janelle") # False

print("---------------------")

print("Isaac" >= "Brian") # False

# we use a virtual environment to avoid co-dependency conflict

# DATA TYPES functions and methods 
text = "hi"
number = 10

print(text)
print(10)

print(type(text)) # function type() returns data type of value
print(type(number))

print(len(text)) # function len() gives total count of items in value
# len() cannot be used by class int only class str

print(text.upper()) # method upper() converts string to uppercase
# upper() cannot be used by class int only class str

print(number.bit_length()) # method bit_length() returns the length of a number in binary
# bit_length cannot be used by class str only by class int
# In this case we need 4 bits inorder to store the value 10

# DATA TYPES IN PYTHON
# 1. NO VALUE 
#       NoneType - None

# 2. SINGLE VALUES
#       A. Numeric 
#          a. int - 15
#          b. float - 3.15
#          c. complex - 3 + 5j

#       B. Str 
#          "Hello"

#       C. Bool
#          a. True
#          b. False

#       D. Date & Time
#          a. date - 2026-12-25
#          b. time - 18:05:30
#          c. datetime - 2026-12-25\n18:05:30

# 3. MULTI-VALUES
#       A. list - [1,2,3] # SQUARE BRACKETS
#       B. tuple - (1,2,3) # NORMAL BRACKETS
#       C. set - {1,2,3} # CURLY BRACKETS
#       D. dict - {'a':1, 'b':2} # CURLY BRACKETS
#       E. array - ('i', [10,20]) # NORMAL & SQUARE