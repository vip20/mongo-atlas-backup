FROM alpine:3.14
RUN apk add --no-cache mongodb
ADD main.sh /main.sh
RUN chmod +x /main.sh
ENTRYPOINT [ "/main.sh" ]