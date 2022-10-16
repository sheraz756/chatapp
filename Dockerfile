FROM node:16 AS ui-build 
WORKDIR /usr/src/app
COPY client/ ./client/
RUN cd client && yarn && yarn run build

FROM node:16 as server
WORKDIR /root/

COPY --from=ui-build /usr/src/app/client/build ./client/build

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
RUN npm install

# Copy local code to the container image.
COPY . ./

RUN apt-get update && apt-get install -y ghostscript && apt-get install -y graphicsmagick && apt-get install -y poppler-utils

# Run the web service on container startup.
CMD [ "npm", "run", "start" ]