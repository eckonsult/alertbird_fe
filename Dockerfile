FROM stefanscherer/node-windows
# Override the base log level (info).
ENV NPM_CONFIG_LOGLEVEL warn
# Expose port for service
EXPOSE 80
# Install and configure `serve`.
RUN npm install -g serve

# Copy source code to image
COPY . .

# Install dependencies
RUN npm install

# Build app and start server from script
CMD [ "npm", "start" ]
