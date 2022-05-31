FROM node:18-alpine3.14
WORKDIR /alertbird_fe
ENV PATH="./node_modules/.bin:$PATH"
COPY . .
RUN npm run build
CMD ["npm ","start"];