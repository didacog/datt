echo "clients=( ${clients[@]} )" | tee -a $ENV_CONF_LOCK
echo "servers=( ${servers[@]} )" | tee -a $ENV_CONF_LOCK
