FROM node:alpine as builder
WORKDIR "usr/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
# we do not have to start up the nginx it will start by default.
# this production version has no dependencies to run any test suit, because this is production version.

