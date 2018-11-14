#!/usr/bin/env bash

if [ -d "/home/jenkins/.ssh-git" ]; then
	chmod 600 /home/jenkins/.ssh-git/ssh-key
	chmod 600 /home/jenkins/.ssh-git/ssh-key.pub
	chmod 700 /home/jenkins/.ssh-git
fi
if [ -d "/home/jenkins/.gnupg" ]; then
	chmod 600 /home/jenkins/.gnupg/pubring.gpg
	chmod 600 /home/jenkins/.gnupg/secring.gpg
	chmod 600 /home/jenkins/.gnupg/trustdb.gpg
	chmod 700 /home/jenkins/.gnupg
fi

if [[ $# -eq 1 ]]; then

	exec "$@"

else

	if [[ "$@" != *"-tunnel "* ]]; then
		if [[ ! -z "$JENKINS_TUNNEL" ]]; then
			TUNNEL="-tunnel $JENKINS_TUNNEL"
		fi
	fi

	if [[ ! -z "$JENKINS_URL" ]]; then
		URL="-url $JENKINS_URL"
	fi

	exec java $JAVA_OPTS -cp /usr/share/jenkins/slave.jar hudson.remoting.jnlp.Main -headless $TUNNEL $URL "$@"
fi
