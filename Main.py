
def input_values():
    # taking in user input
    user_input = input("Enter single digit numbers separated by commas: ")

    # parsing through input
    input_elements = []
    for value in user_input:
        if value.isdigit():
            input_elements.append(value)
    return input_elements

def minimum():
    # finding minimum number
    min_element = input_elements[0]
    for i in range(1,len(input_elements)):
        if input_elements[i] < min_element:
            min_element = input_elements[i]
    return min_element

def average():
    # finding average number
    total = 0
    for value in input_elements:
        total += int(value)
    avg_num = total / len(input_elements)
    return avg_num

if __name__ == "__main__":

    # function calls
    input_elements = input_values()
    min = minimum()
    avg = average()

    # printing to the terminal
    print(f"Your numbers are: [{', '.join(input_elements)}]") 
    print(f"Minimum number is: {min}")
    print(f"Average is: {avg}\n")