FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add cmake
RUN apk add git
RUN git clone https://github.com/JecerBenH/AnjayClient.git
RUN cd AnjayClient && mkdir app
RUN cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_MAKE_PROGRAM=./ninja -G Ninja -S ./AnjayClient -B ./AnjayClient
RUN cmake --build ./app --target AnjayClient -j 6
RUN ./AnjayClient jecer
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]