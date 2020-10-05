FROM klakegg/hugo:0.73.0-ext-ubuntu

#install aws cli
RUN true \
    && apt-get update \
    && apt-get install -y awscli \
    && aws --version \
    && mkdir /tmp/.aws \
    true

#configure cli
COPY config.ini /tmp/.aws/config

COPY start.sh /tmp/start.sh
ENTRYPOINT [ "/bin/bash", "/tmp/start.sh"]
