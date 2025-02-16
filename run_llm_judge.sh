for model in claude gpt Llama Qwen Mixtral WizardLM Mistral gemma
do
python llm_as_a_judge.py --eval_model $model
done
