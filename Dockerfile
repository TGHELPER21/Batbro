# Use Python 3.9.7 slim-buster as the base image
FROM python:3.9.7-slim-buster

# Update and install necessary packages
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
       gcc \
       libffi-dev \
       musl-dev \
       ffmpeg \
       aria2 \
       python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Set the working directory to /app
WORKDIR /app

# Copy all files from the current directory to the working directory
COPY . .

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Expose the port on which the application will run
EXPOSE 5000

# Command to run the application
CMD ["python3", "main.py"]
