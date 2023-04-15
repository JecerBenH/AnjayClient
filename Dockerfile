FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add cmake && apk add git && apk add ninja
RUN git clone https://github.com/JecerBenH/AnjayClient.git
RUN cd AnjayClient
RUN cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -S ./AnjayClient -B .
RUN cmake --build . --target AnjayClient -j 6
RUN ./AnjayClient jecer
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]