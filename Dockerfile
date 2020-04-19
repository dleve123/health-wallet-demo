FROM node:13

ENV SERVER_BASE=relative
WORKDIR /usr/src/app

COPY package.json .
RUN npm install

RUN git clone https://github.com/decentralized-identity/sidetree
COPY src/ ./src
COPY tslint.json tsconfig.json ./
RUN find src
RUN npm run build
RUN $(npm bin)/parcel build ./src/*.html --out-dir dist/static

# Start
CMD [ "npm", "start" ]
EXPOSE 8080