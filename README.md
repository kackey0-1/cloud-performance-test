# cloud-performance-test

## Applications 
- Nginx
- Spring

## Performance Test Tools
- Apache Bench
- Locust

### Install Tools
```shell
# apache bench
# brew install httpd-tools
brew install apr-util

# locust
pip install -r requirements.txt
```

### Requests
```shell
ab -c 10 -n 100000 http://localhost:8080/index.html
# enable keep-alive
ab -c 10 -n 100000 -k http://localhost:8080/index.html

# start locust
locust -f src/locustfile.py --host=http://localhost:8080
# master start:
locust -f src/locustfile.py --host=http://localhost:8080 --master
# slave start: when master server is on same server
locust -f src/locustfile.py --host=http://localhost:8080 --worker
# slave start: when master server is on remote server
locust -f src/locustfile.py --host=http://localhost:8080 --master-host=master.example.com --slave
```