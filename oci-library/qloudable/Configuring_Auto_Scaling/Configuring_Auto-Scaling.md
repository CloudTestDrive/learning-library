# Configuring Auto Scaling

## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Recommended Learning Assets](#recommended-learning-assets)

[Practice 1: Sign in to OCI Console and create VCN](#practice-1-sign-in-to-oci-console-and-create-vcn)

[Practice 2: Configure instance pool and auto scaling](#practice-2-configure-instance-pool-and-auto-scaling)

[Practice 3: Delete the resources](#practice-3-delete-the-resources)


## Overview

In this lab we will create a compute instance, instance configuration and then configure auto scaling. We will then verify auto scaling feature as configured threshold on CPU are crossed.
Autoscaling enables you to automatically adjust the number of Compute instances in an instance pool based on performance metrics such as CPU utilization. This helps you provide consistent performance for your end users during periods of high demand, and helps you reduce your costs during periods of low demand.

You select a performance metric to monitor, and set thresholds that the performance metric must reach to trigger an autoscaling event. When system usage meets a threshold, autoscaling dynamically allocates resources in near-real time. As load increases, instances are automatically provisioned: the instance pool scales out. As load decreases, instances are automatically removed: the instance pool scales in.

Autoscaling relies on performance metrics that are collected by the Monitoring service. These performance metrics are aggregated into one-minute time periods and then averaged across the instance pool. When three consecutive values (that is, the average metrics for three consecutive minutes) meet the threshold, an autoscaling event is triggered.

A cooldown period between autoscaling events lets the system stabilize at the updated level. The cooldown period starts when the instance pool reaches a steady state. Autoscaling continues to evaluate performance metrics during the cooldown period. When the cooldown period ends, autoscaling adjusts the instance pool's size again if needed.


## Pre-Requisites

- Oracle Cloud Infrastructure account credentials (User, Password, Tenant, and Compartment)  

## Recommended Learning Assets

1. OCI Training : https://cloud.oracle.com/en_US/iaas/training

2. Familiarity with OCI console: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/console.htm

3. Overview of Networking: https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/overview.htm

4. Familiarity with Compartment: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/concepts.htm

5. Connecting to a compute instance: https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/accessinginstance.htm

**Before You Begin**

- We recommend using Chrome or Edge as the broswer. Also set your browser zoom to 80%

## Practice-1: Sign in to OCI Console and create VCN

* **Tenant Name:** {{Cloud Tenant}}
* **User Name:** {{User Name}}
* **Password:** {{Password}}
* **Compartment:**{{Compartment}}

**Note:** OCI UI is being updated thus some screenshots in the instructions might be different than actual UI

1. Sign in using your tenant name, user name and password. Use the login option under **Oracle Cloud Infrastructure**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Grafana/img/Grafana_015.PNG" alt="image-alt-text" height="100" width="100">

2. From the OCI Services menu,click **Virtual Cloud Network** under Networking and click **Create Virtual Cloud Network**

3. Select the compartment assigned to you from drop down menu on left part of the screen

**NOTE:** Ensure the correct Compartment is selected under COMPARTMENT list

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL001.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL002.PNG" alt="image-alt-text" height="100" width="100">

4. Fill out the dialog box:

- **Create in Compartment:** Has the correct compartment

- **Name:** Enter easy to re¬member name

- **Create Virtual Cloud Network Plus Related Resources:** Select this option.

- Click **Create Virtual Cloud Network**

- Click **Close**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL003.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL004.PNG" alt="image-alt-text" height="100" width="100">
              
## Practice 2: Configure instance pool and auto scaling

1. Configure instance pool requires creating a instance configuration. First we will create ssh keys and a compute instance to create instance configuration. 
Click the Apps icon in the toolbar and select  Git-Bash to open a terminal window.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL006.PNG" alt="image-alt-text" height="100" width="100">

2. Enter command 
```
ssh-keygen
```
**HINT:** You can swap between OCI window, 
git-bash sessions and any other application (Notepad, etc.) by clicking the Switch Window icon 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL007.PNG" alt="image-alt-text" height="100" width="100">

3. Press Enter When asked for 'Enter File in which to save the key', 'Created Directory, 'Enter passphrase', and 'Enter Passphrase again.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL008.PNG" alt="image-alt-text" height="100" width="100">

4. You should now have the Public and Private keys:

/C/Users/ PhotonUser/.ssh/id_rsa (Private Key)

/C/Users/PhotonUser/.ssh/id_rsa.pub (Public Key)

**NOTE:** id_rsa.pub will be used to create 
Compute instance and id_rsa to connect via SSH into compute instance.

**HINT:** Enter command 
```
cd /C/Users/PhotonUser/.ssh (No Spaces) 
```
and then 
```
ls 
```
to verify the two files exist. 

5. In git-bash Enter command  
```
cat /C/Users/PhotonUser/.ssh/id_rsa.pub
```
 , highlight the key and copy 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL009.PNG" alt="image-alt-text" height="100" width="100">

6. Click the apps icon, launch notepad and paste the key in Notepad (as backup)

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0010.PNG" alt="image-alt-text" height="100" width="100">

7. Switch to the OCI console. From OCI servies menu, Click **Instances** under **Compute** 

8. Click Create Instance. Fill out the dialog box:

- **Name:** Enter a name 

- **Availability Domain:** Select availability domain

- **Image Operating System:** For the image, we recommend using the Latest Oracle Linux available.

- **Choose Instance Type:** Select Virtual Machine

- **Choose Instance Shape:** Select VM shape

- **Configure Boot Volume:** Leave the default

- **Add SSH Keys:** Choose 'Paste SSH Keys' and paste the Public Key saved earlier.

- **Virtual Cloud Network Compartment:** Choose your compartment

- **Virtual Cloud Network:** Select the VCN you created in the previous section. 

- **Subnet Compartment:** Choose your compartment. 

- **Subnet:** Choose the first Subnet

9. Click **Create**

**NOTE:** If 'Service limit' error is displayed choose a different shape such as VM.Standard.E2.2 OR VM.Standard2.2 OR choose a different AD

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0011.PNG" alt="image-alt-text" height="100" width="100">

10. Wait for Instance to be in **Running** state. 

11. Click instance name and then **Create Instance Configuration**, Fill out the dialog box:

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_001.PNG" alt="image-alt-text" height="100" width="100">

- **CREATE IN COMPARTMENT**: Choose your compartment

- **INSTANCE CONFIGURATION NAME** : Provide a name

Click **Create Instance Configuration**

12. Click **Instances** to go back to Instances page and then click **Instance Pools**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_002.PNG" alt="image-alt-text" height="100" width="100">

13.  Click **Create Instance Pool**. A new dialog box will appear. This is used to create initial configuration of the instance pool such as how many compute instance to create initially, VCN, and Availability domain the instance pool should be created in. Fill out the dialog box:

- **CREATE IN COMPARTMENT**: Choose your compartment

- **INSTANCE POOL NAME** : Provide a suitable name

- **NUMBER OF INSTANCES** : 0 

(This is the number of computes that should be launched when the pool is created. We will start with no compute)

- **INSTANCE CONFIGURATION COMPARTMENT** : Provide your compartment

(This is the compartment where instance configuration will be placed and can only be used in this specific compartmen)

- **INSTANCE CONFIGURATION** : Choose the instance configuration created earlier

(Any computes launched in this pool will inherit shape, image and ssh keys of the compute whose instance configuration we are using)

- **ATTACH A LOAD BALANCER** : Keep it un-checked

(If the instances in this pool need to be placed behing a load balancer then this option can be used. A Load Balancer must already exist. We will not use this option for the lab)

- **AVAILABILITY DOMAIN** : Choose the AD you want to places instances (you can choose first AD)

- **VIRTUAL CLOUD NETWORK COMPARTMENT** : Choose VCN's compartment

- **VIRTUAL CLOUD NETWORK** : Choose your VCN

- **SUBNET COMPARTMENT** : Choose your compartment

- **SUBNET** : Choose the Public Subnet 

- Click **+ Additional Selection** and select a different availability domain for the instance pool. Then, specify the VCN details for the second availability domain.

**We configured instances to be deployed in two different Avaialability domain though they can be deployed in the same Availability domain as long as service limits allow it.**

**For this lab use two different availability domains**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_003.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_003-1.PNG" alt="image-alt-text" height="100" width="100">

14. Click **Create Instance Pool**. Wait for Instance Pool to be in **RUNNING** state (turns green)

15. From the instance pool details page, click **Actions** and choose **Create Auto Scaling Configuration**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_004.PNG" alt="image-alt-text" height="100" width="100">

16. Fill out the dialog box:

- **COMPARTMENT** : Choose your compartment

- **AUTOSCALING CONFIGURATION NAME** : Provide a name

- **INSTANCE POOL** : This should show your instance pool name created earlier

- **COOLDOWN IN SECONDS** : 300 (This is he minimum period of time between scaling actions.)

- **AUTOSCALING POLICY NAME** : Provide a name

- **PERFORMANCE METRIC** : CPU Utilization (This is the Metric to use for triggering scaling actions.)

- **MINIMUM NUMBER OF INSTANCES** : 1 (this is the minimum number of instances that the pool will always have)

- **MAXIMUM NUMBER OF INSTANCES** : 2 (this is the maximum number of instances that the pool will always have)

- **INITIAL NUMBER OF INSTANCES** : 1 (this is how many instances will be created in the instance pool initially)

- **SCALE-OUT OPERATOR** : Greater than (>)

- **THRESHOLD PERCENTAGE** : 10

- **NUMBER OF INSTANCES TO ADD** : 1

- **SCALE-IN OPERATOR** : Less than (<)

- **THRESHOLD PERCENTAGE** : 5

- **NUMBER OF INSTANCES TO REMOVE**  : 1

**Leave other fileds as is**

17. Click **Create**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_005.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_006.PNG" alt="image-alt-text" height="100" width="100">

**We have now created a auto scaling policy that will start with creating 1 compute instnace in the designated pool. Once the CPU utilization is determined to be above 10% for atleast 300 seconds another compute instance will be launched automatically. Once the CPU utilization is determined to be less than 5% for 300 seconds, one compute instance will be removed. At all times there will be atleast 1 compute instance in the pool**

18. Click **Instance Pools** under **Compute** and then your pool name. You should see a Compute instance created. Click the Compute Instance name.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_007.PNG" alt="image-alt-text" height="100" width="100">

19. Note down the Publci IP of compute instnace from the details page (Under **Primary VNIC Information** section). Switch to git bash window, if the ssh session to compute instance is still open then exit out of the session (quit command). 

20. Ensure you are in /C/Users/PhotonUser/.ssh directory.

21. Enter **ls** and verify id_rsa file exists

22. Enter command 
```
ssh -i id_rsa_user opc@<PUBLIC_IP_OF_COMPUTE>
```

**HINT:** If 'Permission denied error' is seen, ensure you are using '-i' in the ssh command

23. Enter 'Yes' when prompted for security message

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0014.PNG" alt="image-alt-text" height="100" width="100">
 
24. We will now install a tool called stress to trigger CPU load. In ssh session to compute instance, Enter command:

```
sudo yum install stress
```

Enter 'Y' when prompted

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_008.PNG" alt="image-alt-text" height="100" width="100">

25. Now start CPU stress, Enter command:

```
sudo stress --cpu 4 --timeout 350
```

***spawn 4 workers spinning on sqrt() with a timeout of 350 seconds.***

26. Switch back to OCI console and navigate to Instance pool details page. Click your instance name and scroll down to **Metric** screen, you should see CPU spiking up after a minute or so.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_009.PNG" alt="image-alt-text" height="100" width="100">

27. Navigate to your Instance Pool details page. In about 3-4 minutes (time configured when we created auto scale configuration), status of Pool should change to **Scaling** and a second compute instance should launch.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_010.PNG" alt="image-alt-text" height="100" width="100">

**This is since our criteria of CPU utilization > 10 was met**

28. Switch back to git bash window and if the stress tool is still running, Pree Ctrl + C to stop the script.

29. Switch back to OCI console window and navigate to your compute instance details page. Verify CPU utilization goes down after a minute.

30. Navigate to Instanse pool details page and after 3-4 minute Instance pool status will change to **Scaling** . Additional compute instance will be deleted. 

**This is becuase our criteria of CPU utilization < 5 is met**

## Practice 3: Delete the resources

1. Switch to  OCI console window

2. From Instance Pool Details page, Click **Terminate** under **Action**. Provide Instance Pool name in the pop up dialog box and click **Terminate**. This will delete the pool along with the compute instance and auto scale configuration.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_011.PNG" alt="image-alt-text" height="100" width="100">


3. Navigate to **Instances** Under **Compute**. Click **Instace Configuration** and for your Instance Configuration Click Delete under the three Vertical dots.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/Configuring_Auto_Scaling/img/Auto_Scaling_012.PNG" alt="image-alt-text" height="100" width="100">

4. From OCI services menu Click **Virtual Cloud Networks** under Networking, list of all VCNs will 
appear.

5. Locate your VCN , Click Action icon and then **Terminate**. Click **Delete All** in the Confirmation window. Click **Close** once VCN is deleted

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/qloudable/OCI_Quick_Start/img/RESERVEDIP_HOL0018.PNG" alt="image-alt-text" height="100" width="100">

***Congratulations! You have successfully completed the lab. ***

