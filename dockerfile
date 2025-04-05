FROM python:3.9-slim

#Set environment variables to prevent Python from writing .pyc files and to buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# copy only the required files 
COPY requirements.txt . /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

#Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

#Expose the port th app runs on
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]