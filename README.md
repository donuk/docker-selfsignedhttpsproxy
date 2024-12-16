Also on dockerhub:

https://hub.docker.com/r/donuk/basicauth

Proxy hub.docker.com with self signedssl:

```
docker run -p 80:80 -e BACKEND=hub.docker.com -e DOMAIN=hub.docker.com --rm donuk/selfsignedhttpsproxy
```
