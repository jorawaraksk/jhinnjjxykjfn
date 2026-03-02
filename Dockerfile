# Use an official Python runtime (Bookworm is the 2026 stable standard)
FROM python:3.10-slim-bookworm

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies and FFMPEG
# Fixed the syntax and combined commands for better layer caching
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    build-essential \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the bot code
COPY . .

# Start the bot
# Note: Ensure your main file is actually named 'bot.py' or in a folder named 'bot'
CMD ["python3", "bot.py"]
