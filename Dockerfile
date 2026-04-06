# Use Eclipse Temurin, which is the modern standard for OpenJDK
FROM eclipse-temurin:17-jdk

# Set the working directory
WORKDIR /app

# Copy the Java source file
COPY a.java .

# Compile the code
RUN javac a.java

# Run the program
CMD ["java", "a"]