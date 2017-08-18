sshs() {
        ssh $@ "cat > /tmp/.bashrc_temp" < ~/.bashrc_remote
        ssh -t $@ "bash --rcfile /tmp/.bashrc_temp ; rm /tmp/.bashrc_temp"
}

complete -F _ssh sshs