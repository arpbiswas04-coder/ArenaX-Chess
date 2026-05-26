# Use nginx:alpine as the base image for a fast, lightweight container
FROM nginx:alpine

# Copy the custom nginx.conf to replace the default Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy the static web application files into the Nginx serving directory
COPY index.html /usr/share/nginx/html/
COPY *.mp3 /usr/share/nginx/html/

# Expose port 8080 (Google Cloud Run default port)
EXPOSE 8080

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
