::::::::::::::
check_client_certs.bats
::::::::::::::
@test "check cert dir" {
  ssh rear-debian "test -d /etc/rear/cert"
  [ $? -eq 0 ]
}

@test "check cert file" {
  ssh rear-debian "test -f /etc/rear/cert/*.crt"
  [ $? -eq 0 ]
}

@test "check cert link" {
  tssh rear-debian "est -L /etc/rear/cert/*.0"
  [ $? -eq 0 ]
}
::::::::::::::
check_client_certs_status.bats
::::::::::::::
#!/usr/bin/env bats

check_capath_dir () {
  local -r host="$1"
  run ssh ${host} "test -d /etc/rear/cert"
  [ $status -eq 0 ]
}

check_cafile () {
  local -r host="$1"
  run ssh ${host} "test -f /etc/rear/cert/*.crt"
  [ $status -eq 0 ]
}

check_cahash () {
  local -r host="$1"
  run ssh ${host} "test -L /etc/rear/cert/*.0"
  [ $status -eq 0 ]
}

check_rear_version () {
  local -r host="$1"
  local -r version="$2"
  run ssh ${host} "rear -V"
  [ $status -eq 0 ]
  [ "$output" == "Relax-and-Recover ${version} / Git" ]
}

@test "check cert dir $i" {
  check_capath_dir rear-debian
}

@test "check cert file $i" {
  check_cafile rear-debian
}

@test "check cert link $i" {
  check_cahash rear-debian
}

@test "check rear version $i" {
  check_rear_version rear-debian 2.00
}

@test "check cert dir $i" {
  check_capath_dir rear-centos
}

@test "check cert file $i" {
  check_cafile rear-centos
}

@test "check cert link $i" {
  check_cahash rear-centos
}

@test "check rear version $i" {
  check_rear_version rear-centos 2.00
}

::::::::::::::
check_runbackup.bats
::::::::::::::
@test "test runbackup rear-debian" {
  run drlm runbackup -c rear-debian
  [ "$status" -eq 0 ]
}
