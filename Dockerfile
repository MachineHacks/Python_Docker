# Use Python 3.7-slim as the base image
FROM python:3.7-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application script to the container
COPY main.py /app/main.py

# Add requirements for Flask and Requests
RUN echo "Flask==2.2.5\nrequests==2.31.0" > requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port the Flask app will run on
EXPOSE 8000

# Define environment variables (optional)
ENV PYTHONUNBUFFERED=1

# Command to run the Flask application
CMD ["python", "/app/main.py"]
