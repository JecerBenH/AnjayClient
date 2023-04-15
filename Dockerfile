FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add cmake
RUN apk add git
RUN git clone https://github.com/JecerBenH/AnjayClient.git
RUN cd AnjayClient
RUN cmake --build ./cmake-build-debug --target AnjayClient -j 6
RUN ./AnjayClient jecer
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]