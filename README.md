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

## Copyright and license

    Copyright (c) 2016, Benjamin Borbe <bborbe@rocketnews.de>
    All rights reserved.
    
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:
    
       * Redistributions of source code must retain the above copyright
         notice, this list of conditions and the following disclaimer.
       * Redistributions in binary form must reproduce the above
         copyright notice, this list of conditions and the following
         disclaimer in the documentation and/or other materials provided
         with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
