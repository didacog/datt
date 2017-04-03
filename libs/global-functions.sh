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

# return whether $1 equals one of the remaining arguments
function IsInArray() {
    local needle="$1"
    test -z "$needle" && return 1
    while shift ; do
        # at the end $1 becomes an unbound variable (after all arguments were shifted)
        # so that an empty default value is used to avoid 'set -eu' error exit
        # and that empty default value cannot match because needle is non-empty:
        test "$needle" == "${1:-}" && return 0
    done
    return 1
}

function Source () {
    local source_file="$1"
    # Skip if source file name is empty:
    if test -z "$source_file" ; then
        return
    fi
    # Ensure source file is not a directory:
    test -d "$source_file" && Error "Source file '$source_file' is a directory, cannot source"
    # Skip if source file does not exist of if its content is empty:
    if ! test -s "$source_file" ; then
        return
    fi
    # Clip leading standard path to datt files (usually ????): 
    local relname="${source_file##$SHARE_DIR/}"
    # The actual work (source the source file):
    source "$source_file"
}

# collect scripts given in $1 in the standard subdirectories and
# sort them by their script file name and
# source them
function SourceStage () {
    stage="$1"
    shift
    scripts=(
        $(
        cd $SHARE_DIR/$stage ;
        # We always source scripts in the same subdirectory structure. The {..,..,..} way of writing
        # it is just a shell shortcut that expands as intended.
        ls -d {default}/*.sh \
        | sed -e 's#/\([0-9][0-9][0-9]\)_#/!\1!_#g' | sort -t \! -k 2 | tr -d \!
        )
        # This sed hack is neccessary to sort the scripts by their 3-digit number INSIDE independent of the
        # directory depth of the script. Basically sed inserts a ! before and after the number which makes the
        # number always field nr. 2 when dividing lines into fields by !. The following tr removes the ! to
        # restore the original script name. But now the scripts are already in the correct order.
        )
    # if no script is found, then $scripts contains only .
    # remove the . in this case
    test "$scripts" = . && scripts=()

    if test "${#scripts[@]}" -gt 0 ; then
        for script in ${scripts[@]} ; do
            Source $SHARE_DIR/$stage/"$script"
        done
    fi
}
