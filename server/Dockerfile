# Use the official Python image with tag 3.10-alpine3.15 as the base image
FROM python:3.10-alpine3.15

LABEL MAINTAINER "Maya Ashkinazi <maya01911@gmail.com>"

# Upgrade pip
RUN pip install --upgrade pip

# Install the python-dotenv package
RUN python3.10 -m pip install python-dotenv

# Install pymongo with the srv extra
RUN python3.10 -m pip install "pymongo[srv]"

# Add a non-root user "appuser"
RUN adduser -D appuser

# Copy the .env file into the container
COPY --chown=appuser:appuser ./server/.env .env

# Set the working directory and user in the container
USER appuser
WORKDIR /home/appuser

# Add the user's local binary path to the PATH environment variable
ENV PATH="/home/appuser/.local/bin:${PATH}"

# Copy the requirements.txt file into the container
COPY --chown=appuser:appuser requirements.txt requirements.txt

# Install Python dependencies using the user's local pip
RUN pip install --user -r requirements.txt

# Copy the application files into the container
COPY --chown=appuser:appuser . .

# Specify the command to run the Flask app
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
