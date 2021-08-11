FROM arm32v7/node

WORKDIR /app
COPY . .
RUN npm i
RUN npm t
