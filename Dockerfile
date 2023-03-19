version: '1.0'
name: learn-api

# Backend service using Flask and uWSGI
backend:
  # Use Python 3.8
  python: '3.8'
  # Install dependencies and uWSGI
  build:
    # Install dependencies and uWSGI
    - pip install -r requirements.txt uwsgi
  start:
    # Upgrade the database
    # Start the Flask app with uWSGI
    - uwsgi --http :8080 --wsgi-file app.py --callable app --processes 4 --threads 2 --stats :9191

  # Specify the path to the SQLite database file
  envs:
    DATABASE_URL: 'sqlite:///data/users.db'


data:

   volumes:
      - ./data:/app/data