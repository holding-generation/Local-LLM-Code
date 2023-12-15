# Local-LLM-Code
Code for NLP Lang Gen Sum that was run a local desktop

docker build -t <insert_your_image_name> .
docker run --gpus all -it -v "<insert_the_directory>:/notebooks" -p 8888:8888 <insert_your_image_name> /bin/bash

cd /notebooks
jupyter notebook --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''