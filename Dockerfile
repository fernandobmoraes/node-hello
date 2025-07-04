# Choosing the base image of my container - Linux Alpine
FROM node:18-alpine

# Inside the linux container, i'll work on /usr/src/app folder
WORKDIR /usr/src/app

# Copy the file(s) to list the dependencies
COPY package*.json ./

# Installl dependencies
RUN npm install

# Copy rest of source code to here
COPY . .

# List the port the app will listen
EXPOSE 3000

# Default command to start the application, can be overridden
CMD ["npm", "start"]