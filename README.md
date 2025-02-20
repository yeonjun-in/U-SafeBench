# Is Safety Standard Same for Everyone? User-Specific Safety Evaluation of Large Language Models

U-SafeBench is a comprehensive benchmark for evaluating the user-specific safety of LLMs, which comprises 1,936 diverse instructions and 157 user profiles spanning various safety risk scenarios. 



<p align="center">
  <img src="./figs/motivation.png" width="450">
</p>

![overview](./figs/eval.png)


## Table of Contents <!-- omit from toc -->
- [Data](#data)
  - [Download](#download)
  - [Description](#description)
- [How to Evaluate on U-SafeBench](#how-to-evaluate)
- [Citation](#citation)


## Overview
Summarized evaluation results of some representative LLMs are shown below:

<p align="center">
  <img src="./figs/overview.png" width="500">
</p>

## Data
### Download
We put our data on the [Hugging Face website](https://huggingface.co/datasets/thu-coai/SafetyBench).

Alternatively, you can directly use json files placed in `./data/` folder.

### Description
`test_zh`, `test_en` and `test_zh_subset` contain test questions for Chinese, English and Chinese subset respectively. `dev_zh` and `dev_en` contain 5 examples for each safety category, which can be used as few-shot demonstrations. 

Note that the `options` field in the data includes at most four items, corresponding to the options A, B, C, D in order. For the `answer` field in the dev data, the mapping rule is: 0->A, 1->B, 2->C, 3->D.

## How to Evaluate
In our paper, we conduct experiments in both zero-shot and five-shot settings. And we extract the predicted answers from models' responses. An example of evaluation code could be found at [code](./code/evaluate_baichuan.py). We don’t include CoT-based evaluation because SafetyBench is less reasoning-intensive than benchmarks testing the model’s
general capabilities such as MMLU. But feel free to submit your results based on CoT. The default prompt for zero-shot and five-shot evaluation is shown below:
![figure](./figs/eva_prompts.png)

To enable more accurate extraction of the predicted answers, we made minor changes to the prompts for some models, which is shown below:
![figure](./figs/prompt_change.png)


<!-- ## Citation
```
@article{zhang2023safetybench,
      title={SafetyBench: Evaluating the Safety of Large Language Models with Multiple Choice Questions}, 
      author={Zhexin Zhang and Leqi Lei and Lindong Wu and Rui Sun and Yongkang Huang and Chong Long and Xiao Liu and Xuanyu Lei and Jie Tang and Minlie Huang},
      journal={arXiv preprint arXiv:2309.07045},
      year={2023}
}
``` -->