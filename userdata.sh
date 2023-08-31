

set-hostname -skip-apply ${component}
labauto ansible
ansible-pull -i localhost, -U https://github.com/Rajesh-2406/roboshop-ansible main.yml -e role_name=${component} -e env=${env}  &>>/opt/nasible.log