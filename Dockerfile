# Base Python image
FROM python:3.10-slim

# Working directory inside container
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py .

# Expose port 8000
EXPOSE 8000

# Use a minimal entrypoint and CMD
ENTRYPOINT ["python"]
CMD ["app.py"]

