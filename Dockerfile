FROM node:14 As Production
ENV NODE_ENV = production 
WORKDIR /alertbird_fe
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["sh", "-c", "npm run start:production"]