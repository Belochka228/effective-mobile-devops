# ── Backend Dockerfile ──────────────────────────────────────────────────────
# Uses a slim Python image to minimise attack surface and image size.
# The application runs as an unprivileged user (appuser).
# ────────────────────────────────────────────────────────────────────────────

FROM python:3.12-slim

# Metadata
LABEL maintainer="Effective Mobile Test Task"
LABEL description="Simple Python HTTP backend"

# Set working directory
WORKDIR /app

# Create a non-root user/group for running the app
RUN groupadd --system appgroup && \
    useradd --system --gid appgroup --no-create-home appuser

# Copy application source
COPY app.py .

# Ensure the file is owned by appuser
RUN chown appuser:appgroup app.py

# Document the port the service listens on
EXPOSE 8080

# Switch to non-root user
USER appuser

# Health check: verifies the server responds on /
HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=3 \
    CMD python3 -c "import urllib.request; urllib.request.urlopen('http://localhost:8080/')" || exit 1

# Start the application
CMD ["python3", "app.py"]