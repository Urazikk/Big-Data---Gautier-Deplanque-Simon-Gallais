# Lab 2 - Structured data analysis with DataFrames and Spark SQL

Exploratory analysis of the NYC yellow taxi trips (January 2019, about 7.7 million rows) with
PySpark DataFrames and Spark SQL, enriched with the taxi zone lookup and compared with January 2025.

**Notebook:** [`lab_sparksql_and_dataframes.ipynb`](lab_sparksql_and_dataframes.ipynb) - already
executed, outputs and charts are visible directly on GitHub. Each result has a short markdown
explanation above it.

## What is covered

| Part | Content |
|------|---------|
| 1. Trips | Unique trip key, highest passenger count, average passengers, shortest / longest trips (distance and time), busiest / slowest day, hour and day of the week, effect of distance and passengers on the tip, highest "extra" charge, outliers. |
| 2. Zones | Join with the zone lookup: pickups / dropoffs, busy times, busy days, average distance and fare, highest / lowest fares by borough. Comparison with January 2025. |
| 3. SQL | Three questions redone in pure Spark SQL (two of them with a join), same results as the DataFrame version. |
| Where to go | Three visualizations (trips per day, per hour, by borough). Not done: full year 2019 and seasons. |

## Main results

- The raw file is dirty: pickup dates from 2001 to 2088, 7,129 negative fares, a fare of 623,259.86 dollars,
  trips lasting 30 days. Time questions use only the real January 2019 trips (7,696,076) and averages use
  "valid" trips (distance under 100 miles, fare between 0 and 500 dollars).
- Busiest days are Fridays (Jan 25 and Jan 11); the slowest are the holidays (Jan 1 and Jan 21).
  Peak hour is 6 pm, slowest is 4 am.
- 90% of the pickups are in Manhattan (average trip 2.24 miles, 10.63 dollars); trips from Queens and
  Newark are much longer and more expensive.
- The tip is correlated with the distance / fare (0.71 / 0.74) but not with the number of passengers (0.01).
- January 2025 vs January 2019: -55% trips, +46% average fare, +61% average card tip.

## Run it

Requirements: Docker.

```bash
cd lab02-sparksql-dataframes
./run_docker.sh          # starts the container and prints the Jupyter link with its token
```

Open the link and run the notebook from the `work/` folder. It downloads the datasets itself (about
170 MB for the two parquet files); they are not stored in the repository. Stop the container with
`docker stop pyspark_notebook`.
