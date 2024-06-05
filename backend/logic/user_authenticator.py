from database.database import Database
from logic.password_processor import PasswordProcessor

class UserAuthenticator:

    def __init__(self):
        self._database = Database()

    def authenticate_login(self, login, password):
        password_processor = PasswordProcessor()

        user = self._database.get_user_by_login(login)

        if password_processor.hash_password(password) == user.password:
            return True
        else:
            return False

    def register_user(self, user):
