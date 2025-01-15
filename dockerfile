# Use official nginx image as base image
FROM nginx:alpine

# Set working directory to Nginx HTML folder
WORKDIR /usr/share/nginx/html

# Copy all website files to nginx html folder
COPY . .

# Expose port 80 for web access
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
