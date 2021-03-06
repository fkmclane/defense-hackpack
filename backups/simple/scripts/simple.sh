#!/bin/bash
#A script that backs up the system using tar

backupsystem() {
	useradd flynn
	mkdir -p /home/flynn/
	tar cjpf /home/flynn/kevin \
		--exclude={/sys/*,/dev/*,/proc/*,/tmp/*,/run/*} \
		--exclude=/home/flynn/* /
	chown flynn:flynn /home/flynn/kevin
	chmod 640 /home/flynn/kevin
}

extractfiles() {
	tar xjpf /home/flynn/kevin --wildcards "$@"
}

restoresystem() {
	cd /

	tar xjpf /home/flynn/kevin
}

backupsystem

