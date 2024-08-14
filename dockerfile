# Use the official ASP.NET Core SDK image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project file and restore dependencies
COPY . .
RUN dotnet restore

# Copy the remaining source code and build the project
# COPY . .
RUN dotnet publish -c Release -o out
# RUN dotnet build

# Use the official ASP.NET Core runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0

# Install Chrome and ChromeDriver
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    unzip \
    && wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - 
    # && sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
    # && google-chrome-stable \
    # && CHROME_DRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) \
    # && wget -N https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip -P ~/ \
    # && unzip ~/chromedriver_linux64.zip -d ~/ \
    # && rm ~/chromedriver_linux64.zip \
    # && mv -f ~/chromedriver /usr/local/bin/chromedriver \
    # && chown root:root /usr/local/bin/chromedriver \
    # && chmod 0755 /usr/local/bin/chromedriver
WORKDIR /app
COPY --from=build /app/out .

# RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
#     dpkg -i google-chrome-stable_current_amd64.deb || apt-get -f install -y && \
#     rm google-chrome-stable_current_amd64.deb

ENTRYPOINT ["dotnet","/out/seleinum_tests.dll"]
