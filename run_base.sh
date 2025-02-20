for llm in claude-3-5-sonnet-20241022 claude-3-5-haiku-20241022
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_claude_base.py --llm $llm --dataset $dataset
done
done

for llm in gpt-3.5-turbo-1106 gpt-4o-mini-2024-07-18 gpt-4o-2024-11-20 
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_gpt_base.py --llm $llm --dataset $dataset
done
done

for llm in google/gemma-2-9b-it google/gemma-2-27b-it
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_together_base.py --llm $llm --dataset $dataset
done
done

for llm in meta-llama/Meta-Llama-3.1-8B-Instruct-Turbo meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo Meta-Llama/Llama-Guard-7b meta-llama/LlamaGuard-2-8b meta-llama/Meta-Llama-Guard-3-8B
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_together_base.py --llm $llm --dataset $dataset
done
done

for llm in mistralai/Mistral-7B-Instruct-v0.3 mistralai/Mixtral-8x22B-Instruct-v0.1 mistralai/Mixtral-8x7B-Instruct-v0.1
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_together_base.py --llm $llm --dataset $dataset
done
done

for llm in microsoft/WizardLM-2-8x22B Qwen/Qwen2.5-72B-Instruct-Turbo Qwen/Qwen2.5-7B-Instruct-Turbo
do
for dataset in safety_eval_collection.json helpfulness_eval_collection.json
do
python run_together_base.py --llm $llm --dataset $dataset
done
done