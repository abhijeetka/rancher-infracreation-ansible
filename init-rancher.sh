#!/bin/bash +x 
 
echo "$USER";
echo "#######################################################";
echo  "\tChecking if Ansible present";
echo "#######################################################";
echo -e "\n\n";
if ! type "ansible --version" > /dev/null; then
  
  echo "#######################################################";
  echo  "\tInstalling Ansible";
  echo "#######################################################";
  echo  "\n";
  sudo apt-get install  -y software-properties-common
  sudo apt-add-repository -y ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
  echo  "\n";
  echo "#######################################################";
  echo  "\t Installation completed";
  echo "#######################################################";
fi
  echo  "\n";
echo "#######################################################";
echo  "\tAnsible Version";
echo "#######################################################";

ansible --version

echo "#######################################################";
echo  "\tAnsible Version";
echo "#######################################################";
echo  "\n\n";
echo "#######################################################";
echo  "\tRunning Ansible Script";
echo "#######################################################";
echo  "\n";
      ansible-playbook -i hosts copyArtifact.yml
      ansible-playbook -i hosts rancher.yml
      ansible-playbook -i hosts lbCheck.yml
echo  "\n";
echo "#######################################################";
echo  "\tRancher installation finished";
echo "#######################################################";

