FROM debian:bookworm-slim

# docker build --progress=plain -t llama_cpp_server .

RUN apt update && apt install -y git git-lfs

# RUN git clone https://github.com/ZalozbaDev/llama.cpp /llama.cpp_b4458 && cd llama.cpp_b4458 && git checkout b4458
RUN git clone https://github.com/ZalozbaDev/llama.cpp /llama.cpp_b7852 && cd llama.cpp_b7852 && git checkout b7852

RUN apt install -y cmake g++

RUN cd llama.cpp_b7852 && cmake -B build && cmake --build build --config Release -j 8 

RUN mkdir /model

COPY startme.sh /

RUN chmod 755 /startme.sh

CMD ["/startme.sh"]
