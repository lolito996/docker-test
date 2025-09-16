# Etapa 1: build de la app con Node
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Etapa 2: servidor Nginx
FROM nginx:alpine

# Copiamos el build de React a la carpeta de Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Exponemos el puerto de Nginx
EXPOSE 80

# Arranca Nginx
CMD ["nginx", "-g", "daemon off;"]
