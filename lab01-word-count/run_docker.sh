#!/usr/bin/env bash
# Start the Jupyter + PySpark container used for this lab.
# Usage (from this folder): ./run_docker.sh
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

docker run --name pyspark_notebook --rm \
  --user root \
  -e NB_UID="$(id -u)" \
  -e NB_GID="$(id -g)" \
  -e CHOWN_EXTRA="/home/jovyan/work" \
  -e CHOWN_EXTRA_OPTS="-R" \
  -e PYTHONPATH="/usr/local/spark/python:/usr/local/spark/python/lib/py4j-0.10.9.9-src.zip" \
  -v "$PROJECT_DIR":/home/jovyan/work \
  --detach \
  -p 8888:8888 -p 4040:4040 -p 4041:4041 \
  quay.io/jupyter/pyspark-notebook

sleep 15
echo "Open one of these links in your browser:"
docker logs pyspark_notebook 2>&1 | grep "token=" | head -1
