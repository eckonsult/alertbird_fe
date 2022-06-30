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

#FROM node:15.3-alpine
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh
#RUN apt-get update && apt-get install -y curl && apt-get -y autoclean
#ENV NVM_DIR /usr/local/nvm
#ENV NODE_VERSION 4.4.7
#RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

#WORKDIR /alertbird_fe
#ENV PATH="./node_modules/.bin:$PATH"
#COPY package.json .
#COPY package-lock.json .
#RUN source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default

#RUN npm install
#COPY . .
#EXPOSE 443
#RUN npm run build
#CMD ["npm","start"];
FROM debian:latest

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

