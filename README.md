## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Project_1_Virtual_Network/Images/ELK_Diagram.png)  https://drive.google.com/file/d/1q6kl2KHmcOjOHiURIozY4N-1CBONGfP9/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - /etc/ansible/roles/filebeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly secure, in addition to restricting access to the network.
-  A jump box prevents the VMS from being exposed to the public, as well as opens only one port, as opposed to several ports to connect different virtual machines.
A load balancer has an off-loading function which defends against DDoS attacks by shifting attack traffic to a public cloud provider.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- Filebeat monitors Logfiles, collects log events, and forwards them to Elasticsearch or Logstash.
- Metricbeat collects metric data from target servers, such as CPU, memory, and data related to services on the server. Also monitors other beats and the ELK stack.

The configuration details of each machine may be found below.


| Name     | Function | IP Address   | Operating System  |
|----------|----------|------------  |------------------ |
| Jump Box | Gateway  |52.175.253.103| Linux Ubuntu 18.04|
| WEB1     |  VM      | 10.0.0.5     | Linux Ubuntu 18.04|
| WEB2     |  VM      | 10.0.0.6     | Linux Ubuntu 18.04|
| WEB3     |  VM      | 10.0.0.7     | Linux Ubuntu 18.04|
| ELK      |diagnostic| 10.1.0.4     | Linux Ubuntu 18.04|
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-  xx.xxx.x.xxx (my ip)

Machines within the network can only be accessed by _____.
- Jump Box 52.175.253.103 10.0.0.4


A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |     Yes             | xx.xxx.x.xxx (my IP) |
| web1     |     No              |  10.0.0.4  (jumpbox) |
| web2     |     No              |  10.0.0.4  (jumpbox) |
| web3     |     No              |  10.0.0.4  (jumpbox) |
| ELK      |     No              |  10.1.0.4  (jumpbox) |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The main adavantage of automating the configuration is you can easily roll it out to as many machines as you would like, very quickly.

The playbook implements the following tasks:
- Install docker.io
- Install python3-pip
- Install docker module
- run command to increase memory and use it
- download and launch elk container and run it on the published ports
- enable docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 /Project_1_Virtual_Network/Images/Project1-ElkDocker.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
  10.0.0.6
  10.0.0.7

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat allows you to monitor and collect the log files, events, and locations and send them to Logstash or Elasticsearch.
- Metricbeat takes stats and metric data and sends them to Logstash or Elasticsearch for diagnosis.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the config.yml file to /etc/ansible/files.
- Update the config.yml file to include ELK private ip 10.1.0.4
- Run the playbook, and navigate to 10.1.0.4 to check that the installation worked as expected.

- _Which file is the playbook? Where do you copy it?_
filebeat-playbook.yml copy it into /etc/ansible/roles
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
The host file is to be updated to make ansible run the playbook on a specific machine. Specifiy the machines in the configuration file by their ip (10.0.0.5 10.0.0.6 10.0.0.7 for beats, 10.1.0.4 for ELK)

- _Which URL do you navigate to in order to check that the ELK server is running?
https://104.43.234.157:5601/app/kibana
