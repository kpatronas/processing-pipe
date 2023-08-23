FROM ubuntu:latest
RUN apt update&& apt install -y inotify-tools imagemagick
WORKDIR /app
RUN mkdir /app/input /app/output /app/configuration
COPY file_processing.sh /app/
RUN chmod +x /app/file_processing.sh
CMD ["/app/file_processing.sh"]
