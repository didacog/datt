# check servers array by distro error if wrong distro
declare -a boxes

for s in ${servers[@]}; do
    if ! IsInArray $s ${DISTROS[@]}; then
        Error "$PROGNAME:servers: Wrong selected distro [$s]."
    else
        if ! IsInArray $s ${boxes[@]}; then
	    boxes=( "${boxes[@]}" "${s}" )
        fi
    fi
done
# check clients array by distro error if wrong distro
for c in ${clients[@]}; do
    if ! IsInArray $c ${DISTROS[@]}; then
        Error "$PROGNAME:clients: Wrong selected distro [$c]."
    else
        if ! IsInArray $c ${boxes[@]}; then
            boxes=( "${boxes[@]}" "${c}" )
        fi
    fi
done
