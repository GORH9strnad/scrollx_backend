import re
from werkzeug.security import generate_password_hash

class PasswordProcessor:

    def validate_password(self, password):
        if len(password) <= 8:
            return False
        if not re.search(r'[A-Z]', password):
            return False
        if not re.search(r'[a-z]', password):
            return False
        if not re.search(r'[0-9]', password):
            return False
        if not re.search(r'[!@#$%^&*(),.?":{}|<>]', password):
            return False
        return True

    def hash_password(self, password):
        return generate_password_hash(password)