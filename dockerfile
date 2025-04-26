# Use the official Node.js image
FROM node:20

# Create and set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code into the container
COPY appointment-service.js/ /healthcare_hcl/appointment-service.js
COPY patient-service.js/ /healthcare_hcl/patient-service.js

# Expose the app port (optional, example: 3000)
EXPOSE 8000

# Run the app
CMD ["npm", "patient-service.js", "appointment-service.js"]
