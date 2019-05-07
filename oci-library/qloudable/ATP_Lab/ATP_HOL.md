#  Autonmous Transaction Processing
  
## Table of Contents

[Overview](#overview)

[Pre-Requisites](#pre-requisites)

[Practice 1: Sign in to OCI Console and create VCN](#practice-1-sign-in-to-oci-console-and-create-vcn)

[Practice 2: Generate ssh keys and Create Compute instance](#practice-2-generate-ssh-keys-and-create-compute-instance)

[Practice 3: Create ATP instance in OCI and Configure Swing Bench on Compute instance to generate load traffic](#practice-3-create-atp-instance-in-oci-and-configure-swing-bench-on-compute-instance-to-generate-load-traffic)

[Practice 4: Dynamically Scale CPU on ATP instance and verify results](#practice-4-dynamically-scale-cpu-on-atp-instance-and-verify-results)

[Practice 5: Delete the resources](#practice-5-delete-the-resources)

## Overview

Oracle Cloud Infrastructure's Autonomous Transaction Processing Cloud Service is a fully managed, preconfigured database environment. You do not need to configure or manage any hardware, or install any software. After provisioning, you can scale the number of CPU cores or the storage capacity of the database at any time without impacting availability or performance. Autonomous Transaction Processing handles creating the database, as well as the following maintenance tasks:

- Backing up the database
- Patching the database
- Upgrading the database

## Pre-Requisites

- Oracle Cloud Infrastructure account credentials (User, Password, Tenant, and Compartment)  

## Recommended Learning Assets
1. OCI Training : https://cloud.oracle.com/en_US/iaas/training

2. Familiarity with OCI console: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/console.htm

3. Overview of Networking: https://docs.us-phoenix-1.oraclecloud.com/Content/Network/Concepts/overview.htm

4. Familiarity with Compartment: https://docs.us-phoenix-1.oraclecloud.com/Content/GSG/Concepts/concepts.htm

5. Connecting to a compute instance: https://docs.us-phoenix-1.oraclecloud.com/Content/Compute/Tasks/accessinginstance.htm

## Practice-1: Sign in to OCI Console and create VCN


**Note:** OCI UI is being updated thus some screenshots in the instructions might be different than actual UI

**Before You Begin**

***NOTE: Use below login information only if you are using the training plaform (oci.training). For Instructor led training your instructor will provide login information***

- We recommend using Chrome or Edge as the broswer. Also set your browser zoom to 80%

* **Tenant Name:** {{Tenant_Name}}
* **User Name:** {{User_name}}
* **Password:** {{Password}}

1. Sign in using your tenant name, user name and password.

2. Once signed in select the compartment assigned to you from drop down menu on left part of the screen

3. From the OCI Services menu,click **Virtual Cloud Network** under Networking and click **Create Virtual Cloud Network**

**NOTE:** Ensure the correct Compartment is selected under COMPARTMENT list

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL001.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL002.PNG" alt="image-alt-text" height="100" width="100">

4. Fill out the dialog box:

- **Create in Compartment:** Has the correct compartment

- **Name:** Enter easy to re¬member name

- **Create Virtual Cloud Network Plus Related Resources:** Select this option.

- Click **Create Virtual Cloud Network**

- Click **Close**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL003.PNG" alt="image-alt-text" height="100" width="100">

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL004.PNG" alt="image-alt-text" height="100" width="100">

## Practice 2: Generate ssh keys and Create Compute instance

1. Click the Apps icon in the toolbar and select  Git-Bash to open a terminal window.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL006.PNG" alt="image-alt-text" height="100" width="100">

2. Enter command 
```
ssh-keygen
```
**HINT:** You can swap between OCI window, 
git-bash sessions and any other application (Notepad, etc.) by clicking the Switch Window icon 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL007.PNG" alt="image-alt-text" height="100" width="100">

3. Press Enter When asked for ‘Enter File in which to save the key’, ‘Created Directory, ‘Enter passphrase’, and ‘Enter Passphrase again.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL008.PNG" alt="image-alt-text" height="100" width="100">

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

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL009.PNG" alt="image-alt-text" height="100" width="100">

6. Click the apps icon, launch notepad and paste the key in Notepad (as backup)

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL0010.PNG" alt="image-alt-text" height="100" width="100">

7. Switch to the OCI console. From OCI servies menu, Click **Instances** under **Compute** 

8. Click Create Instance. Fill out the dialog box:

- **Name:** Enter a name 

- **Availability Domain:** Select availability domain

- **Image Operating System:** For the image, we recommend using the Latest Oracle Linux available.

- **Choose Instance Type:** Select Virtual Machine

- **Choose Instance Shape:** Select VM shape

- **Configure Boot Volume:** Leave the default

- **Add SSH Keys:** Choose ‘Paste SSH Keys’ and paste the Public Key saved earlier.

- **Virtual Cloud Network Compartment:** Choose your compartment

- **Virtual Cloud Network:** Select the VCN you created in the previous section. 

- **Subnet Compartment:** Choose your compartment. 

- **Subnet:** Choose the first Subnet

9. Click **Create**

**NOTE:** If 'Service limit' error is displayed choose a different shape such as VM.Standard.E2.2 OR VM.Standard2.2

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL0011.PNG" alt="image-alt-text" height="100" width="100">

10. Wait for Instance to be in **Running** state. In git-bash Enter Command:
```
 cd /C/Users/PhotonUser/.ssh
```
11. Enter **ls** and verify id_rsa file exists

12. Enter command 
```
ssh –i id_rsa opc@<PUBLIC_IP_OF_COMPUTE_INSTANCE>
```
**NOTE:** User name is opc

**HINT:** If ‘Permission denied error’ is seen, ensure you are using ‘-i’ in the ssh command

13. Enter ‘Yes’ when prompted for security message

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL0014.PNG" alt="image-alt-text" height="100" width="100">
 
14. Verify opc@<COMPUTE_INSTANCE_NAME> appears on the prompt

15. In the compute instance Update yum, Enter Command, 
```
sudo yum makecache fast
```

16. Install Java and its dependencies, Enter Command, 
```
sudo yum install java-1.8.0-openjdk-headless.x86_64
```

17. Verify Java Installation and version, Enter Command,
```
java -version
```

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_001.PNG" alt="image-alt-text" height="100" width="100">

18. Next we will install Swing bench, Enter command:(No Spaces)
```
curl http://www.dominicgiles.com/swingbench/swingbenchlatest.zip -o swingbench.zip
```

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_002.PNG" alt="image-alt-text" height="100" width="100">

19. Enter command,
```
ls 
```
and verify swinbench.zip file exists. Unzip the file, Enter command,
```
unzip swingbench.zip
```
<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_003.PNG" alt="image-alt-text" height="100" width="100">

## Practice 3: Create ATP instance in OCI and Configure Swing Bench on Compute instance to generate load traffic
**In this section we will create a ATP instance in OCI. We will initially create this 
instance with only 1 OCPU and scale it after generating load test from the compute 
instance created earlier**

1. Switch to OCI console, from services menu click **Autonomous Transaction Processing** under Databse.Click **Create Autonmous Trasnaction Processing Database**. Fill out the dialog box:
- **Compartment:** Ensure correct compartment is selected
- **Display Name:** Provide a name
- **DataBase Name:** Provide a name (can be sameas Display Name)
- **CPU Core Count:** 1
- **Storage(TB):** 1
- **Password:** Provide a password (e.g Oracle098####)

**NOTE:** Do not use &, ), ( in the password due to script limitation that we will execute later.
- **Confirm Password:** Provide the same password
- **License Type:** Choose **SUBSCRIBE TO NEW DATABASE SOFTWARE LICENSES AND THE DATABASE CLOUD SERVICE**

2. Click Create Autonomous transaction Processing Database

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_004.PNG" alt="image-alt-text" height="100" width="100">

3. Once Database is in running state, click its Name. In Database details window click **Service Console** 

**NOTE:** If pop up blocker appears then click 'Allow' **

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_005.PNG" alt="image-alt-text" height="100" width="100">

4. Enter the same password used to create the ATP instance if prompted for password

5. Once signed in click **Administration** and then **Download Client Credentials** (Wallet). In pop up window provide a password. This can be the same password as one used to create the ATP instance or use Oracle123#### and click **Download**.This will download the credentials file that will be used to connect to this Databse instance from the compute instance created eaelier. Note down the zip file name
**NOTE:** The file is generally downloaded in Downloads directory

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_006.PNG" alt="image-alt-text" height="100" width="100">

6. Save the file in and Note down the directory name where the file was saved. We will need to upload this zip file on to public Compute instance
7. In Git bash window change to directory where zip file was saved, Enter command,
``` 
cd <Directory_Name> (cd ~/Downloads)
```
8. Upload the zip file to compute instance, Enter command,
```
sftp  -i /C/Users/PhotonUser/.ssh/id_rsa opc@ <PUBLIC_IP_OF_COMPUTE>
```
9. At sftp prompt Enter command,
```
put <ZIP_FILE_NAME> 
```
**NOTE:** Usually the file name starts with 'Wallet'. Verify the file transfer completed

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_007.PNG" alt="image-alt-text" height="100" width="100">

10. Step 9. Switch to ssh session to the public compute instance. Enter command,
``` 
cd ~/swingbench/bin
```
11. Enter command:
```
which java
```
verify java path is displayed, if no java path is displayed then install java, Enter command:
```
sudo yum install java
```
Answer 'Y' when prompted

12. Enter below commands, replacing the value in < >. 
(This will install a schema to run our transactions against)
```
./oewizard -cf ~/<CREDENTIAL_ZIP_FILE> -cs <DB_NAME>_medium  -ts DATA -dbap <DB_PASSWORD> -dba ADMIN -u soe -p <DB_PASSWORD> -async_off -scale 0.1 -hashpart -create -cl -v
```
**NOTE:** In below example,<CREDENTIAL_ZIP_FILE> is 'Wallet_ATPDB3.zip', <DB_NAME> is ATPDB3, <DB_PASSWORD> is Oracle098####.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_008.PNG" alt="image-alt-text" height="100" width="100">

13. The script will take around 10-15 minutes to populate the Database. Verify the script complete successfully 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_009.PNG" alt="image-alt-text" height="100" width="100">

14. Validate the schema, Enter command:
```
./sbutil -soe -cf ~/<CREDENTIAL_ZIP_FILE> -cs <DB_NAME>_medium -u soe -p <DB_PASSWORD> -tables
```
<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_010.PNG" alt="image-alt-text" height="100" width="100">

15. Next we will configure the load generator file. Enter command:
```
cd ~/swingbench/config
```
16. Enter command:
```
vi SOE_Server_Side_V2.xml
```
(You can also use nano as the editor)

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_011.PNG" alt="image-alt-text" height="100" width="100">

17. Search for string **LogonGroupCount** and change the existing number to **4**. On the next line with string **LogonDelay** change the number to **300**. Finally on line with string **WaitTillAllLogon** change the flag to **false** (case sensitive). Save and quite out of the editor. See below example

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_012.PNG" alt="image-alt-text" height="100" width="100">

18. Now we will generate some load. Enter command:
```
cd ~/swingbench/bin. 
```
Then Enter command:
```
./charbench -c ../configs/SOE_Server_Side_V2.xml -cf ~/<CREDENTIAL_ZIP_FILE>  -cs <DB_NAME>_medium -u soe -p <DB_PASSWORD> -v users,tpm,tps,vresp -intermin 0 -intermax 0 -min 0 -max 0 -uc 128 -di SQ,WQ,WA -rt 0:30.30
```

19. After a few seconds the number in 4th column (TPS)indicating Transactions Per Seconds will stabalize in 2xx range. Remember the current ATP DB instance has only 1 OCPU. 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_013.PNG" alt="image-alt-text" height="100" width="100">

**We have Autonomous Transaction Processing DB instance configured and are testing Transaction per second data using a compute instance.Next we will dynamically scale the OCPU count via OCI console and observe the Transaction Per Second number. We will also see that Dynamic CPU scaling has no impact on the operation of Autonomous Transaction Processing Instance**

## Practice 4: Dynamically Scale CPU on ATP instance and verify results
**In this section we will utilize the dynamic CPU scaling featue of Autonomous Transaction Processing instance and verify Transaction Per second number.**

1. Switch to OCI Console, From OCI Services Menu Click **Autonomous Transaction Processing** under Database

2. Click the name of Autonomous Transaction Processing instance created earlier

3. Click **Scale Up/Down**, in the pop up windowchange CPU CORE COUNT to **4** and click **Update**. Also observe the Automatic backup that are being performed. Instance will be in 'Scaling in Progress' state for some time

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_014.PNG" alt="image-alt-text" height="100" width="100">

4. Switch to ssh session to the compute instance. Ensure the script is still running and Transaction per second data is being diaplyed. As the instance becomes Available the Transactions Per Second number will be higher.

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_015.PNG" alt="image-alt-text" height="100" width="100">

5. You can Scale the number of CPU UP or Down dynamically and obser TPS number change accordingly.

6. Switch to OCI screen and from your ATP instance details page click **Service Console**. From Service Console you can observe Performance data under **Overview** and **Activity** tabs

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_016.PNG" alt="image-alt-text" height="100" width="100">

**We have now demonstrated the Dynamic Scaling of CPU for an ATP instance. We also successfully generated load traffic and observed CPU usage and other indicators for the ATP instance. Next we will delete the resources that we created**

## Practice 5: Delete the resources
**NOTE:**  ***As a practice user will need to figure out any errors encountered during deletion of resources***

1. Switch to  OCI console window

2. From your ATP details page, Hover over the action icon  and Click **Terminate**. In the confimration windoe provide the ATP instance name and click **Terminate Database**

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/ATP_017.PNG" alt="image-alt-text" height="100" width="100">

3. From OCI services menu Click Instances under Compute

4. Locate first compute instance, Click Action icon and then **Terminat** 

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL0016.PNG" alt="image-alt-text" height="100" width="100">


5. Make sure Permanently delete the attached Boot Volume is checked, Click Terminate Instance. Wait for instance to fully Terminate

<img src="https://raw.githubusercontent.com/oracle/learning-library/master/oci-library/L100-LAB/ATP_Lab/img/RESERVEDIP_HOL0017.PNG" alt="image-alt-text" height="100" width="100">


6. From OCI services menu Click **Virtual Cloud Networks** under Networking, list of all VCNs will 
appear.

7. Locate your VCN , Click Action icon and then **Terminate**. Click **Delete All** in the Confirmation window. Click **Close** once VCN is deleted

![]( img/RESERVEDIP_HOL0018.PNG)


**Congratulations! You have successfully completed the lab.**