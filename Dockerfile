FROM debian:testing

RUN apt-get update && apt-get install -y dumb-init curl xz-utils

COPY ipplan-cron.sh /usr/local/bin/
RUN mkdir /etc/ipplan

ENV IPPLAN_USERNAME my_user
ENV IPPLAN_PASSWORD my_password
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/usr/local/bin/ipplan-cron.sh"]
