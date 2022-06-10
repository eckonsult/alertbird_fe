FROM docker:22.06.0-beta.0-alpine3.16
WORKDIR /alertbird_fe
ENV PATH="./node_modules/.bin:$PATH"
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build
CMD ["npm", "start"]

