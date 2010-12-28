# Build a repo-resident keypair
empty_directory 'config/keypair'
run 'echo "\n\n" | /usr/bin/ssh-keygen -q -t rsa -f config/keypair/id_rsa'