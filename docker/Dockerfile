FROM python:3.12-slim

# Prevent Python from creating .pyc files
# and ensure logs are sent directly to stdout/stderr.
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Create a non-root user for running the application.
RUN useradd --create-home --shell /usr/sbin/nologin appuser

# Install Python dependencies first for better Docker layer caching.
COPY app/requirements.txt ./requirements.txt

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application source code.
COPY app/ ./

# Give the application user ownership of the application directory.
RUN chown -R appuser:appuser /app

# Run the application as a non-root user.
USER appuser

EXPOSE 5000

# Container-level health check.
HEALTHCHECK --interval=30s \
            --timeout=5s \
            --start-period=10s \
            --retries=3 \
            CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/health')" || exit 1

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
