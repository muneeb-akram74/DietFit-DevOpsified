# Use Flutter base image
FROM ghcr.io/cirruslabs/flutter:3.24.2 AS build

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Enable web support (if needed)
RUN flutter config --enable-web

# Install dependencies
RUN flutter pub get

# Build the Flutter web app
RUN flutter build web

# Use Nginx to serve the Flutter app
FROM nginx:alpine

# Remove default Nginx HTML files
RUN rm -rf /usr/share/nginx/html/*

# Copy the built Flutter web app to Nginx HTML directory
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
