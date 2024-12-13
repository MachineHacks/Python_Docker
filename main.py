# main.py
import importlib.util
from flask import Flask

# Function to dynamically load a Python script
def source(file_path):
    spec = importlib.util.spec_from_file_location("module.name", file_path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module

# Dynamically load Python scripts (similar to source in R)
source("/app/app_raw.py")
# Uncomment and add more sources if needed
# source("/app/Test.py")
# source("/app/Testing.py")

# Initialize Flask application
app = Flask(__name__)

# Define a simple route to confirm the server is running
@app.route("/")
def home():
    return "The Python API is running!"

# Run the Flask app
if __name__ == "__main__":
    app.run(port=5000, host="0.0.0.0")
