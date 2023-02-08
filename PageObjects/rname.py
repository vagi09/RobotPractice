import random
import string


def generate_random_username():
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for i in range(8))



def generate_random_email():
    letters = string.ascii_letters + string.digits
    email_id = ''.join(random.choice(letters) for i in range(8))
    return email_id + "@gmail.com"



print(generate_random_username())
print(generate_random_email())
