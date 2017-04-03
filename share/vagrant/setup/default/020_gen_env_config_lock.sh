echo "clients=( ${clients[@]} )" | tee -a $ENV_CONF_LOCK >/dev/null
echo "servers=( ${servers[@]} )" | tee -a $ENV_CONF_LOCK >/dev/null
