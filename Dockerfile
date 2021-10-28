FROM ubuntu:latest
LABEL maintainer="zainab.bhabhra"
RUN apt-get update -y && \
    apt-get install apt-transport-https ca-certificates wget gnupg -y && \
    wget -q -O - "https://repos.ripple.com/repos/api/gpg/key/public" | apt-key add - && \
    echo "deb https://repos.ripple.com/repos/rippled-deb focal stable" | tee -a /etc/apt/sources.list.d/ripple.list && \
    apt-get update -y && \
    apt-get install rippled -y && \
    rm -rf /var/lib/apt/lists/* && \
    export PATH=$PATH:/opt/ripple/bin/ && \
    chmod +x /usr/bin/server_info
RUN ln -s /opt/ripple/bin/rippled /usr/bin/rippled
EXPOSE 80 443 5005 6006 51235
