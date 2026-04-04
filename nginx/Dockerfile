FROM nginx:1.27-alpine

RUN rm /etc/nginx/conf.d/default.conf

# Allow nginx to run as non-root:
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid


COPY nginx.conf /etc/nginx/nginx.conf

USER nginx

EXPOSE 80