# Use an official Python runtime as a parent image
FROM python:3.8

# Set the working directory to the root directory
WORKDIR /

# Copy the requirements file into the container and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at the root directory
COPY . /

# Expose port 8080 for the uwsgi server
EXPOSE 8080

# Start the uwsgi server
CMD ["uwsgi", "--http", "0.0.0.0:8080", "--wsgi-file", "api.py", "--callable", "app", "--master", "--processes", "4", "--threads", "2"]