# Devoxx FR 2017 - Quickie 'Yarn, encore un package manager?'

Toolbox for benchmarking YARN vs NPM.

## Getting Started

### 1. Using custom scripts

```
    ./bench_npm.sh
    ./bench_yarn.sh
```

Here, you could change the config by editing the scripts.

### 2. Using [npmvsyarn](https://github.com/supreetpal/npmvsyarn)

#### TL/DR
```
    ./npmvsyarn.sh
```

#### Via docker

* Build the container
```
    docker build -t bench ./bench/
```

* Run the container (default config)
```
    docker run bench
```

* Run with specific parameters
```
    docker run -e LIBRARIES="gulp" -e PROJECTS="" bench 
```

#### Via docker-compose

* Run 
```
    docker-compose up
```

Here, you could change the config by editing the file `docker-compose.yml`
