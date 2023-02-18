FROM python:latest

RUN set -ex \
    && apt-get -qq update && apt-get -qq -y dist-upgrade \
    && apt-get -qq -y install --no-install-recommends locales python3-lxml python3-pip python3-dev libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev git aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev unzip wget \
    && curl -fsSL https://github.com/jaskaranSM/megasdkrest/releases/download/v0.1/megasdkrest -o /usr/local/bin/megasdkrest && chmod +x /usr/local/bin/megasdkrest

WORKDIR /usr/src/app
RUN set -ex \
    && wget -q https://github.com/rahulkhatri137/mirrorbot137/archive/refs/tags/heroku.zip \
    && unzip -q *zip \
    && cp -frp mirrorbot137-heroku/* . && rm -rf mirrorbot137-heroku
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt
RUN set -ex \
    && chmod 777 /usr/src/app \ 
    && cp .netrc /root/.netrc \
    && chmod 600 /root/.netrc \
    && cp extract pextract /usr/local/bin \
    && chmod +x aria.sh /usr/local/bin/extract /usr/local/bin/pextract

CMD ["bash", "start"]
