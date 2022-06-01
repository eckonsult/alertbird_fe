FROM winamd64/hello-world
WORKDIR /alertbird_fe
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm ","start"]