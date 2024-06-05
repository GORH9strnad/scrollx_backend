import json
import mysql.connector

from logic.entities.user import User
from logic.password_processor import PasswordProcessor


class Database:
    _instance = None

    def __new__(cls, *args, **kwargs):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls.conn_str = {
                "host": "localhost",
                "user": "scrollx",
                "password": "scrollx",
                "database": "scrollx"
            }

        return cls._instance

    def get_json_all_from_table(self, tablename):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        sql_query = f"SELECT * FROM {tablename}"
        cursor.execute(sql_query)

        rows = [dict(row) for row in cursor.fetchall()]
        data = json.dumps(rows)

        cnxn.close()
        return data

    def get_json_series_of_movie(self, movie_id):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        sql_query = "SELECT * FROM series WHERE movie_id = %s"
        cursor.execute(sql_query, (movie_id,))

        rows = [dict(row) for row in cursor.fetchall()]
        data = json.dumps(rows)

        cnxn.close()
        return data

    def get_json_episodes_of_serie(self, serie_id):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        sql_query = "SELECT * FROM episodes WHERE serie_id = %s"
        cursor.execute(sql_query, (serie_id,))

        rows = [dict(row) for row in cursor.fetchall()]
        data = json.dumps(rows)

        cnxn.close()
        return data

    def get_json_scrolls_of_episode(self, episode_id):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        sql_query = "SELECT * FROM scrolls WHERE episode_id = %s"
        cursor.execute(sql_query, (episode_id,))

        rows = [dict(row) for row in cursor.fetchall()]
        data = json.dumps(rows)

        cnxn.close()
        return data

    def get_user_by_login(self, login):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        sql_query = "SELECT * FROM users WHERE email = %s OR phone = %s"
        cursor.execute(sql_query, (login, login))

        result = cursor.fetchone()

        cnxn.close()

        if result is not None:
            return User(result[0], result[1], result[2], result[3], result[4], result[5])
        else:
            return None

    def create_new_user(self, user):
        cnxn = mysql.connector.connect(**self.conn_str)
        cursor = cnxn.cursor(dictionary=True)

        password_processor = PasswordProcessor()

        sql_query = "INSERT INTO users (name, surname, email, phone, password) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql_query, (user.name, user.surname, user.email, user.phone, password_processor.hash_password(user.password)))

        cnxn.commit()