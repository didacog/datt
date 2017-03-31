##################
# datt functions #
##################

function IsNotPingable {
    ping -c 1 $1 2>&1 | grep -q "100% packet loss"
    rc=$?
    # rc=0 when host is unreachable
    return $rc
}

function findUser() {
    thisPID=$$
    origUser=$(whoami)
    thisUser=$origUser

    while [ "$thisUser" = "$origUser" ]
    do
        ARR=($(ps h -p$thisPID -ouser,ppid;))
        thisUser="${ARR[0]}"
        myPPid="${ARR[1]}"
        thisPID=$myPPid
    done

    getent passwd "$thisUser" | cut -d: -f1
}


function helpMsg {
    cat <<eof
Usage: $PRGNAME [-s <server distros>] [-c <client distros>] [-t <list of tests>] -vh
        -s: The distribution to use for DRLM instances (no default)
        -c: The boot method to use by our automated test (no default)
	-t: The validation tests directory (no default)
        -h: This help message.
        -v: Revision number of this script.
Comments:
--------
<distro>: select the distribution you want to use for these testings
<boot method>: select the rescue image boot method (default PXE) - supported are PXE and ISO
<boot server>: is the server where the PXE or ISO images resides on (could be the hypervisor or host system)
<provider>: as we use vagrant we need to select the provider to use (virtualbox, libvirt)
<rear-config-file.conf>: is the ReaR config file we would like to use to drive the test scenario with (optional with PXE)
<test-dir>: under the tests/ directory there are sub-directories with the beakerlib tests (donated by RedHat).
       When -t option is used then we will not execute an automated recover test (at least not yet)
eof
}

function Error {
    echo "$(bold $(red ERROR: $*))"
    exit 1
}

# usage example of colored output: echo "some $(bold $(red hello world)) test"
function bold {
    ansi 1 "$@";
}

function italic {
     ansi 3 "$@";
}

function underline {
     ansi 4 "$@";
}

function strikethrough {
     ansi 9 "$@";
}

function red {
     ansi 31 "$@";
}

function green {
     ansi 32 "$@";
}

function ansi {
     echo -e "\e[${1}m${*:2}\e[0m";
}

