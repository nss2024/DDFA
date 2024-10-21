#!/bin/bash

echo "설치 진행중..."

git clone https://github.com/ISU-PAAL/DeepDFA.git

wget https://github.com/joernio/joern/releases/download/v1.1.1072/joern-cli.zip

unzip joern-cli.zip -d joern-cli

export PATH=$PATH:/content/joern-cli/joern-cli

pip install pip==23.2.1

pip install tqdm numpy pandas torch==1.12 "torchmetrics<0.10.0" torchsampler silence-tensorflow tensorflow scipy captum deepspeed scikit-learn tokenizers transformers tree-sitter unidiff jsonlines networkx pexpect jsonargparse fastparquet gdown nni

pip install pytorch-lightning==1.7.7

apt-get install openjdk-11-jdk-headless -qq > /dev/null

pip install virtualenv

apt-get install cuda-11-7


git clone https://github.com/nss2024/ddfa_test.git
mv ddfa_test DDFA
rsync -av DDFA/ DeepDFA/





echo "실행중..."
python /content/DeepDFA/DDFA/sastvd/scripts/prepare.py --dataset bigvul
python /content/DeepDFA/DDFA/sastvd/scripts/getgraphs.py bigvul --overwrite
python /content/DeepDFA/DDFA/sastvd/scripts/dbize.py
python /content/DeepDFA/DDFA/sastvd/scripts/dbize_graphs.py
python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 1
python /content/DeepDFA/DDFA/sastvd/scripts/abstract_dataflow_full.py --no-cache --stage 2




echo "청소중..." 

rm -rf /content/DDFA
rm -rf /content/sample_data
rm /content/joern-cli.zip
rm -rf /content/DeepDFA/CodeT5
rm -rf /content/DeepDFA/scripts
rm /content/DeepDFA/Dockerfile
rm /content/DeepDFA/LICENSE
rm /content/DeepDFA/README.md
rm /content/DeepDFA/environment.yml
rm /content/DeepDFA/paper.pdf
