# BUILDER PHASE
# Only output needed is the content of the build folder
FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
