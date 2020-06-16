# Packaging the app as Docker container

## Creating a Docker image

Make sure you are in the `my_node_app` directory

`touch Dockerfile`{{execute}}

Open the `my_node_app/Dockerfile`{{open}} in the editor. Here we need to add the following code 

<pre class="file" data-filename="my_node_app/Dockerfile" data-target="replace">
FROM node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
</pre>

Create a `my_node_app/.dockerignore`{{open}} file in the same directory with following code

<pre class="file" data-filename="my_node_app/.dockerignore" data-target="replace">
node_modules
npm-debug.log
</pre>

Build the docker image

Run the following command to build the Docker image. The `-t` flag lets you tag your image so it's easier to find later using the docker images command

`docker build -t knowledgehut/my-docker-node-app:v1 .`{{execute}}

Your image will now be listed by Docker:

```bash
docker images

# Example
REPOSITORY                          TAG        ID              CREATED
node                                12         1934b0b038d1    5 hours ago
knowledgehut/my-docker-node-app     latest     d64d3505b0d2    1 minute ago
```

## Run the image

`docker run -p 8282:8080 -d knowledgehut/my-docker-node-app:v1`{{execute}}
