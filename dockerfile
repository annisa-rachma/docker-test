# Start from a Node.js 10 (LTS) image 
# FROM node:10
FROM node:12-alpine as build_image
# Specify the directory inside the image in which all commands will run 
WORKDIR /usr/src/app
# Copy package files and install dependencies 
COPY package*.json ./
RUN npm install
# Copy all of the app files into the image 
COPY . .

LABEL org.opencontainers.image.source=https://github.com/annisa-rachma/docker-test

# FROM node:12-alpine
# # copy from build image
# COPY --from=build_image /usr/src/app/dist ./dist
# COPY --from=build_image /usr/src/app/node_modules ./node_modules

# The default command to run when starting the container 
CMD [ "npm", "start" ]
