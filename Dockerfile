# stage 1
From node:latest as node 
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
# stage 2
FROM nginx:latest
COPY --from=node /app/dist/my-app-angular /usr/share/nginx/html