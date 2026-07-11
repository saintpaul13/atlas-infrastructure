FROM python:3.12-slim

WORKDIR /app

COPY server.py .

RUN pip install psutil

EXPOSE 8000

CMD ["python3", "server.py"]
