# Atlassian Confluence Docker

## Run

`mkdir -p /tmp/confluence-app /tmp/confluence-psql`

```
docker rm confluence-db
docker run \
--name confluence-db \
-e POSTGRES_USER=confluence \
-e POSTGRES_DB=confluence \
-e POSTGRES_PASSWORD=test123 \
-p 5432:5432 \
-v /tmp/confluence-psql:/var/lib/postgresql/data \
docker.io/postgres:9.5
```

```
docker rm confluence-app
docker run \
--name confluence-app \
-e HOSTNAME=localhost \
-e SCHEMA=http \
-e PORT=8080 \
-p 8780:8780 \
-v /tmp/confluence-app:/var/lib/confluence \
--link confluence-db:confluence-db \
docker.io/bborbe/atlassian-confluence:6.3.1-1.0.5
```

Open http://localhost:8780

Database-Setup:
User: confluence
Pass: test123
Host: confluence-db

## Version Schema

CONFLUENCEVERISON-BUILDVERSION

6.3.1-1.0.0 = Confluence 6.3.1 and Buildscripts 1.0.0
