FROM nginx:1.27.2

ENV DOMAIN=self-signed-ssl
ENV BACKEND=BACKEND-NOT-CONFIGURED
RUN apt-get update && apt-get install -y apache2-utils && apt-get clean
ADD ./setup-ssl-cert.sh /docker-entrypoint.d/99-setup-ssl-cert.sh
