FROM python:3.10.12-slim-bookworm

# docker build --progress=plain -t convert_to_ggul .

RUN apt update && apt install -y git git-lfs

RUN git clone https://github.com/ZalozbaDev/llama.cpp /llama.cpp_b4458 && cd llama.cpp_b4458 && git checkout b4458

RUN pip install -r /llama.cpp_b4458/requirements/requirements-convert_hf_to_gguf.txt

COPY convert.sh /

RUN chmod 755 convert.sh

RUN mkdir -p /cache/ /output/

RUN git lfs install
