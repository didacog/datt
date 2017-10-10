# Download vagrant boxes if not exist

for b in ${boxes[@]}; do
    bname=$(vagrant box list | grep ${BOX[$b.name]})
    if [[ -z "$bname" ]]
        vagrant box add --name ${BOX[$b.name]} --provider libvirt ${BOX[$b.url]}
        if [[ $? -ne 0 ]]; then
            Error "$PROGNAME:boxes: Problem adding BOX [$b]."
        fi
    fi
done
