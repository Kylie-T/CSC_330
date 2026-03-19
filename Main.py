
def input_values():
    # taking in user input
    user_input = input("Enter single digit numbers separated by commas: ")

    # parsing through input
    str_input_elements = []
    input_elements = []

    for value in user_input:
        if value.isdigit() and user_input.index(value) % 2 == 0:
            str_input_elements.append(value)
            input_elements.append(int(value))
    print(f"Your numbers are: [{', '.join(str_input_elements)}]") 
    return input_elements

def minimum(input_elements):
    # finding minimum number
    min_element = input_elements[0]
    for i in range(1,len(input_elements)):
        if input_elements[i] < min_element:
            min_element = input_elements[i]
    print(f"Minimum number is: {min_element}")

def average(input_elements):
    # finding average number
    total = 0
    for value in input_elements:
        total += int(value)
    avg_num = total / len(input_elements)
    print(f"Average is: {avg_num}")

if __name__ == "__main__":

    # function calls
    input_elements = input_values()
    min = minimum(input_elements)
    avg = average(input_elements)
    