#this is documentation for syntax in python
#this was made in version 3.14.0
#information grabbed from #https://www.w3schools.com/python/python_intro.asp 

#1: basic utils
print("hi") 
print("hi"); print("this is a "); print("multi statement line")

global globalVar
globalVar = 1

array1 = [1, 2, 3, 4, 5]
array1.append(6) #add to array

multiLineComment = """put text between these"""
tuple1 = ("Banana", 45, True) #Tuple: order will never change by index


#2: if/else/elseif
#python uses elif instead of elseif, and colon instead of then
if 5 > 2:
    print("five more than one")
elif 5 < 2:
    print("how?")
else:
    print("uhm idk")


#3: function 
#you use def, and colon at end of function name
def greet(Name):
    print("hi,", Name)
greet("John")


#4: arithmetic operators 
1 + 1 #Addition
1 - 1 #Subtraction
1 * 1 #Multiplication
1 / 1 #Division (float result)
1 // 1 #Floor Division (integer result)
1 % 1 #Modulus (remainder of division)
1 ** 1 #Exponentiation


#5: assignment operators
a1, a2 = 1, 1 #Assign value (to two variables in this example!)
a1 += 1 #Add and assign
a1 -= 1 #Subtract and assign
a1 *= 1 #Multiply and assign
a1 /= 1 #Divide and assign
a1 //= 1 #Floor divide and assign
a1 %= a1 #Modulo and assign
a1 **= a1 #Exponentiate and assign
#a1 := 1 #Assignment expression (Walrus operator) - only in py v3.8


#6: comparison operators
a1 == 1 #Equal to
a1 != 1 #Not equal to
a1 > 1 #Greater than
a1 < 1 #Less than
a1 >= 1 #Greater than or equal to
a1 <= 1 #Less than or equal to


#7: boolean operators
a1 and a2 #and
a1 or a2 #or
not a2 #not


#8: identity operators
a1 is a2 #true if both variables are same object
a1 is not a2 #true if both variables arent same object


#9: membership operators 
5 in array1 #true if value is present in sequence
6 not in array1 #true if value isnt in sequence


""" #10: bitwise operators (your not gonna use these)
a1 & a2 #Bitwise AND
a1 | a2 #Bitwise OR
a1 ^ a2 #Bitwise XOR
~ a1 #Bitwise NOT (complement)
5 << 1 #Left shift
5 >> 1 #Right shift """


#11 loops
#iterating through array
for number in array1:
    print(number)
#iterating string
message = "i like banana"
for char in message:
    print(char)


#while loop
count1 = 0
while count1 < 5:
    print(count1)
    count1 += 1

#while loop using continue
count2 = 0
while count2 < 5:
    if count2 == 5:
        break
    print(count2)

count3 = 0
while count3 < 5:
    count3 += 1
    if count3 == 3:
        continue
    print(count3)


#using range
#stop
for num in range(5):
    print(num)
#start, stop
for num in range(1, 5):
    print(num)
#start, stop, step (increment that it counts at)
for num in range(1, 5, 2):
    print(num)


#12: 