
FROM python:3.12-slim

# Metadata
LABEL maintainer="Effective Mobile Test Task"
LABEL description="Simple Python HTTP backend"


WORKDIR /app

RUN groupadd --system appgroup && \
    useradd --system --gid appgroup --no-create-home appuser


COPY app.py .

RUN chown appuser:appgroup app.py

EXPOSE 8080

USER appuser

# Health check: verifies the server responds on /
HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=3 \
    CMD python3 -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/')" || exit 1

CMD ["python3", "app.py"]