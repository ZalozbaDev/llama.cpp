#!/bin/bash

echo "Using first model found:"
ls -l /model/

/llama.cpp_b4458/build/bin/llama-server --model /model/*.gguf

