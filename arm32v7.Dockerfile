FROM arm32v7/node:14

WORKDIR /app
COPY . .
RUN npm i
CMD ["npm", "t"]
