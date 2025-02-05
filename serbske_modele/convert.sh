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
		
	meta-llama/Llama-3.1-70B-Instruct)
		if [ ! -e /cache/meta-llama_Llama-3.1-70B-Instruct ]; then
			git clone https://huggingface.co/meta-llama/Llama-3.1-70B-Instruct /cache/meta-llama_Llama-3.1-70B-Instruct
		fi
		
		mkdir -p /output/meta-llama/Llama-3.1-70B-Instruct
		cd $LLAMA_b4458
		python3 convert_hf_to_gguf.py /cache/meta-llama_Llama-3.1-70B-Instruct/ --outfile /output/meta-llama/Llama-3.1-70B-Instruct/serb-gpt.gguf
		;;
		
	meta-llama/Llama-3.1-8B)
		if [ ! -e /cache/meta-llama_Llama-3.1-8B ]; then
			git clone https://huggingface.co/meta-llama/Llama-3.1-8B /cache/meta-llama_Llama-3.1-8B
		fi

		mkdir -p /output/meta-llama/Llama-3.1-8B
		cd $LLAMA_b4458
		python3 convert_hf_to_gguf.py /cache/meta-llama_Llama-3.1-8B/ --outfile /output/meta-llama/Llama-3.1-8B/meta-llama_Llama-3.1-8B.gguf
		;;
		
	mistralai/Mistral-Small-24B-Base-2501)
		if [ ! -e /cache/mistralai_Mistral-Small-24B-Base-2501 ]; then
			git clone https://huggingface.co/mistralai/Mistral-Small-24B-Base-2501 /cache/mistralai_Mistral-Small-24B-Base-2501
		fi

		mkdir -p /output/mistralai/Mistral-Small-24B-Base-2501
		cd $LLAMA_b4458
		python3 convert_hf_to_gguf.py /cache/mistralai_Mistral-Small-24B-Base-2501/ --outfile /output/mistralai/Mistral-Small-24B-Base-2501/mistralai_Mistral-Small-24B-Base-2501.gguf
		;;
		
		
		
	*)
		echo "Model $MODEL unknown!"
		;;
	
esac
