gunicorn --access-logfile /app/logs/access.log --error-logfile /app/logs/error.log --certfile=origin.pem --keyfile=key.pem --worker-class gevent --bind 0.0.0.0:6969 config.wsgi:application
