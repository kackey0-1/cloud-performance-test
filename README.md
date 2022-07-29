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

```