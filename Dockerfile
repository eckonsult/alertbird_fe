FROM node:14 As Production
ENV NODE_ENV = production 
WORKDIR /alertbird_fe
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
EXPOSE 3000
EXPOSE 443
RUN npm run build
CMD ["sh", "-c", "npm run start:production"]