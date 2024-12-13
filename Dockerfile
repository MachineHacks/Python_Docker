# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /usr/src/app
COPY app_raw.py /app/app_raw.py

# Install any Python dependencies specified in requirements.txt
# If no requirements.txt, this line can be omitted or ensure a dummy file exists
RUN pip install --no-cache-dir -r requirements.txt || echo "No requirements.txt found"

# Expose the port the app runs on
EXPOSE 8000

# Define environment variables (optional)
ENV PYTHONUNBUFFERED=1

# Command to run the application
CMD ["python", "/app/app_raw.py"]
