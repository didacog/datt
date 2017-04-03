# check servers array by distro error if wrong distro
for s in ${servers[@]}; do
    if ! IsInArray $s ${DISTROS[@]}; then
        Error "$PROGNAME:servers: Wrong selected distro [$s]."
    fi
done
# check clients array by distro error if wrong distro
for c in ${clients[@]}; do
    if ! IsInArray $c ${DISTROS[@]}; then
        Error "$PROGNAME:clients: Wrong selected distro [$c]."
    fi
done
