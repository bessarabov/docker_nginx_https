# Sample Docker configs to run https site in nginx

Building image:

    docker build --tag sample_nginx_https .

Runnig:

    docker run \
        --rm \
        --publish 1443:443 \
        sample_nginx_https

Then open https://127.0.0.1:1443 (where 127.0.0.1 is the ip address of your
Docker VM)
