#!/bin/bash
cd

if [ -r "/etc/config/swiv/config.yml" ]; then
  # Priority 1 : If config file is found use it
  echo "About to execute:/swiv/bin/swiv -config /etc/config/swiv/config.yml"
  echo "printing content of config file.."
  cat /etc/config/swiv/config.yml
  echo "done printing content of config file.."
  /swiv/bin/swiv -config /etc/config/swiv/config.yml
elif [ -n "$MYARGS" ]; then
  # Priority 2 : If user is calling with command line, honor it"
  echo "About to execute:/swiv/bin/swiv $MYARGS"
  /swiv/bin/swiv ${MYARGS}
elif [ -n "$DRUID_BROKER_HOST" ]; then
  echo "Arguments provided: $DRUID_BROKER_HOST"
  if [ -n "$DRUID_BROKER_PORT" ]; then
    # Priority 3 : User supplying HOST and PORT ; We are hoping everyone will use it with druid broker and host so this block will be a most common use case
    echo "About to execute:/swiv/bin/swiv --druid ${DRUID_BROKER_HOST}:${DRUID_BROKER_PORT} "
    /swiv/bin/swiv --druid ${DRUID_BROKER_HOST}:${DRUID_BROKER_PORT}
  else
    # Priority 4 : User is supplying Host but no port; so will defailt it here
    echo "About to execute:/swiv/bin/swiv --druid ${DRUID-BROKER-HOST}:8082 "
    /swiv/bin/swiv --druid ${DRUID_BROKER_HOST}:8082
  fi
else
  # Priority 5 : No arguments provided. In that case it will assumed that druid boker is linked at druid-broker-host:8082
  echo "About to execute:/swiv/bin/swiv --druid druid-broker-host:8082 "
  /swiv/bin/swiv --druid druid_broker_host:8082
fi
