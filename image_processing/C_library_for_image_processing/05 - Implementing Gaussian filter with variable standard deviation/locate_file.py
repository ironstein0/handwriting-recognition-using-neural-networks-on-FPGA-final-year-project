
def locate_file() : 
    working_directory = ''
    for element in __file__.split('/')[:-1] : 
        working_directory += element + '/'
    return working_directory