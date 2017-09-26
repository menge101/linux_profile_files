sshs() {
    local_path=${HOME}/.bashrc_remote
    remote_path=/tmp/${USER}_bashrc
    data=`base64 --input ${local_path}`
    ssh -t $@ "echo \"${data}\" | base64 --decode > ${remote_path}; ls ${remote_path}; echo ${remote_path}; cat ${remote_path}; echo real"
}

_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}

complete -F _complete_ssh_hosts ssh
complete -F _complete_ssh_hosts sshs