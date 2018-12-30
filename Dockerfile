# builder PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run PHASE
FROM nginx
# to copy a file from a different phase
COPY --from=builder /app/build /usr/share/nginx/html

