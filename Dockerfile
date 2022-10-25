FROM node:16-alpine
RUN apk update && apk add  build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN mkdir /opt/app
WORKDIR /opt/app
COPY ./package.json ./yarn.lock ./
ENV PATH /opt/app/node_modules/.bin:$PATH
RUN yarn  
RUN mkdir ./public && mkdir ./public/uploads
COPY ./ .
RUN yarn build
CMD ["yarn", "develop"]
EXPOSE 1337
