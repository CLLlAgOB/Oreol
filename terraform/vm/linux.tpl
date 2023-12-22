#cloud-config

locale: ru_RU.UTF-8
timezone: Europe/Moscow

users:
  - name: ${username}
    groups: sudo
    lock-passwd: false
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ${ssh_public}
  - name: ${username2}
    groups: sudo
    lock-passwd: false
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD: /etc/cert/restart_haproxy.sh']
    ssh-authorized-keys:
      - ${ssh_public2}

runcmd:
  - mkdir -p /etc/cert
  - groupadd ${groupname}
  - chown ${username2}:${groupname} /etc/cert
  - chmod 0750 /etc/cert
  - echo '#!/bin/bash' > /etc/cert/restart_haproxy.sh
  - echo '/bin/chown ${username2}:${groupname} ${key}' >> /etc/cert/restart_haproxy.sh
  - echo '/usr/sbin/service haproxy restart' >> /etc/cert/restart_haproxy.sh
  - chmod +x /etc/cert/restart_haproxy.sh
  - chown root:root /etc/cert/restart_haproxy.sh
  - chmod 700 /etc/cert/restart_haproxy.sh