########################################################################################
# Description: Prepare datasets for training from raw data
#              The raw data contains multiple pairs of lines of the following format:
#              "filename_for_X,error,sum_of_error,error_difference"
#              "filename_for_Y,stick_position_of_user,0"
#
#              For example:
#              "X_x.csv,0.432147,172.051,-0.0388697"
#              "Y_x.csv,1428,0"
#
# Input: "raw_data.txt"
# Output: X and Y csv files for each axis
########################################################################################

def sameSign(x, y):
    return (x >= 0) ^ (y < 0)

def write_to_file(filename, string):
    with open("Dataset/" + filename, "a+") as myfile:
        myfile.write(string)


def main():
    with open("Dataset/raw_data.txt", "r") as datafile:
        lines = datafile.readlines()
        for i in range(0, len(lines), 2):
            parts_of_X = lines[i].split(',')
            parts_of_Y = lines[i + 1].split(',')

            # Adjust the offset of idle stick position to make it centered at 0
            stick_offset = 1500
            stick_value = int(parts_of_Y[1]) - stick_offset
            error_value = float(parts_of_X[1])

            # Filter out bad data
            if (stick_value != 0 and sameSign(stick_value, error_value)):
                write_string = lines[i][len(parts_of_X[0]) + 1:]
                write_to_file(parts_of_X[0], write_string)
                write_string = str(stick_value) + "\n"
                write_to_file(parts_of_Y[0], write_string)
    print('Done.')

main()