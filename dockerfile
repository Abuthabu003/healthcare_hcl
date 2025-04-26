# Use the official Node.js image
FROM node:20

# Create and set working directory inside the container
WORKDIR /app

# Install dependencies
RUN npm install

# Copy package.json and package-lock.json first
COPY package.json/ /app/package.json


# Copy all source code into the container
COPY appointment-service.js/ /app/appointment-service.js
COPY patient-service.js/ /app/patient-service.js

# Expose the app port (optional, example: 3000)
EXPOSE 8000

# Run the app
CMD ["npm", "patient-service.js", "appointment-service.js"]
