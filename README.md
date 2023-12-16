# Local-LLM-Code
Code by Lawrence for NLP Lang Gen Sum that was run a locally on a desktop
      
## Commands to build the container
The dockerfile and requirements are included in this repo.    
The following two commands are used to construct the docker container.    
	docker build -t <insert_your_image_name> .    
	docker run --gpus all -it -v "<insert_the_directory>:/notebooks" -p 8888:8888 <insert_your_image_name> /bin/bash     

If running Windows Docker Desktop, first start up the container.     
Afterward, open the container's terminal and run the following.    
	cd /notebooks     
	jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''    
     
You will be able to access the container through localhost:8888 on a browser.     

## 1) data downloading / generation / preprocessing
- CLP Casehold Crossreference.ipynb downloads the data from the Caselaw Acess Project. It crossreferences with
entries in the Casehold dataset and only downloads those.    
    
- LLM_Bulk_Summarization_&_Holding_Gen cannot be run all at once because most machines will not have enough GPU resources.
When performing an experiment, only run the specific section desired.
It has code used to generate summaries and holdings used in the many experiments of this project.

- LegalBert Large was used in generating extractive summaries used in holding generation and the parenthetical dataset creation. Generating all of the summaries required more than 15 hours.

- Formatting Parentheticals Dataset goes through the many extractive summaries created and matches them with the respective parenthetical. The result was the creation a 24k train, 3.5k val, and 3.5k test dataset.

- Mistral Parenthetical Gen was used to create the zero-shot parentheticals locally. The inference was one of many used in our experiments. A single run of inference for test dataset (3.5k) will take more than 12 hours.

## 2 and 3) Training your baselines and your experiments
- See Jeese' repo for the training details. This repo has code that created the dataset, but it does not directly finetune the models.

## Evaluating the output
- Evaluations for NLP Lang Gen has the calculations for the Rouge and Bert scores, as well as plotting them.
The notebook also aggregates and plots the Summac and Bleurt scores.