FROM harshpreets63/random:simple

WORKDIR /usr/src/app
COPY . .

RUN set -ex \
    && chmod 777 /usr/src/app \ 
    && cp .netrc /root/.netrc \
    && chmod 600 /root/.netrc \
    && cp extract pextract /usr/local/bin \
    && chmod +x aria.sh /usr/local/bin/extract /usr/local/bin/pextract
RUN git clone https://github.com/rahulkhatri137/mirrorbot137 -b hrk .
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

CMD ["bash", "start"]
