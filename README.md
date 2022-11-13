# cloud-performance-test

## Applications 
- Nginx
- Spring

## Performance Test Tools
- Apache Bench
  - https://httpd.apache.org/docs/2.4/programs/ab.html
- Apache Jmeter
  - https://jmeter.apache.org/usermanual/get-started.html
- Locust
  - https://docs.locust.io/en/stable/

### Install Tools
```shell
# apache bench
# brew install httpd-tools
brew install apr-util

# jmeter
brew install jmeter

# locust
pip install -r requirements.txt
```

### Requests
#### Apache Bean
```shell
ab -c 10 -n 100000 http://localhost:8080/index.html
# enable keep-alive
ab -c 10 -n 100000 -k http://localhost:8080/index.html
```

#### Jmeter
```shell
# -n - tells JMeter to run in non-GUI mode
# -t - specifies the path to source .jmx script to run
jmeter -n -t your_script.jmx
```

#### Locust
```shell
# start locust
locust -f src/locustfile.py --host=http://localhost:8080
# master start:
locust -f src/locustfile.py --host=http://localhost:8080 --master
# slave start: when master server is on same server
locust -f src/locustfile.py --host=http://localhost:8080 --worker
# slave start: when master server is on remote server
locust -f src/locustfile.py --host=http://localhost:8080 --master-host=master.example.com --slave
# run locust multiple workers
sh ./multi-workers.sh
```

