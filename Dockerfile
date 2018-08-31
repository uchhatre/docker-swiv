FROM node:6.9
MAINTAINER uchhatre@gmail.com
EXPOSE 9090
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    git
COPY getready.sh /
RUN /getready.sh
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
