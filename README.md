# Alpine
Penultimate version (as per subject requirement): 3.21 (https://hub.docker.com/_/alpine/tags)

# Nginx service
Because the subject requires Nginx with TLSv1.2 or TLSv1.3 only, we also have to install `openssl` in order
to generate an SSL certificate and private key in order to enable HTTPS.
