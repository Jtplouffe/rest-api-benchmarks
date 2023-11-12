# rust-axum-prisma

## Stack

- [rust](https://www.rust-lang.org/)
- [axum](https://github.com/tokio-rs/axum)
- [prisma](https://prisma.brendonovich.dev/)

## Results

```
Summary:
  Elapsed        1m0s
  Count         25336
    2xx         25336
  RPS         422.265
  Reads    79.065MB/s
  Writes    0.037MB/s

Statistics    Min      Mean    StdDev     Max
  Latency   7.027ms  23.675ms  4.482ms  39.798ms
  RPS         417     422.16     2.6     431.73

Latency Percentile:
  P50        P75      P90       P95       P99     P99.9     P99.99
  23.954ms  26.7ms  29.224ms  30.105ms  33.28ms  36.727ms  39.632ms

Latency Histogram:
  9.308ms    168   0.66%
  13.617ms   847   3.34%
  17.393ms  2539  10.02%
  21.627ms  6708  26.48%
  24.918ms  8426  33.26%
  28.183ms  6588  26.00%
  30.072ms    35   0.14%
  32.415ms    25   0.10%
```
