#FROM node:14 As Production
#ENV NODE_ENV = production 
#WORKDIR /alertbird_fe
#COPY package.json .
#COPY package-lock.json .
#RUN npm install
#COPY . .
#EXPOSE 3000
#EXPOSE 443
#RUN npm run build
#CMD ["sh", "-c", "npm run start:production"]

FROM node:15.3-alpine
WORKDIR /alertbird_fe
ENV PATH="./node_modules/.bin:$PATH"
COPY package.json .
COPY package-lock.json .
RUN apt-get update && apt-get install -y curl && apt-get -y autoclean
#RUN npm install
COPY . .
EXPOSE 443
RUN npm run build
CMD ["npm","start"];

