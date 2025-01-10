#!/bin/bash

export LLAMA_b4458=llama.cpp_b4458

case $MODEL in
	
	Korla/serb-gpt)
		if [ ! -e /cache/Korla_serb-gpt ]; then
			git clone https://huggingface.co/Korla/serb-gpt /cache/Korla_serb-gpt
		fi
		if [ ! -e /cache/unsloth_Meta-Llama-3.1-8B-Instruct ]; then
			GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/unsloth/Meta-Llama-3.1-8B-Instruct      /cache/unsloth_Meta-Llama-3.1-8B-Instruct
		fi
		
		cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/tokenizer.json          /cache/Korla_serb-gpt
		cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/tokenizer_config.json   /cache/Korla_serb-gpt
		cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/special_tokens_map.json /cache/Korla_serb-gpt
		
		mkdir -p /output/Korla/serb-gpt
		cd $LLAMA_b4458
		python3 convert_hf_to_gguf.py /cache/Korla_serb-gpt/ --outfile /output/Korla/serb-gpt/serb-gpt.gguf
		;;
		
	*)
		echo "Model $MODEL unknown!"
		;;
	
esac
