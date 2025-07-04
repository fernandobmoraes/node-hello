# Choosing the base image of my container - Linux Alpine
FROM node:18-alpine

# Crete nonroot user
RUN addgroup -S nonroot && adduser -S nonroot -G nonroot

# Inside the linux container, i'll work on /usr/src/app folder
WORKDIR /usr/src/app

# Copy the file(s) to list the dependencies
COPY package.json package-lock.json ./

# Installl dependencies
RUN npm install

# Copy rest of source code to here
COPY index.js ./

# Change it to nonroot user
USER nonroot

# List the port the app will listen
EXPOSE 3000

# Default command to start the application, can be overridden
CMD ["npm", "start"]