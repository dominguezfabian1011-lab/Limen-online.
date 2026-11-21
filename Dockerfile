FROM python:3.12-slim
WORKDIR /app
COPY LIMEN_SOURCE.zip /tmp/limen-source.zip
RUN python -m zipfile -e /tmp/limen-source.zip /app \
    && pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /app/data
ENV PYTHONUNBUFFERED=1
ENV LIMEN_DB_PATH=/app/data/limen.sqlite3
EXPOSE 8000
CMD ["sh", "-c", "exec uvicorn server:app --host 0.0.0.0 --port ${PORT:-8000} --workers 1"]
