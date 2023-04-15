FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add cmake
RUN cd ./AnjayClient
RUN cmake --build . --target AnjayClient -j 6
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]