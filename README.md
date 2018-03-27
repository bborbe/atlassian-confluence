# Atlassian Confluence Docker

## Run

```bash
mkdir -p /tmp/confluence-app /tmp/confluence-psql
```

```bash
docker rm confluence-db
docker run \
--name confluence-db \
-e POSTGRES_USER=confluence \
-e POSTGRES_DB=confluence \
-e POSTGRES_PASSWORD=test123 \
-p 5432:5432 \
-v /tmp/confluence-psql:/var/lib/postgresql/data \
docker.io/postgres:9.6
```

```bash
docker rm confluence-app
docker run \
--name confluence-app \
-e HOSTNAME=localhost \
-e SCHEMA=http \
-e PORT=8080 \
-p 8080:8080 \
-v /tmp/confluence-app:/var/lib/confluence \
--link confluence-db:confluence-db \
docker.io/bborbe/atlassian-confluence:6.8.0-1.2.1
```

Open [http://localhost:8080](http://localhost:8080)

Database-Setup:

* Host: confluence-db
* Port 5432
* Database: confluence
* User: confluence
* Pass: test123

## Version Schema

CONFLUENCEVERISON-BUILDVERSION

6.8.0-1.2.1 = Confluence 6.8.0 and Buildscripts 1.2.1
