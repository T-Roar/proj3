# Stage 1: Build the Node.js app
FROM node:14 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2: Create a minimal production image
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy the built website from the previous stage
COPY --from=builder /app .

# Expose the default port
EXPOSE 80

# Command to run the web server
CMD ["nginx", "-g", "daemon off;"]
