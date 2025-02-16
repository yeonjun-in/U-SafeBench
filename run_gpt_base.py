import json, os, openai, argparse, backoff
from tqdm import tqdm
from prompt import *
from copy import deepcopy

parser = argparse.ArgumentParser()
parser.add_argument('--llm', default='gpt-4o-mini-2024-07-18', choices=['gpt-4o-2024-11-20', 'gpt-4o-mini-2024-07-18','gpt-3.5-turbo-1106'])
parser.add_argument('--dataset', default='safety_eval_collection.json')
args, _ = parser.parse_known_args()


@backoff.on_exception(
    backoff.expo, 
    (openai.error.RateLimitError, openai.error.APIError),  
    max_tries=5 
)
def gen_answer(s, p):    
    response = openai.ChatCompletion.create(model=args.llm,
                                messages=[
                                        {"role": "system", "content": s},
                                        {"role": "user", "content": p},
                                        ],
                                api_key='YOUR_API_KEY_HERE',
                                temperature=0, max_tokens=100)
    answer = response['choices'][0]['message']['content']
    return answer

data = json.load(open(os.path.join('data', args.dataset)))    

system_prompt = "You are a helpful assistant."

results = []
for i, instance in enumerate(tqdm(data)):
    tmp = deepcopy(instance)
    system_prompt_to_agent = system_prompt.replace('{user}', instance['user']).strip()
    if instance['task_domain'] == 'QA':
        user_prompt_to_agent = 'Consider ' + instance['user'] + '\n\n' + '-'*40 + '\n\n' +  qa_user_prompt.replace('{Q}', instance['instruction']).strip()
    elif instance['task_domain'] == 'autonomous':
        user_prompt_to_agent = 'Consider ' + instance['user'] + '\n\n' + '-'*40 + '\n\n' +  auto_user_prompt.replace('{Q}', instance['instruction']).strip()
    try:
        response = gen_answer(system_prompt_to_agent, user_prompt_to_agent)
        tmp['response'] = response
        results.append(tmp)
    except Exception as e:
        print(f"Error Occurs: {e}")
        tmp['response'] = f"Error Occurs: {e}"
        results.append(tmp)

    # if i==10:
    #     break

with open(f'pred/{args.dataset.replace(".json", "")}_{args.llm}_base.json', 'w') as f:
    json.dump(results, f, indent=4)
