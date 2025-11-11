FROM node:18-alpine AS builder
WORKDIR /usr/src/app
COPY . .
RUN npm install -g parcel
RUN parcel build src/index.html --dist-dir dist

FROM nginx:alpine
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
