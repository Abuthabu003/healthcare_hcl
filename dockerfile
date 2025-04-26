# Use an official Node.js base image
FROM node:20

# Create app directory
WORKDIR /healthcare_hcl

# Copy package.json and package-lock.json into the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source code inside Docker image
COPY appointment-service.js/ /healthcare_hcl/appointment-service.js
COPY patient-service.js/ /healthcare_hcl/patient-service.js

# Expose your app port (optional, depends on app)
EXPOSE 3000

# Run the app
CMD ["npm", "start"]
