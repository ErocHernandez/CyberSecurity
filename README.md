## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Topology](/Diagrams/NetworkDiagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  - ![File Beat](/Ansible/filebeat-playbook.yml)
  - ![Metric Beat](/Ansible/Metric_Beat.yml)
  - ![My Playlist](/Ansible/my_playlist.yml)
  - ![ELK Deployment](/Ansible/install-elk.yml)
  - ![Filebeat Config](Ansible/filebeat-config.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorized access to the network.
- Having the load balancer in place ensures that neither web server is exposed directly to the internet. It also ensures that should there be a issue with one of the web servers is having issues, they users will be likely be unaffected by the loss of the machine.
- Using the jumpbox also provides a layer of seperation to the web servers allowing for no direct link to the servers back-end that is exposed to the internet. This allows for a more secure setup and configuration. In additon, the jumpbox -> to -> webserver access is configured with ssh key mininmizing the risk of lost or cracked passwords.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the operating system and system logs.
-  Filebeat looks for new log files generated by the web servers. 
-  Metricbeat monitors the operating system metrics.

The configuration details of each machine may be found below.

| Name    | Function         | IP Address | Operating System |
|---------|------------------|------------|------------------|
| Jumpbox | Gateway          | 10.1.0.4   | Linux            |
| Web 3   | Web Server       | 10.0.0.7   | Linux            |
| Web 4   | Web Server       | 10.0.0.8   | Linux            |
| Elk     | Elk Stack Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jumpbox Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 98.213.21.184

Machines within the network can only be accessed by the ansible container installed on the Jumpbox Provisioner.

- The Elk Stack is accessible via ssh internally only by the ansible container, but can be accessed via ports 80 and 443 (web interface) from designated public ip addreesses.

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses |
|---------------|---------------------|----------------------|
| Jumpbox       | Yes                 | 98.213.21.184        |
| Load Balancer | Yes                 | 98.213.21.184        |
| Elk Stack     | Yes                 | 98.213.21.184        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Every installation is setup the exact same.
- It's scalable.

The playbook implements the following tasks:
- Install Docker
- Install Python Module for use with docker
- Configure memory for use with Elk
- Download and launch Elk Docker Container
- Enable docker services

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Elk Stack - Docker ps](/Diagrams/Elk_Docker.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.7 (Web-3)
- 10.0.0.8 (Web-4)

We have installed the following Beats on these machines:
- filebeat
- metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat will allow for use to monitor system logs. This will report on any error logs from the web server pool. 
- Metricbeat will allow for performance analysis. We will be able to set specific metrics and report on any web servers not performing well.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy all the .yml files to your '/etc/ansible' directory to your docker asible container.
- The following edits to the following files will need to be made:
  - hosts file;
    - Ensure your hosts file has two collections that match your network configuration. [Wevservers] <-- Shouild be ip of your web servers. [Elk] <-- Should be ip of your Elk container.
    ![Hosts file](Diagrams/hosts_file.png)

  - (Ansible/filebeat-config.yml) 
    - Under ElasticSearch; Change to your Elk container IP Address
    ![Elastic Search](Diagrams/file-beat-config_elasticsearch.png)
    - Under Kibana: Change to your Elk container IP Address
    ![Elastic Search](Diagrams/file-beat-config_kibana.png)

  - (Ansible/metricbeat_config.yml)
    - Under ElasticSearch; Change to your Elk container IP Address
    ![Elastic Search](Diagrams/metric-beat-config_elasticsearch.png)
    - Under kibana; Change to your Elk container IP Address
    ![Elastic Search](Diagrams/metric-beat-config_elasticsearch.png)
 
 ********************************************************************
 *                        Please Note                               *
 * Ansible.config will need to be modified to change the default    *
 * user to your username.                                           *
 * Search for: remote_user                                          *
 ********************************************************************
  
- Once the ansible playbooks have ran successfully and network security rules have been properly configured, you can access ElK using your exteranal IP. Example: http://<your Elk public ip>/apps/kibana.
- Web servers will be accessable via public load balancer ip. Example http://<your public load balancer ip>/setup.php
