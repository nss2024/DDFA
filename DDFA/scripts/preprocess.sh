#!/bin/bash

set -e

bash /content/DeepDFA/DDFA/scripts/run_prepare.sh $@
bash /content/DeepDFA/DDFA/scripts/run_getgraphs.sh $@ # Make sure Joern is installed!
bash /content/DeepDFA/DDFA/scripts/run_dbize.sh $@
bash /content/DeepDFA/DDFA/scripts/run_abstract_dataflow.sh $@
bash /content/DeepDFA/DDFA/scripts/run_absdf.sh $@
