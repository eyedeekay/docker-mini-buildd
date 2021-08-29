#! /bin/sh
chown -R mini-buildd:mini-buildd /var/mini-buildd
su mini-buildd -c "/usr/sbin/mini-buildd --loggers console --verbose --dedicated-user mini-buildd --home /var/mini-buildd --foreground --set-admin-password $PASSWORD"
su mini-buildd -c "/usr/sbin/mini-buildd --loggers console --verbose --dedicated-user mini-buildd --home /var/mini-buildd --foreground"