## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!(Images/Javier F Flores ELK Diagram)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the elk.yaml file may be used to install only certain pieces of it, such as Filebeat.

  - pentest.yml
  - elk.yaml
  - filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load balancers protects public avaiability of the network virtual machines. These distribute receiving traffic to multiple virtual machines mitigating DoS. 

 A jump box is essentially identical to a gateway router fanning in all public traffic as a single node between the virtual machines. A jump box forces all traffic through it before allowing it to enter the subnets. It fans in traffic, making it easier to secure and monitor each individual virtual machine behind it. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat collects data about the file system.
- Metricbeat records machine metrics, such as uptime.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| WEB1     | VM1      | 10.0.0.5   | Linux            |
| WEB2     | VM2      | 10.0.0.6   | Linux            |
| ELK      | ELK      | 10.1.0.4   | Linux            |
| LB1      | Load     | 138.91.196.| Linux            |
|          | Balancer | 58         | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the load balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Request access from your desired ip address.

Machines within the network can only be accessed by Jump Box, 10.0.0.4 IP Address.


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | Request access -     |
|          |                     | provide IP address   |
| WEB1     | No                  | 10.0.0.4             |
| WEB2     | No                  | 10.0.0.4             |
| ELK      | No                  | 10.0.0.4             |
| LB1      | Yes                 | Request access -     |
|          |                     | provide IP address   |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-  Code can be run on many servers within a few minutes. Logging into each in order to makes changes could be impossible considering how many there are within a network and limited time resources. 

The playbooks implement the following tasks:

- elk.yml 
    -  Installs docker.io and python3-pip.
    -  Installs Docker python module.
    -  Use systctl module to use more memory.
    -  Installs sebp/elk:761 container.

- filebeat-playbook.yml
    -  Downloads filebat .deb file.
    -  Installs filebeat .dev.
    -  Drops in filebeat.yml.
    -  Enables and configures system module. 
    -  Sets up and Starts filebeat service.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

!(Images/elk-dockerps-screenshot.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5, 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat

These Beats allow us to collect the following information from each machine:
- Filebeat - collects data about the file system. Data collected included event log data such as website visits by operating systems, country, time, and error codes.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

ELK, Pentest, Filebeat Playbook 

- Copy the elk.yml file to /etc/ansible directory.
- Update the hosts and ansible configuration file to include the username used to sign into the web vms and elk servers in the host file and the IP Addresses for the Web VMs servers [webservers] (10.0.0.5, 10.0.0.6) and for the ELK Server [elkserver] (10.1.0.4). Elk stack will be downloaded to the elkserver, while filebeat will be downloaded to the webservers.
- Run the playbook, and navigate to http://138.91.196.58:5601/app/kibana to check that the installation worked as expected.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

Use the following commands to download the playbook, update the ansible configuration and hosts files, and execute the playbook:
- Download the playbook files into /etc/ansible or run mv ~/Downloads ~/etc/ansible
- Change directories using cd into ~/etc/ansible 
- Use nano hosts to configure the hosts file.
- Scroll down to the line remote_user = YOUR_USER_NAME and enter the username you wish to use to access the servers.
- Save and exit the hosts file.
- Configure the ansible.cfg file by scrolling down to the line[webservers]. Uncomment. 
- Add in the private ip addresses of the webservers and include ansible_python_interpreter=/usr/bin/python beside each IP address to create it as a python script. 
- Repeat this for the elk server, but replace webservers with elkserver and the ip address with the elk server ip address. 
- Execute the playbooks with sudo ansible-playbook filename. 