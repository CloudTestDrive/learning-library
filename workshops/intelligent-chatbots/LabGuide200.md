Integrating Instant App and Web channel in the CafeteriaAssistance Bot
===========================================================================
### Objective

- Adding Instant App feature to the Bot.
- Integrate the Bot with Web Page

### Features Overview

Intelligent Bots in Oracle Mobile Cloud Enterprise (or just Bots) provide lot of features which can be used based on the requirements like Instant App, Translation Services, Bot-Agent handoff, Quality, and Channels support for the Bot like Web Channel, iOS App, Android App, Facebook Messenger, and some other channels supported using webhook.

### **Step 1**: Adding Instant App feature to the Bot

Natural language conversations are, by their very nature, free-flowing. But they may not always be the best way for your Bot to collect information from its users. For example, some situations like entering credit card or passport details require users to enter specific and precise information. To help your Bot’s users to enter this type of information easily, your Bot can call an Instant App, which provides forms with labels, options, choices, check boxes, data fields, and other UI elements. The CafeteriaAssistance Bot calls an Instant app for the Feedback that walks users through a series of steps to provide feedback. 

The CafeteriaAssistance and the Instant App show you how your Bot transitions to an Instant app, how Bots pass variable values to an Instant App, and how the Instant app returns the user to the bot.

![D:\\Workshop\_Bot\\BotsLab2\\Capture1.PNG](images/100/media/image1.png)

Once you click on the Link button, you will get a form like below to fill:

![](images/100/media/image2.png)

**The Instant App Builder**


You can build the Instant Apps using the Instant App Builder, which you access by clicking Instant Apps in the Bots landing page.

![D:\\Workshop\_Bot\\BotsLab2\\Capture2.PNG](images/100/media/image3.png)
Instant apps are made up of sets of panes, which gets displayed one at a time. You can populate these panes with various elements that can display charts or images and collect customer data using widgets like checkboxes, radio buttons, and file upload functions.
![D:\\Workshop\_Bot\\BotsLab2\\Capture3.PNG](images/100/media/image4.png)

To get you started, you can customize the templates that display in the landing page. You can also start from scratch by clicking the **New Instant App** tile. ![This is an image of the instant app landing page.](images/100/media/image5.png)

**Creating an Instant App for feedback**

Once you click new Instant app, it will provide some pre-defined templates which you can use after edit. For our CafeteriaAssistance Bot feedback, choose Customer Survey template.

#### ![D:\\Workshop\_Bot\\BotsLab2\\Capture4.PNG](images/100/media/image6.png)

#### **App Settings**

App Settings is where you manage general information about your Instant App.

**Name**

The Instant App name is your internal way of identifying the specific Instant App among all your other Instant Apps on main page. The name can include letters, numbers, and special characters. The name is not exposed to the end user, as you can see in the image Internal Description below.

**ID**

The Instant App ID is how you reference the Instant App if you need to call it from somewhere, like from a Bot, an API, or a JavaScript Snippet. When you create a new Instant App, the ID itself is derived from the Instant App name that you enter. The ID cannot contain special characters or spaces. You can edit the ID at any point, but if you do change it, you will need to update any references to the previous ID.

**Icon**

An icon is the image that shows up on the Instant App tile on the main Instant Apps page. You can remove unwanted icons by clicking on the red X on the top right corner. Then, you can drag and drop an icon, add an icon via regular file lookup, or input a URL.

Write Name as “CafeteriaAssistanceBotFeedback” and same will be taken by default as ID. Please make a note of the ID as you will use the same to call Instant App from the Bot YAML.

![D:\\Workshop\_Bot\\BotsLab2\\Capture6.PNG](images/100/media/image7.png)

**Internal Description**

The Internal Description is what shows up on the Instant App’s tile on the main Instant Apps page as a reminder of the particular Instant App’s function.

**Initially Active**

When you create a new Instant App, you can set the Instant App to be Initially Active before you save it. If you set it to active, the Instant App can be activated from the Bot. If you do not set it to Initially Active, then you can always set it to Active from the Instant App tile on the main menu. You can see which apps are inactive by the Inactive display next to the Instant App name.

**Invite Message and Link**

The Invite Message is a pre-configured message that is sent to customers as an invitation to use the Instant App, and it is the first thing a customer sees.  Include the {link} in the position where you want the Instant App link, and do not change anything else. The message, including the link, cannot exceed 160 characters.

