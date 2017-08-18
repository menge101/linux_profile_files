sshs() {
    local_path=${HOME}/.bashrc_remote
    remote_path=/tmp/${USER}_bashrc
    data=`base64 --input ${local_path}`
    ssh -t $@ "echo \"${data}\" | base64 --decode > ${remote_path}; bash --rcfile ${remote_path}; rm ${remote_path}"
}

complete -F _ssh sshs