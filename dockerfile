# Use the official ASP.NET Core SDK image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory in the container
WORKDIR /app

# RUN dotnet build
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    unzip \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -  


# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y && \
    rm google-chrome-stable_current_amd64.deb
# Copy the project file and restore dependencies
COPY . .
RUN dotnet restore

# Copy the remaining source code and build the project
RUN dotnet build --no-restore -c Release

CMD ["dotnet", "test", "--no-build", "--logger:trx"]