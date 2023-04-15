FROM amd64/alpine:3.17.3
RUN apk update  \
RUN apk add cmake \
RUN mkdir app \
RUN cmake --build ./app --target AnjayClient -j 6 \
RUN cd ./LwClient/cmake-build-debug
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]