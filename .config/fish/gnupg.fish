gpgconf --launch gpg-agent
set -e SSH_AUTH_SOCK
set -U -x SSH_AUTH_SOCK /run/user/1000/gnupg/S.gpg-agent.ssh
set -x GPG_TTY (tty)
