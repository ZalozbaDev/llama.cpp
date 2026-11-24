# FROM python:3.10.12-slim-bookworm
FROM python:3.14.10-slim-trixie

# docker build --progress=plain -t convert_to_gguf .

RUN apt update && apt install -y git git-lfs cmake gcc g++

RUN git clone https://github.com/ZalozbaDev/llama.cpp /llama.cpp_b4458  && cd llama.cpp_b4458  && git checkout b4458

RUN cd /llama.cpp_b4458 && cmake -B build && cmake --build build -j4 --config Release

RUN git clone https://github.com/ZalozbaDev/llama.cpp /llama.cpp_b12653 && cd llama.cpp_b12653 && git checkout b12653

RUN cd /llama.cpp_b12653 && cmake -B build && cmake --build build -j4 --config Release

RUN pip install -r /llama.cpp_b12653/requirements/requirements-convert_hf_to_gguf.txt

RUN pip install transformers==5.10.4

COPY convert.sh /

RUN chmod 755 convert.sh

RUN mkdir -p /cache/ /output/

RUN git lfs install
