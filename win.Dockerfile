FROM mcr.microsoft.com/windows/servercore:1803 as installer

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference='silentlyContinue';"]

RUN Invoke-WebRequest -OutFile nodejs.zip -UseBasicParsing "https://nodejs.org/dist/latest-v14.x/node-v14.17.5-win-x64.zip"
RUN Expand-Archive nodejs.zip -DestinationPath C:\
RUN Rename-Item "C:\\node-v14.17.5-win-x64" c:\nodejs

FROM mcr.microsoft.com/windows/nanoserver:1803

WORKDIR C:\nodejs
COPY --from=installer C:\nodejs\ .
RUN SETX PATH C:\nodejs
RUN npm config set registry https://registry.npmjs.org/

WORKDIR /app

WORKDIR /app
COPY COPY . /app/
RUN npm install

CMD ["npm", "t"]
