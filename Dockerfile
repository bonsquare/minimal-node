FROM alpine

# install the node with the smallest capacity possible
RUN apk add --no-cache libstdc++
COPY --from=node:lts-alpine /usr/local/include/node /usr/local/include/node
COPY --from=node:lts-alpine /usr/local/bin/node /usr/local/bin/node
ENTRYPOINT ["/usr/local/bin/node"]
