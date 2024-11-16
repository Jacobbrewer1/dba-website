FROM node:alpine as build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM node:alpine

COPY --from=build . /app

WORKDIR /app

CMD ["npm", "start"]
