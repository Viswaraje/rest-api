# Example Dockerfile
FROM node:alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy only the necessary files for the application
COPY src ./src
COPY public ./public

# Expose port and start the application
EXPOSE 8080
CMD ["npm", "start"]
