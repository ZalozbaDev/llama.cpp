# Overview of all (useful) text models

## Korla

https://huggingface.co/Korla/serb-gpt

# GGUL conversion

replace MODEL variable with "USERNAME/MODELNAME" 

supported models:

* Korla/serb-gpt

non-working models:

* n/a

```code

docker build --progress=plain -t convert_to_ggul .
mkdir ~/cache
mkdir ~/text_models/
docker run -e MODEL="Korla/serb-gpt" --mount type=bind,source=$HOME/cache,target=/cache/ --mount type=bind,source=$HOME/text_models,target=/output/ -it convert_to_ggul /convert.sh 

```

# Usage examples

```code
./build/bin/llama-server --model ../text_models/Korla/serb-gpt/serb-gpt.gguf --port 9000
```
