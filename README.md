Also on dockerhub:

https://hub.docker.com/r/donuk/basicauth

Proxy example.com with self signedssl:

```
docker run -p 443:443 -e BACKEND=example.com --rm donuk/selfsignedhttpsproxy
```
