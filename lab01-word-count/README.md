# Lab 1 - Unstructured data analysis with RDDs (word count)

Word count on *Around the World in 80 Days* (English, Project Gutenberg #103) with
PySpark RDDs, then a comparison with the French original (#46541).

**Notebook:** [`word_count.ipynb`](word_count.ipynb) - already executed, outputs are visible
directly on GitHub.

## What is covered

| Part | Content |
|------|---------|
| 1. Word count | a. count occurrences, b. lower case, c. stop words, d. alphabetical sort, e. sort by frequency, f. punctuation and blank tokens. All steps are then chained in one function, `word_count_pipeline`. |
| 2. Code reading | Line-by-line comments on the average-age example (`map` / `reduceByKey`). |
| 3. Timing | Timer with warm-up and median over 5 runs, comparing "filter before count" and "count before filter". |
| 4. Text comparison | EN vs FR: unique words, top 20, words shared by both. |

Every result cell has a short markdown explanation above it.

## Main results

- Top words after cleaning (EN): `fogg` (602), `passepartout` (404), `mr` (391), `phileas` (256), `fix` (240).
- Unique words: 7 292 (EN) vs 9 800 (FR).
- Words shared by both top 20: `aouda`, `fix`, `mr`, `fogg`, `passepartout`, `phileas`
  (proper nouns and the title `mr`).
- Timing: both orders return the same result; the measured difference (about 0.11 s vs 0.14 s)
  is small because `reduceByKey` already combines values on each partition, so it is mostly noise on
  a file this small.

## Run it

Requirements: Docker.

```bash
cd lab01-word-count
./run_docker.sh          # starts the container and prints the Jupyter link with its token
```

Open the link, then run `word_count.ipynb` from the `work/` folder. The notebook downloads the two
books itself (`wget`), they are not stored in the repository.

The script sets `PYTHONPATH` because the current `quay.io/jupyter/pyspark-notebook` image
(Spark 4.2.0) does not put `pyspark` on the Python path by default.

Stop the container with `docker stop pyspark_notebook`.
