# Build with the tag "dwp/handsonnode":
#   docker build -t dwp/handsonnode .
# Run "dwp/handsonnode" with port 8080 published and ./app linked to /opt/handsonnode/app:
#   docker run -d -p 8080:8080 --name web -v `pwd`/app:/opt/handsonnode/app dwp/handsonnode

# Base image is node 5.2
FROM node:5.2.0

# Add files/folders at current dir to /opt/nodejs-ex
ADD . /opt/nodejs-ex

# Install the dependencies in package.json
RUN npm install /opt/nodejs-ex

# Make port 8080 publishable to the host
EXPOSE 8080

# CD to /opt/nodejs-ex
WORKDIR /opt/nodejs-ex

# When run, by default use nodemon to run server.js
CMD [ "node", "server.js" ]
