FROM nginx:latest
##ADD index.html /usr/share/nginx/html
COPY ./index.html /usr/share/nginx/html/index.html
