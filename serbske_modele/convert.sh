#!/bin/bash

export LLAMA_b4458=llama.cpp_b4458
export LLAMA_b12653=llama.cpp_b12653

case $MODEL in
	
	Korla/serb-gpt)
		if [ ! -e /cache/Korla_serb-gpt ]; then
			git clone https://huggingface.co/Korla/serb-gpt /cache/Korla_serb-gpt
		fi
		if [ ! -e /cache/unsloth_Meta-Llama-3.1-8B-Instruct ]; then
			GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/unsloth/Meta-Llama-3.1-8B-Instruct      /cache/unsloth_Meta-Llama-3.1-8B-Instruct
		fi
		
		# No longer necessary, model repo now contains correct files 
		
		# cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/tokenizer.json          /cache/Korla_serb-gpt
		# cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/tokenizer_config.json   /cache/Korla_serb-gpt
		# cp /cache/unsloth_Meta-Llama-3.1-8B-Instruct/special_tokens_map.json /cache/Korla_serb-gpt
		
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
		
	tartuNLP/Qwen2.5-3B-Instruct-hsb-dsb)
		if [ ! -e /cache/tartuNLP_Qwen2.5-3B-Instruct-hsb-dsb ]; then
			git clone https://huggingface.co/tartuNLP/Qwen2.5-3B-Instruct-hsb-dsb /cache/tartuNLP_Qwen2.5-3B-Instruct-hsb-dsb
		fi

		mkdir -p /output/tartuNLP/Qwen2.5-3B-Instruct-hsb-dsb
		cd $LLAMA_b4458
		python3 convert_hf_to_gguf.py /cache/tartuNLP_Qwen2.5-3B-Instruct-hsb-dsb --outfile /output/tartuNLP/Qwen2.5-3B-Instruct-hsb-dsb/tartuNLP_Qwen2.5-3B-Instruct-hsb-dsb.gguf
		;;
		
	TomMoeras/wmt26-lt3-sorbian)
		if [ ! -e /cache/TomMoeras_wmt26-lt3-sorbian ]; then
			git clone https://huggingface.co/TomMoeras/wmt26-lt3-sorbian /cache/TomMoeras_wmt26-lt3-sorbian
		fi

		mkdir -p /output/TomMoeras/wmt26-lt3-sorbian
		# cd $LLAMA_b4458
		cd $LLAMA_b12653;
		python3 convert_hf_to_gguf.py /cache/TomMoeras_wmt26-lt3-sorbian/LT3-DevTransfer/ --outfile /output/TomMoeras/wmt26-lt3-sorbian/TomMoeras_wmt26-lt3-sorbian.gguf --outtype bf16
		./build/bin/llama-quantize /output/TomMoeras/wmt26-lt3-sorbian/TomMoeras_wmt26-lt3-sorbian.gguf /output/TomMoeras/wmt26-lt3-sorbian/TomMoeras_wmt26-lt3-sorbian-Q4_K_M.gguf Q4_K_M
		;;
		
	yhn112/WMT_Limited_Resources_Sorbian)
		if [ ! -e /cache/yhn112_WMT_Limited_Resources_Sorbian ]; then
			git clone https://huggingface.co/yhn112/WMT_Limited_Resources_Sorbian /cache/yhn112_WMT_Limited_Resources_Sorbian
		fi

		mkdir -p /output/yhn112/WMT_Limited_Resources_Sorbian
		# cd $LLAMA_b4458
		cd $LLAMA_b12653;
		python3 convert_hf_to_gguf.py /cache/yhn112_WMT_Limited_Resources_Sorbian/ --outfile /output/yhn112/WMT_Limited_Resources_Sorbian/WMT_Limited_Resources_Sorbian.gguf --outtype bf16
		./build/bin/llama-quantize /output/yhn112/WMT_Limited_Resources_Sorbian/WMT_Limited_Resources_Sorbian.gguf /output/yhn112/WMT_Limited_Resources_Sorbian/WMT_Limited_Resources_Sorbian-Q4_K_M.gguf Q4_K_M
		;;
		
	WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30)
		if [ ! -e /cache/WITAJ-Sprachzentrum_Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30 ]; then
			git clone https://huggingface.co/WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30 /cache/WITAJ-Sprachzentrum_Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30
		fi

		mkdir -p /output/WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30
		# cd $LLAMA_b4458
		cd $LLAMA_b12653;
		python3 convert_hf_to_gguf.py /cache/WITAJ-Sprachzentrum_Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30/ --outfile /output/WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30.gguf --outtype bf16
		./build/bin/llama-quantize /output/WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30.gguf /output/WITAJ-Sprachzentrum/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30/Qwen2.5-1.5B_witaj_t2k_hs_hsb-dsb-de_2026-07-30-Q4_K_M.gguf Q4_K_M
		;;
		
	*)
		echo "Model $MODEL unknown!"
		;;
	
esac
