FROM amd64/alpine:3.17.3
RUN apk update
RUN apk add git && apk add ninja && apk add gcc && apk add --no-cache \clang \clang-dev \alpine-sdk \dpkg \cmake \ccache \mbedtls=2.28.3-r0 \openssl
RUN git clone https://github.com/AVSystem/Anjay.git \
        && cd Anjay \
        && git submodule update --init

RUN sed -i 's+bash+/bin/sh+g' CMakeLists.txt \
        && cmake . -DDTLS_BACKEND="" \
        && make -j \
        && cd ..
RUN git clone https://github.com/JecerBenH/AnjayClient.git
RUN cd AnjayClient
RUN cmake -DCMAKE_BUILD_TYPE=Debug -G Ninja -S ./AnjayClient -B ./AnjayClient
RUN cmake --build . --target AnjayClient -j 6
RUN ./AnjayClient jecer
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]