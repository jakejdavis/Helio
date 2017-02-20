gunicorn app:app -w10 --certfile=server.crt --keyfile=domain.key -b 0.0.0.0:5000
