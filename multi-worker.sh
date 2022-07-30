
cores=8
COUNT_OF_USERS=100000
SERVER_HOST=http://localhost:8080

# start SLAVE (clients)
echo "Start LOCUST SLAVES"
PID_SLAVES=( )
for ((i = 1; i <= $cores; i++));do
  #  locust -f locust_scenario.py --worker --master-host=$MASTER_IP --master-port=$MASTER_PORT -L $LOG_LEVEL --logfile=$LOG &
  #  PID_SLAVES+=( $! )
  locust -f src/locustfile.py --worker & PID_SLAVES+=( $! )
done
# shellcheck disable=SC2145
echo "LOCUST SLAVE PIDs = ${PID_SLAVES[@]}"

echo -e "Start LOCUST MASTER"
#locust -f src/locust_scenario.py --headless -L $LOG_LEVEL --logfile=$LOG --master-bind-port=$MASTER_PORT \
#--master-bind-host=$MASTER_IP -u $COUNT_OF_USERS  --print-stats --master --expect-workers=$cores --host=$SERVER_HOST&
locust -f src/locustfile.py --headless -u $COUNT_OF_USERS  --print-stats --master --expect-workers=$cores --host=$SERVER_HOST
PID_MASTER=$!
echo "LOCUST MASTER PID = $PID_MASTER"
sleep 5
