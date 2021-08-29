FROM registry.access.redhat.com/ubi8/ubi-minimal

RUN microdnf install python3.8 && \
    pip3 install -U pip && \
    pip3 install ansible-core ansible-runner

COPY ansible /ansible/
COPY entrypoint /usr/local/bin/
ENTRYPOINT [ "entrypoint" ]
