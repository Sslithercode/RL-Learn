# Base image
FROM python:3.8

# Set work directory
WORKDIR /app

# Install dependencies
RUN pip install --upgrade pip
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the app code
COPY api.py /app/

# Expose the port
EXPOSE 8000

# Start the server using uwsgi
CMD ["uwsgi", "--http", "0.0.0.0:8000", "--wsgi-file", "api.py", "--callable", "app", "--master", "--processes", "4", "--threads", "2"]
