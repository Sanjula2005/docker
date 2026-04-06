# # Use Eclipse Temurin, which is the modern standard for OpenJDK
# FROM eclipse-temurin:17-jdk

# # Set the working directory
# WORKDIR /app

# # Copy the Java source file
# COPY a.java .

# # Compile the code
# RUN javac a.java

# # Run the program
# CMD ["java", "a"]
# Use the lightweight Nginx image
FROM nginx:alpine

# Remove the default nginx html files
RUN rm -rf /usr/share/nginx/html/*

# Copy your local HTML files to the Nginx server directory
# If your file is index.html, it will now be served
COPY . /usr/share/nginx/html/

# Nginx runs on port 80 by default
EXPOSE 80