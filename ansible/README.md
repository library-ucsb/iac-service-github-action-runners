# Ansible Playbook(s): JIRA Legacy

## What is this?
This is a repo of Ansible Plays specifically for the Legacy, on-premises JIRA instance.

## Usage

#### Requirements

* This repo
* Ansible installed
* SSH access to the target hosts
* Ability to elevate privileges via SUDO on the target hosts
* Secrets file with SS-provided passphrase to unlock the **ansible-vault** AES encrypted content. [Secret Server: ansible vault passphrase](https://epm.library.ucsb.edu/app/#/secret/2969/general)

#### Initialization

After checking the repo out locally, you will need to import any ansible collection or role dependencies the playbook requires.  These are defined in the **requirements.yml** file.  In order to achieve this, you simply need to run the **initialize.sh** bash script included in the base of the repo.  This script can be run at any time.

```
$ ./initialize.sh 
```
Additionally you will need to install the following **pip3** modules
```
$ pip install --upgrade pyvmomi
$ pip install --upgrade setuptools
$ pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git
```



#### How to Run

The following are the various common ways of using this playbook.

**DRY-Run the complete Playbook**
```
$ ansible-playbook --inventory=inventory.yml site.yml --diff --check
```

**Run the complete Playbook**

```
$ ansible-playbook --inventory=inventory.yml site.yml --diff
```

**Run a specific 'tagged' portion of the playboook**
```
$ ansible-playbook --inventory=inventory.yml site.yml --diff --tags service:sshd
```

**List the tags that the playbook has defined**
```
$ ansible-playbook --inventory=inventory.yml site.yml --list-tags

```


