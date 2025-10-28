#Python 3.14.0
import random
import time
randomNumber = random.randint(1, 10)
print(randomNumber)



def main():
    IVar = input("Choose a number: ")
    IVar2 = int(IVar)
    if IVar2 == randomNumber:
        print("yay")
    else:
        print("wrong")
        time.sleep(1)
        main()
main()