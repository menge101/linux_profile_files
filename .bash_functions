sshs() {
    local_path=${HOME}/.bashrc_remote
    remote_path=/tmp/${USER}_bashrc
    data=`base64 --input ${local_path}`
    ssh -t $@ "echo \"${data}\" | base64 --decode > ${remote_path}; ls ${remote_path}; echo ${remote_path}; cat ${remote_path}; echo real"
}

complete -F _ssh sshs