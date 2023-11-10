# rust-axum-prisma

## Stack

- [rust](https://www.rust-lang.org/)
- [axum](https://github.com/tokio-rs/axum)
- [prisma](https://prisma.brendonovich.dev/)

## Results

```
Summary:
  Elapsed        1m0s
  Count         25087
    2xx         25087
  RPS         418.113
  Reads    78.287MB/s
  Writes    0.037MB/s

Statistics    Min      Mean    StdDev      Max
  Latency   6.118ms  23.911ms  4.835ms  137.177ms
  RPS       383.76    418.11    6.14     427.99

Latency Percentile:
  P50         P75       P90       P95       P99      P99.9     P99.99
  24.095ms  26.751ms  29.207ms  30.266ms  33.558ms  36.643ms  133.718ms

Latency Histogram:
  12.867ms   715   2.85%
  17.867ms  3165  12.62%
  22.832ms  9691  38.63%
  26.044ms  7711  30.74%
  28.472ms  2513  10.02%
  30.895ms  1044   4.16%
  32.914ms   233   0.93%
  35.129ms    15   0.06
```
