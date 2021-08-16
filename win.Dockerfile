FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='silentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/latest-v14.x/node-v14.17.5-win-x64.zip";
RUN Expand-Archive -Path nodejs.zip -DestinationPath C:\;
RUN Rename-Item -Path "C:\\node-v14.17.5-win-x64" -NewName C:\nodejs;

RUN SETX PATH C:\nodejs
RUN npm config set registry https://registry.npmjs.org/

WORKDIR /app

WORKDIR /app
COPY . /app/
RUN npm install

CMD ["npm", "t"]
