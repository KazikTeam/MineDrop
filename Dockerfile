FROM nginx:alpine

RUN apk add --no-cache gettext

COPY index.html.template globals.css global.css style.css /usr/share/nginx/html/
COPY *.png /usr/share/nginx/html/
COPY *.woff /usr/share/nginx/html/
COPY video.mp4 /usr/share/nginx/html/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh \
  && rm -f /usr/share/nginx/html/index.html

ENTRYPOINT ["/docker-entrypoint.sh"]
