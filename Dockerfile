FROM winamd64/hello-world As Production
ENV NODE_ENV = production 
WORKDIR /usr/src/api
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY . .
RUN npm run build
CMD ["sh", "-c", "npm run start:production"]