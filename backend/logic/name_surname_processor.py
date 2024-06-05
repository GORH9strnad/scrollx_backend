import re

class NameSurnameProcessor:

    def validate_name(self, name):
        pattern = r'^[A-Za-z .-]+$'

        if re.match(pattern, name) and len(name) <= 50:
            return True
        else:
            return False

    def validate_surname(self, surname):
        pattern = r'^[A-Za-z .-]+$'

        if re.match(pattern, surname) and len(surname) <= 50:
            return True
        else:
            return False