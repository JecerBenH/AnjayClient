FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add cmake
RUN mkdir cmake-build-debug
RUN cmake --build ./cmake-build-debug --target AnjayClient -j 6
RUN cd ./LwClient/cmake-build-debug
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]