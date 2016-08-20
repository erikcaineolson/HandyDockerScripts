# create_composition.py
import string
import random


# password generating method
def password_generator(size=24, chars=string.ascii_lowercase + string.ascii_uppercase + string.digits):
    return '' . join(random.choice(chars) for _ in range(size))


# set the default password and local file
defaultPassword = 'useASecurePasswordAndDontLeaveItInAVCSRepo'
localFilename = 'docker-compose.yml'

# read in the file
inputFile = open(localFilename, 'r')
fileData = inputFile.read()
inputFile.close()

# generate a new password (using the default values; you can change them here if you like, just pass different parameters to password_generator())
newFileData = fileData.replace(defaultPassword, password_generator())

outputFile = open(localFilename, 'w')
outputFile.write(newFileData)
outputFile.close()
