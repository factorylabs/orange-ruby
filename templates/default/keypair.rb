# Build a keypair
log "\n    Creating a repo keypair ...\n"
empty_directory 'config/keypair'
run "/usr/bin/ssh-keygen -q -t rsa -f config/keypair/id_rsa"