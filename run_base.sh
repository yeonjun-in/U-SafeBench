family=$1
method=$2

export OPENAI_API_KEY=""
export CLAUDE_API_KEY=""
export TOGETHER_API_KEY=""


if [[ "$family" == *"claude"* ]]; then
    
    for llm in claude-3-5-sonnet-20241022 claude-3-5-haiku-20241022
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_claude_$method.py --llm $llm --dataset $dataset
    done
    done    

elif [[ "$family" == *"gpt"* ]]; then
    
    for llm in gpt-3.5-turbo-1106 gpt-4o-mini-2024-07-18 gpt-4o-2024-11-20 
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_gpt_$method.py --llm $llm --dataset $dataset
    done
    done

elif [[ "$family" == *"gemma"* ]]; then

    for llm in google/gemma-2-27b-it # google/gemma-2-9b-it 
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_together_$method.py --llm $llm --dataset $dataset
    done
    done

elif [[ "$family" == *"llama"* ]]; then

    for llm in  meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo meta-llama/Llama-4-Maverick-17B-128E-Instruct-FP8 meta-llama/Llama-4-Scout-17B-16E-Instruct meta-llama/LlamaGuard-2-8b meta-llama/Meta-Llama-Guard-3-8B meta-llama/Llama-Guard-4-12B
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_together_$method.py --llm $llm --dataset $dataset
    done
    done

elif [[ "$family" == *"mistral"* ]]; then

    for llm in mistralai/Mistral-Small-24B-Instruct-2501 mistralai/Mistral-7B-Instruct-v0.3 mistralai/Mixtral-8x22B-Instruct-v0.1 mistralai/Mixtral-8x7B-Instruct-v0.1
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_together_$method.py --llm $llm --dataset $dataset
    done
    done

elif [[ "$family" == *"qwen"* ]]; then

    for llm in Qwen/Qwen2-72B-Instruct Qwen/Qwen2.5-72B-Instruct-Turbo Qwen/Qwen2.5-7B-Instruct-Turbo
    do
    for dataset in safety_eval_collection_v1.1.json helpfulness_eval_collection_v1.1.json
    do
    echo "$llm"
    python run_together_$method.py --llm $llm --dataset $dataset
    done
    done

else
    echo "Something Wrong."
fi






