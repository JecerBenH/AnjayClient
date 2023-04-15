FROM amd64/alpine:3.17.3
RUN apk update  \
    && apk add cmake \
    && mkdir app \
    &&  cmake --build ./app --target AnjayClient -j 6 \
    && cd ./LwClient/cmake-build-debug
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]