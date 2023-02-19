FROM python:3.10.1-slim-buster

RUN set -ex \
    && apt-get -qq update && apt-get -qq -y dist-upgrade \
    && apt-get -qq -y install --no-install-recommends locales python3-lxml python3-pip python3-dev libc-ares-dev libcrypto++-dev libcurl4-openssl-dev libmagic-dev libsodium-dev libsqlite3-dev libssl-dev git aria2 curl ffmpeg jq p7zip-full pv gcc libpq-dev unzip wget

WORKDIR /usr/src/app
RUN set -ex \
    && wget -q https://github.com/rahulkhatri137/mirrorbot137/releases/download/customised/cbot.zip \
    && unzip -q *zip \
    && rm -f *.zip
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt
RUN chmod 777 /usr/src/app
RUN chmod +x aria.sh

CMD ["python3", "-m" "bot"]
