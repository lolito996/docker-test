# Proyecto React - Rick & Morty

Autor: **Alejandro Muñoz**



## Cómo construir y desplegar con Docker y GitHub Actions

### 1. Construir la imagen Docker

El proyecto incluye un `Dockerfile` multi-stage para construir y servir la aplicación con Nginx.

**Pasos para construir la imagen localmente:**

```bash
docker build -t <tu_usuario_dockerhub>/ricky-morty-test:latest .
```

**Para correr el contenedor:**

```bash
docker run -p 80:80 <tu_usuario_dockerhub>/ricky-morty-test:latest
```

---

### 2. Automatización con GitHub Actions

El flujo de trabajo (`.github/workflows/docker-image.yml`) construye y sube la imagen a Docker Hub automáticamente al hacer push a la rama `main`.

#### Pasos del workflow:

1. **Checkout**
   - Descarga el código fuente del repositorio.
   ```yaml
   - name: Checkout code
     uses: actions/checkout@v3
   ```

2. **Docker set up buildx**
   - Configura Docker Buildx para builds avanzados y multiplataforma.
   ```yaml
   - name: Set up Docker Buildx
     uses: docker/setup-buildx-action@v3
   ```

3. **Docker login**
   - Inicia sesión en Docker Hub usando secretos de GitHub (`DOCKER_USERNAME` y `DOCKER_PASSWORD`).
   ```yaml
   - name: Log in to DockerHub
     uses: docker/login-action@v3
     with:
       username: ${{ secrets.DOCKER_USERNAME }}
       password: ${{ secrets.DOCKER_PASSWORD }}
   ```

4. **Docker Build and push**
   - Construye la imagen y la sube a Docker Hub.
   ```yaml
   - name: Build and push Docker image
     uses: docker/build-push-action@v5
     with:
       context: .
       push: true
       tags: ${{ secrets.DOCKER_USERNAME }}/ricky-morty-test:latest
   ```

#### Notas importantes

- Debes crear los secretos `DOCKER_USERNAME` y `DOCKER_PASSWORD` en la configuración de tu repositorio en GitHub (Settings > Secrets and variables > Actions).
- El repositorio de Docker Hub debe existir y tu usuario debe tener permisos de push.

---

## Scripts disponibles

- `npm start` - Ejecuta la app en modo desarrollo.
- `npm test` - Ejecuta los tests.
- `npm run build` - Construye la app para producción.

---



# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).
hi

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)
