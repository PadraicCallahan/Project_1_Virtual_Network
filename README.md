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
| ELK      |Diagnostic| 10.1.0.4     | Linux Ubuntu 18.04|
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
http://104.43.234.157:5601/app/kibana

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Kibana Investigation





In the last 7 days, there were 223 unique users located in India.


In the last 24 hours, of the visitors from China, 50% were using Mac OSX.


In the last 2 days, 100%  of visitors received 404 errors. 8.333% recieved 503 errors.


In the last 7 days, China produced the majority of the traffic on the website.


Of the traffic that's coming from that country, what time of day had the highest amount of activity?
- 12 p.m.

A list all the types of downloaded files that have been identified for the last 7 days, along with a short description of each file type:

css- (Cascading Style Sheets) describe how HTML elements are displayed on the screen.

deb- (Debian Software Package file) Made of two TAR archives that make up executable files, documentation, and libraries.

gz- archive file compressed by standard GNU zip.

rpm- (Red Hat Package Manager) stores installation packages on Linux. Provides software distribution, installation, upgrade, and removal.

zip- archive file format supporting lossless data compression.

--------------------------------------------------------------------------------------------------------------------

Locate the time frame in the last 7 days with the most amount of bytes (activity).
In your own words, is there anything that seems potentially strange about this activity?

They were all unique users originating from China and India.

Filter the data by this event.

What is the timestamp for this event? 08:01
What kind of file was downloaded? _doc
From what country did this activity originate? India
What HTTP response codes were encountered by this visitor? 200


Switch to the Kibana Discover page to see more details about this activity.

What is the source IP address of this activity?        61.231.10.118
What are the geo coordinates of this activity?         { "lat": 39.58316583, "lon": -85.80481 }
What OS was the source machine running?            Mozilla/5.0 (X11; Linux i686) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.50 Safari/534.24
What is the full URL that was accessed? 	https://elastic-elastic-elastic.org/people/type:astronauts/name:anthony-llewellyn/profile
From what website did the visitor's traffic originate?
elastic-elastic-elastic.org


What do you think the user was doing? Trying to get user information.
Was the file they downloaded malicious? If not, what is the file used for? 
Is there anything that seems suspicious about this activity? They could be trying to get profile information of astronauts.
Is any of the traffic you inspected potentially outside of compliance guidlines? If personal information is accessible by third parties, there would be privacy issues.
