from flask_talisman import Talisman
from flask import Flask, request

from database.database import Database

app = Flask(__name__)
Talisman(app)

database = Database()

@app.route('/get-all-movies')
def get_movies_to_continue_watching():
    return database.get_json_all_from_table("movies")


@app.route('/get-series-of-movie', methods=['POST'])
def get_series_of_movie():
    return database.get_json_series_of_movie(request.get_json()['movie_id'])

@app.route('/get-episodes-of-serie', methods=['POST'])
def get_episodes_of_serie():
    return database.get_json_episodes_of_serie(request.get_json()['serie_id'])

@app.route('/get-scrolls-of-episode', methods=['POST'])
def get_scrolls_of_episode():
    return database.get_json_scrolls_of_episode(request.get_json()['episode_id'])



if __name__ == '__main__':
    app.run(host='0.0.0.0')
