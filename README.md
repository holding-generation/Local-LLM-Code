# Local-LLM-Code
Code for NLP Lang Gen Sum that was run a local desktop
      
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
CLP Casehold Crossreference.ipynb downloads the data from the Caselaw Acess Project. It crossreferences with
entries in the Casehold dataset and only downloads those.    
    
LLM_Bulk_Summarization_&_Holding_Gen cannot be run all at once because most machine will not have enough GPU resources.
It 