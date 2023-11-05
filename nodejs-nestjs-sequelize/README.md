# nodejs-nestjs-sequelize

## Stack

- [Nodejs](https://nodejs.org)
- [NestJS](https://nestjs.com/)
- [Sequelize](https://sequelize.org/)

## Details

In this implementation, the included models are leaded in `separate` queries. This drastically improved performances.

## Results

```
Summary:
  Elapsed        1m0s
  Count          6667
    2xx          6667
  RPS         111.116
  Reads    20.043MB/s
  Writes    0.010MB/s

Statistics    Min       Mean     StdDev      Max
  Latency   56.953ms  89.851ms  24.618ms  219.359ms
  RPS         79.9     111.11     6.37     121.04

Latency Percentile:
  P50         P75        P90        P95        P99       P99.9     P99.99
  87.095ms  94.665ms  107.505ms  149.589ms  185.806ms  197.131ms  219.359ms

Latency Histogram:
  62.291ms    720  10.80%
  73.926ms   1278  19.17%
  88.553ms   3217  48.25%
  99.435ms    893  13.39%
  131.584ms   258   3.87%
  165.648ms   164   2.46%
  179.071ms    96   1.44%
  188.549ms    41   0.61%
```
