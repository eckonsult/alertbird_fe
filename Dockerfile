FROM node:alpine As Production
ENV NODE_ENV = production
WORKDIR /alertbird_fe
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
EXPOSE 443
RUN npm run build
CMD ["sh", "-c", "npm run start"]