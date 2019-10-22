#! /bin/sh

# Start Docker in the background and capture process ID
/usr/local/bin/dockerd-entrypoint.sh >/dev/stdout 2>/dev/stderr &
pidDocker=$!

# Start Jenkins and capture process ID
/usr/local/bin/jenkins.sh >/dev/stdout 2>/dev/stderr &
pidJenkins=$!

exitCode=0
if wait $pidDocker; then
  echo "Docker terminated."
else
  exitCode=$?
  echo "Docker stopped with code ${exitCode}. Exiting."
  exit ${exitCode}
fi

if wait $pidJenkins; then
  echo "Jenkins terminated."
else
  exitCode=$?
  echo "Jenkins stopped with code ${exitCode}. Exiting."
  exit ${exitCode}
fi
