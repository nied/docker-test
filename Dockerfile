FROM microsoft/dotnet:1.0.0-preview1

# We need node for server-side rendering
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -qqy nodejs

# Copy the app
COPY . /app
WORKDIR /app

# Configure the listening port to 5000
ENV ASPNETCORE_URLS http://*:5000
EXPOSE 5000

# Restore packages
RUN ["dotnet", "restore"]

# Run it!
ENTRYPOINT ["dotnet", "run"]
