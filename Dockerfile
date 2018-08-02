FROM node:6.11

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .

RUN npm install --production

# Bundle app source
COPY . .

RUN npm run build

RUN npm run build:server

EXPOSE 3000

CMD ["npm", "run", "start:bundle"]
