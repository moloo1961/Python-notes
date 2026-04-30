# Program using input to prompt user for name
name = input("Enter your name:") # make input a variable
Greeting = "Hello" # make Hello a greeting variable
print(Greeting, name) # display result



# Program to promt user for hours and rate 
# to compute gross pay
def compute_gross_pay():    
    hours = int(input("Enter hours:")) # specify type of data i.e int 
    rate = float(input("Enter rate:")) # specify type of data i.e float 
    gross_pay = hours * rate
    print(f"The multiplication of {hours} and {rate} is {gross_pay}")

compute_gross_pay()



# Write value of expressions and their values
# Use python interpreter to check answers
width = 17
height = 12.0
# 1. width//2 - assign variables to further breakdown code
a = width//2 
print(a, type(a)) # to have 2 results in 1 line use comma
# 2. width/2.0 - assign variables to further breakdown code
b = width/2.0
print(b, type(b))
# 3. height/3 - assign variables to further breakdown code
c = height/3
print(c, type(c))
# 4. 1 + 2 * 5 - assign variables to further breakdown code
d = 1 + 2 * 5
print(d, type(d))
# To check answers using python interpreter
# Type python in terminal
# Once you see >>> write variables and the tests step by step



# Program that prompts user for a celsisus temp then converts into fahrenheit
def convert_temp_into_fahrenheit():
    temp = float(input("Indicate the temperature in celsius:")) # convert input to float
    fahrenheit = (temp * 1.8 + 32) # formula for celsius - fahrenheit
    print(f"The {temp} multiplied by {1.8} and added to {32} is {fahrenheit}")

convert_temp_into_fahrenheit()