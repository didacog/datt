# generation of nodes for Vagrantfile
VAGRANT_BOXES_ARRAY_FILE=$VAGRANT_DIR/conf/boxes.rb
echo "NODES = [" | tee -a $VAGRANT_BOXES_ARRAY_FILE >/dev/null

for c in ${clients[@]}; do
    RB_ARRAY=""
    for rp in ${REQUIRED_PARAMS[@]}; do
        if [[ -n ${REAR[$c.$rp]} ]]; then
            RB_ARRAY="$RB_ARRAY:$rp => '${REAR[$c.$rp]}', "
        else
            Error "$PROGRAM:genboxfile: Missing required parameter [$rp] for client [$c]."
        fi
    done
    for p in ${PARAMS[@]}; do
        if [[ -n ${REAR[$c.$p]} ]]; then
            RB_ARRAY="$RB_ARRAY:$p => '${REAR[$c.$p]}', "
        fi
    done
    echo $RB_ARRAY | sed -e "s/^/{ /g" | sed -e "s/,$/ },/g" | tee -a $VAGRANT_BOXES_ARRAY_FILE >/dev/null
done
for s in ${servers[@]}; do
    RB_ARRAY=""
    for rp in ${REQUIRED_PARAMS[@]}; do
        if [[ -n ${DRLM[$s.$rp]} ]]; then
            RB_ARRAY="$RB_ARRAY:$rp => '${DRLM[$s.$rp]}', "
        else
            Error "$PROGRAM:genboxfile: Missing required parameter [$rp] for server [$s]."
        fi
    done
    for p in ${PARAMS[@]}; do
        if [[ -n ${DRLM[$s.$p]} ]]; then
            RB_ARRAY="$RB_ARRAY:$p => '${DRLM[$s.$p]}', "
        fi
    done
    echo $RB_ARRAY | sed -e "s/^/{ /g" | sed -e "s/,$/ },/g" | tee -a $VAGRANT_BOXES_ARRAY_FILE >/dev/null
done

echo "]" | tee -a $VAGRANT_BOXES_ARRAY_FILE >/dev/null
