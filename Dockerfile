# Production environment build steps

# npm build
FROM node:alpine
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Copy npm build and run nginx
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html