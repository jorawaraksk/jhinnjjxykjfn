# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster

# Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies and FFMPEG
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    build-essential \
    gcc \
    & \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the bot code
COPY . .

# Grant execute permission to the run script (if applicable)
RUN chmod +x run.sh

# Start the bot using the existing module structure
CMD ["python3", "-m", "bot"]
