class User:

    def __init__(self, _id, _name, _surname, _email, _phone, _password):
        self.id = _id
        self.name = _name
        self.surname = _surname
        self.email = _email
        self.phone = _phone
        self.password = _password

    def get_id(self):
        return self.id

    def get_name(self):
        return self.name

    def get_surname(self):
        return self.surname

    def get_email(self):
        return self.email

    def get_phone(self):
        return self.phone

    def get_password(self):
        return self.password