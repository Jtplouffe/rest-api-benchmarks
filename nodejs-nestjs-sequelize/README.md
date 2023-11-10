# nodejs-nestjs-sequelize

## Stack

- [Nodejs](https://nodejs.org)
- [NestJS](https://nestjs.com/)
- [Sequelize](https://sequelize.org/)

## Details

In this implementation, the included models are loaded in `separate` queries. This drastically improves performances.

## Results

```
``Summary:
  Elapsed        1m0s
  Count          6320
    2xx          6320
  RPS         105.333
  Reads    19.000MB/s
  Writes    0.009MB/s

Statistics    Min       Mean     StdDev      Max
  Latency   20.711ms  94.849ms  33.126ms  264.137ms
  RPS        93.03     105.37     5.73     120.05

Latency Percentile:
  P50         P75        P90        P95        P99       P99.9     P99.99
  86.629ms  97.481ms  138.038ms  176.199ms  220.316ms  243.829ms  264.137ms

Latency Histogram:
  34.773ms      7   0.11%
  64.195ms    987  15.62%
  84.869ms   3127  49.48%
  100.886ms  1441  22.80%
  145.133ms   457   7.23%
  184.323ms   200   3.16%
  213.511ms    85   1.34%
  233.918ms    16   0.25%`
