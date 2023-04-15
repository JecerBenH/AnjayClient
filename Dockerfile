FROM amd64/alpine:3.17.3
RUN apt update  \
    && apt install build-essential cmake --no-install-recommends \
    && cd LwClient \
    && mkdir app\
    &&  cmake --build ./app --target AnjayClient -j 6
EXPOSE 5683
ENTRYPOINT ["AnjayClient","kkkk"]