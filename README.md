# Docker Deep Learning - 2019

Se provee un ambiente Docker listo para utilizar, con las siguientes herramientas/librerias instaladas:
  - Python3 (3.6.8)
  - Jupyter Core (4.5.0)
  - Jupyter Notebook (5.7.8)
  - Tensorflow (1.14.0)
  - ipython (7.5.0)
  - numpy (1.16.4)
  - matplotlib (3.1.0)
  - keras (2.3.0)
  - pip (manejador de dependencias para Python)

## Requisitos

  - [Docker](https://www.docker.com/)
  - [docker-compose](https://docs.docker.com/compose/)
  - [git](https://git-scm.com/)

## Setup

1. Clonar el repositorio

```sh
  git clone https://github.com/ortuagustin/deeplearning-docker
  cd deeplearning-docker
```

2. Configurar las variables de entorno; para ello, crear un archivo `.env` y asignar los valores deseados; se puede tomar como partida el archivo `.env.example` provisto: `cp .env.example .env`. Ver [variables de entorno](#variables-de-entorno).
3. Construir y levantar los contenedores: `docker-compose up -d --build`. El contenedor va a instalar con `pip` las dependencias indicadas en el archivo `requirements.txt` en la raiz del repositorio.

> Notar que el nombre del contenedor es creado es `tf` (ver `docker-compose.yml`).

4. Jupyter Notebook queda levantado en http://localhost:`{JUPYTER_NOTEBOOK_PORT}`. Por defecto, http://localhost:8888.
5. Ver más [comandos útiles](#comandos-utiles).

## Variables de entorno

Las variables de entorno utilizadas por el contenedor se definen en archivos `.env` como es habitual al utilizar docker. Para ello, debemos crear un archivo `.env` en el directorio raíz del repositorio y asignar los valores deseados a las variables de entorno.

Hay dos variables para configurar:
  - `JUPYTER_NOTEBOOK_PORT`: Puerto en el que corre jupyter notebook (con el que luego se accede por el navegador). Por defecto es `8888`.
  - `WORK_DIR`: directorio mapeado dentro del contenedor mediante un volúmen. Dentro del contenedor, el directorio es `/tf`. El direcorio por defecto que se mapea es la carpeta `work` de este repositorio.

Se provee un archivo `.env.example` que se puede utilizar como punto de partida:

```sh
  cp .env.example .env
```

## Comandos utiles

**Construir los contenedores (primera vez o cuando hay cambios):**

```sh
  docker-compose build && docker-compose up -d
```

ó, alternativamente:

```sh
  docker-compose up -d --build
```

**Levantar los contenedores:**

```sh
  docker-compose up -d
```

> Verificar que estén levantados usando: `docker-compose ps`

**Detener los contenedores:**

```sh
  docker-compose down
```

**Abrir una terminal bash dentro del contenedor:**

```sh
  docker-compose exec tf bash
```

**Abrir una terminal interactiva python dentro del contenedor:**

```sh
  docker-compose exec tf python3
```

## Problemas comunes

1. En Linux, para no tener que usar `sudo` en los comandos de *docker*, hay que agregar al usuario al grupo `docker`:

```sh
  sudo usermod -aG docker $USER
```

> Es necesario deslogearse para que los cambios tomen efecto.

2. Asegurarse que el servicio *docker* está corriendo. En Linux:

```sh
  # con systemctl
  sudo systemctl start docker

  # ó, con service
  sudo service docker start
```

## Referencias

- https://www.tensorflow.org/install/docker