![D:\\Workshop\_Bot\\BotsLab2\\Capture7.PNG](images/100/media/image8.png)

Once you have followed the above given instructions, don’t forget to click on the save button.

Now add the below lines after in the CafeteriaAssistanceBot lab1 YAML flow like below:

**Now add the below YAML code in the flow:**

```
interactive:
   component: "System.Interactive"
   properties:
     sourceVariableList:
     variable: "feedback"
     id: "Cafeteria_Assistance_Feedback_Bot"
     prompt: "Please provide us feedback using the below link"
   transitions: {}
 feedbackDone:
   component: "System.Output"
   properties:
     text: "Thank's for providing your valuable feedback. Have a nice day!"
     keepTurn: true
   transitions:
     return: "feedbackDone"
```

Follow the below screen for the same:

![D:\\Workshop\_Bot\\BotsLab2\\Capture16.PNG](images/100/media/image9.png)

Now click “Validate”, “Train” and “Run” button to test the Instant App:

![D:\\Workshop\_Bot\\BotsLab2\\Capture17.PNG](images/100/media/image10.png)

Now click the Link button, and you will be able to see the Feedback page like below:

![](images/100/media/image11.png)

Now fill the form and click on “Submit Feedback” button:

![D:\\Workshop\_Bot\\BotsLab2\\Capture15.PNG](images/100/media/image12.png)

Now, if you go back to the Bot you can see the response like below:

![](images/100/media/image13.png)


### **Step 2**: Integrating the Bot with website page as a channel

**Channels**

To introduce your Bot to the users of these services, you need to configure a channel.

OMCe provides channel for Facebook Messenger, Web, Android and iOS messaging platforms and a generic channel called Webhook that you can use for other messaging services. Your Bots are limited to messaging services; using one of our SDKs, you can integrate the Bot in web pages.


**Tip:**

Your Bot can run on any messaging service that supports Webhooks, calls that allows real-time messaging without polling. You don’t need to implement a Webhook to get your Bot running on Facebook Messenger. All you need to configure the Facebook channel is the keys that are generated by both Facebook and Bots. Setting up the Webhook channel for other messaging services require you to perform a few more tasks in addition to the channel configuration, like setting up an HTTP server with a Webhook for sending and receiving your Bot’s messages.

Click on the setting option:

![D:\\Workshop\_Bot\\image2.PNG](images/100/media/image25.png)

Now, click on “Channels”. Then, click on the green colored button called “Channel”. 

![D:\\Workshop\_Bot\\BotsLab2\\web1.PNG](images/100/media/image26.png)

Provide Name as “Webchannel” or any other name. After that, click on “Channel Type”, you can see all the available channel options. In these options, select “Web”. And, then click on create green button.

![D:\\Workshop\_Bot\\BotsLab2\\web4.PNG](images/100/media/image27.png)

Now, you will get the below screen note down the App Id because you have to use this while integrating the Bot to the web page:

![D:\\Workshop\_Bot\\BotsLab2\\web5.PNG](images/100/media/image28.png)

Now, unzip the below folder and then open index.html file which is inside the html folder in any editor.

[CafeteriaAssistanceBotWebPage.zip](https://github.com/AdityaVishwekar/IntelligentChatBots/blob/master/workshops/intelligent-chatbots/images/CafeteriaAssistanceBotWebPage.zip)

In the index.html file change the appId like below:

![D:\\Workshop\_Bot\\BotsLab2\\page1.PNG](images/100/media/image30.png)

Once you change the appId, save the file and open in any browser (preferred Mozilla Firefox). It will be seen as the below screen:

![D:\\Workshop\_Bot\\BotsLab2\\webpage.PNG](images/100/media/image31.png)

Once you click on the right-bottom corner image - ChatBot icon (marked as red in above snapshot), you can see the below screen:

![D:\\Workshop\_Bot\\BotsLab2\\webpage2.PNG](images/100/media/image32.png)

Now your ChatBot is integrated with the web page. To do testing type “ShowMenu” in Type a message and then click on the “Send” button.

**Note:** You can download all the related files from [Github](https://github.com/AdityaVishwekar/IntelligentChatBots/blob/master/workshops/intelligent-chatbots/images/All_files.zip) 
