Updated: April 11, 2017

Create a Skill in Oracle Autonomous Digital Assistant
=========================

## **Introduction**
This is the first of several labs that are part of the Oracle Public Cloud Digital Assistant ChatBot workshop. This workshop will walk you through the process of creating a chatbot interface that can be intergrated in any number of ways using the Oracle Public Cloud.

In Oracle's Autonomous Digital Assistant chatbots are called Skills. You can think of your Skill as a virtual personal assistant, one that completes a task through a combination of text messages and simple UI elements like select lists. While a Skill can open your enterprise to messaging, it's not a replacement for a mobile or web app. It instead provides a new channel to existing applications.

![](images/100/image1.png)

Skills enable you to connect your users to the enterprise while engaging them in naturalistic conversation. The Skills you create can respond to free-form user input because the Bots' language intelligence framework uses machine learning. While users are probably aware that they're chatting with a Bot, they don't need to limit or constrain their input.

You can build the Skill, test it, and configure it to run on different messaging services using the Skill Builder, a simple user interface. Although, you can run this Skill through Facebook Messenger and other platforms or websites, you need only write the Skill once. Digital assistant optimizes the Bot for the target platform.

<!-- ### **How Do you create a Chatbot?**

Here's a bird's-eye view of bot development.
![Description of bots-overall-process.png follows](images/100/image2.png)
**Description of the illustration bots-overall-process.png**

**Create Intents**---You can start by creating Intents. Intents illustrate your use case by describing the various actions that your Bot helps its users complete. If your Bot enables users to perform various banking transactions, for example, then you could create intents like CheckBalance or TransferMoney. Intents not only describe what your Bot can do, but, they are also the key to your Bot's intelligence. They enable it to recognize user input because each Intent has a set of typical user statements known as utterances associated with it. While these phrases share the same meaning, they make your Bot resilient because they're also varied (for example, What's my savings account balance? and How much is in my checking account?).

**Train the Bot**---To enable your Bot to reference Intents when it parses the user input, you need to train it. Specifically, you need to train it with the Intents and their utterances (collectively, the training data), so that it can resolve the user input to one of the Intents. By training your Bot, you leverage the language intelligence which is at the core of the Bots platform. Its algorithms enable your Bot to not only recognize the sample phrases that belong to each intent, but similar phrases as well.

**Create Entities**---In some cases, you may need to provide some context to enable your Bot to complete a user request. While some user requests might resolve to the same intent, they are nonetheless asking for different things (for example, What's my savings account balance? and How much is in my checking account? would both resolve to the CheckBalance intent). To clarify the request, you would add an entity. Using the banking Bot example, an entity called AccountType, which defines values called checking and saving would enable the Bot to parse the user request and respond appropriately.

**Integrate Custom Components**---At this point, your Bot can recognize input, but it can't respond to it. To put your Bot's intelligence to work, you need to add components and then later, create a dialog flow. Components enable your Bot to do its job. There are two types of components: the ones provided by Bots that perform functions ranging from holding the resolved Intent to outputting text, and the ones that you provide. The components belonging to this latter category are known as custom components. Unlike the built-in components that you can use in any Bot that you build with the Bots platform, the custom components perform tasks that are specific to a single bot, like checking a user's age, or returning account information. Custom components don't reside within the Bots platform, so for your Bot to use them, you need to access them through a REST service.

**Create the Dialog Flow**---Next, you need to give the Bot the wherewithal to express its intelligence to its users by creating the dialog flow. The dialog flow describes how your Bot reacts as different Intents are resolved. It defines what your Bot says to its users, how it prompts them for input, and how it returns data. Think of the dialog flow as a flow chart that's been transposed to a simple markdown language. In Bots, this markdown language is a version of YAML called OBotML.

**Test the Bot**---Once you've started your dialog flow, you can chat with your Bot to test it out. You can see how the Tester works in [Building Your First Bot](https://docs.oracle.com/en/cloud/paas/mobile-suite/develop/bot-basics1.html#GUID-0C3BF9FB-563D-427C-8536-4E98C115CDB0).

**Configure Channels**---Users subscribe to your bot through messaging platforms such as Facebook Messenger, iOS App, Android App, and Web Page. You don't have to rewrite your Bot for each messaging platform, but you do need to configure a channel for each one. Bots enables you to integrate with Facebook Messenger quickly through its Facebook Channel. You don't need to craft any REST calls to run your Bot on Facebook. Instead, you complete a UI using artifacts that are generated by both Facebook and Bots. See [Running Your Bot on Facebook Messenger](https://docs.oracle.com/en/cloud/paas/mobile-suite/develop/bot-channels.html#GUID-CCEE3FD5-21F2-4288-9450-0D24202F2615). To integrate your Bot with other services, Bots provides the Webhook channel. You build your own Webhooks for these non-Facebook integrations. -->


## Objectives

- Create a simple Cafeteria Assistance ChatBot
- Create four intents
    - Create utterances
- Add an entity and associate it with your intent for this chat bot creation.
- Define the Conversation Flow of your bot.
- Validate, train and test your Skill.

Create a ChatBot with Intents, Entities, Utterances and Flow
----------------------------------------------------------------------------

### **Step 1**: Create a simple Cafeteria Assistance ChatBot

- When chatbotLab is finished provisioning select the menu icon and select **Digital Assistant UI**.

![](images/100/5b.png)

- Click the hamburger in the top left to open the side menu. Expand **Development** and select **Skills**.
Click **New Skill**.

![D:\\Workshop\_Bot\\image1.PNG](images/100/5c.png)

- Give the skill a name such as **CafeteriaAssistance_Bot**, version it and add a brief description. Click create and your bot is live.

![](images/100/6.png)

- You are taken to the home page for your Skill. Here on the left, you can see a list of icons you can use to navigate to your **Intents, Entities, Flow, Resource Bundles, Q&A, Components, Settings and Quality**.

![D:\\Workshop\_Bot\\image2.PNG](images/100/image5.png)

### **Step 2**: Add an Intent, Entity for show menu

- From the homepage of your Skill, click the **Intent** icon present on left-side navigation bar and then click the green **Intent** button.

![](images/100/image6.png)

- This Intent will be used to show the cafeteria menu. Enter **ShowMenu** as the Intent name, and then provide a description. These values are automatically saved, so you do not need to explicitly save them. As you create artifacts, you may notice a message in the lower right corner that your work has been saved.

![D:\\Workshop\_Bot\\Image5.PNG](images/100/7.png)

- Now that you have an intent, to express what a show menu is. In the Examples area add the following text: **show menu**, followed by a return.

![D:\\Workshop\_Bot\\image6.PNG](images/100/7b.png)

- Add another example utterance: **"what do you have?"**

- Include the list of example utterances below to your intent, each followed by a return. Notice that the examples do not need to be in the form of a question, they can be a statement as well.
    -   **hi**
    -   **Hi There**
    -   **menu please**
    -   **show menu**
    -   **What do you have?**
    -   **What food do you have**


### **Step 3**: Add OrderFood intent:

![](images/100/image10.png)

- Create another intent by clicking **+Intent** near the top left. Call this one "OrderFood" and use the below utterances.  

    *   **May I have some food**
    *   **Food please**
    *   **I want food**
    *   **order food**
<!-- TODO: are utterances case sensitive? if not, remove #5 -->

<!-- <a name="step-4-add-an-intent-entity-for-order-beverage"></a> -->
### **Step 4**: Add OrderBeverages intent:

![](images/100/9.png)

- Create another intent named “OrderBeverages” with the following utterances.

    *   **Beverages please**
    *   **Can I get beverages.**
    *   **I want beverages**
    *   **What kind of Beverages do you have?**
<!-- TODO: are utterances case sensitive? if not, remove #4 -->


<a name="step-5-add-an-intent-entity-for-exit-flow"></a>
### **Step 5**: Add ExitFlow intent:

![](images/100/10.png)

- The final intent will be called **ExitFlow** using these utterances.

    *   **Bye**
    *   **Great**
    *   **Thank You**
    *   **Thanks**
<!-- TODO: are utterances case sensitive? if not, remove #5 -->

### **Step 6**: Create Entity and Add to OrderFood Intent

- If you want the list of options i.e. sizes (based on the quantity) in this Bot for the different items users can order, you would probably need to show the list of different available sizes of the item. On the left-navigation bar, click the second icon down named **"Entities"** and you'll be able to view pre-populated system entities. These are standard entities that can be used in your ChatBot without having to explicitly define them.


![](images/100/image13.png)

- Click the green **Entity** button and then enter **ItemSize** as the entity name and a brief description.

![D:\\Workshop\_Bot\\screen9.PNG](images/100/image14.png)

- Now that you have an Entity, you need to provide some values that could be used. In our case of **ItemSize**, you would want to use values that represent size you could query for the order. In the **Configuration** area, ensure the **Type** property is set to Value List (To create the list of values based on the requirement) and then click the green **Value** button.


![D:\\Workshop\_Bot\\Capture10.PNG](images/100/image15.png)

- In the popup dialog, enter **Small** as the value and **small** as a synonym. Then click **Create**.

![](images/100/image16.png)

- Then, add a second value named **Medium** and this time add a synonym of **normal**.

![](images/100/image17.png)

- Finally, add a third value named **Large** and use **big** as the synonyms.

![](images/100/image18.png)

- When finished, your entity definition should look like the image shown below.

![](images/100/image19.png)

- Now you have 4 intents (ShowMenu, OrderFood, OrderBeverages and ExitFlow) and an entity named as ItemSize.  In the next steps you will associate the **OrderFood** and **OrderBeverages** intents with **ItemSize** entity.

- On the left-navigation bar, click the **Intent** icon, and on the right, find the **Intent Entities** area. Click the green **Entity** button and select **ItemSize** from the list, after selection your screen will look like image shown below:

![D:\\Workshop\_Bot\\Capture12.PNG](images/100/image20.png)

- The entity is added and a required flag is set. If you want you can remove the entity by clicking the **(x)** to the right of the entity name. Do not remove the entity from your intent.

### **Step 7**: Define the Conversation Flow

- With the intent and entity created, the next thing we need is a Dialog flow. Click the Flow icon on the left bar; some code has been added to display hello when activated.  For the sake of brevity, you can simply replace all the code with the below file content (Please click the below file to copy the content):

```
metadata:
  platformVersion: "1.1"
main: true
name: "CafeteriaAssistanceBot"
context:
  variables:
    iresult: "nlpresult"
    foods: "string"
    beverages: "string"
    dummy: "string"
    orderedFood: "string"
    orderedFoodImage: "string"
    itemSize: "ItemSize"
    location: "string"
    cardsRangeStart: "int"
    feedback: "string"
defaultTransitions:
  error: "DefaultErrorHandler"
  actions:
    unexpectedAction: "HandleUnexpectedAction"
    ExitFlow: "exitFlow"
states:
  setCardsRangeStart:
    component: "System.SetVariable"
    properties:
      variable: "cardsRangeStart"
      value: 0
    transitions: {}
  LoadFoods:
    component: "System.SetVariable"
    properties:
      variable: "foods"
      value:
      - name: "Afghani Chicken Biryani"
        description: "We took the all-time favorite and made it better by giving it an Afghani touch."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685529/CafeteriaAssistant/Afghani-Chicken-Biryani_2.jpg"
      - name: "Black Forest Cake"
        description: "Black forest cake with a sinful layer of rich chocolate mousse."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685529/CafeteriaAssistant/836x663-Black-Forest.jpg"
      - name: "Big Crunch Chicken Classic Burger"
        description: "Juicy chicken patty seared to perfection. Then, stuffed between soft oatmeal buns along with fresh veggies. So good, you will be tongue-tied."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685528/CafeteriaAssistant/Big-Crunch-Chicken-Classic-Burger.jpg"
      - name: "Big Crunch Veg Cheese Burger"
        description: "Flavourful veggie patty cooked to perfection. Then, stuffed between soft oatmeal buns with handpicked veggies. Sure to make your eye widen and jaw drop."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685528/CafeteriaAssistant/Big-Crunch-Veg-Cheese-Burger_2.jpg"
      - name: "Chilli Cheese Toastizza"
        description: "Get cheesy with this crispy toast topped with onions, tomatoes and capsicum, loaded with cheese and sprinkled with chilli flakes"
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685528/CafeteriaAssistant/Chilli-Cheese-Toastizza_2.jpg"
      - name: "Egg Wrap"
        description: "For the Desi at heart! Classic Indian egg bhurji with onions, capsicum and paprika, folded into a scrumptious Malabar paratha wrap."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685529/CafeteriaAssistant/Egg-Wrap_2.jpg"
      - name: "Crackling Brownie"
        description: "A Rich gooey classic American fudge brownie"
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685529/CafeteriaAssistant/836x663-Brownie.jpg"
      - name: "Crispy Veg Wrap"
        description: "We made veggies taste good. You can thank us later."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522685528/CafeteriaAssistant/CrispyVeg_2.jpg"
    transitions: {}

  LoadBeverages:
    component: "System.SetVariable"
    properties:
      variable: "beverages"
      value:
      - name: "Alphonso Mango Milkshake"
        description: "Discover delight in every sip with this divine, sumptuous mango treat."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769202/CafeteriaAssistant/mango-milkshake-recipe.jpg"
      - name: "Aztec single origin Coffee"
        description: "A delightful international gourment blend that includes a double shot of espresso brewed from a blend of imported coffee beans topped with steamed and foamed milk."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769201/CafeteriaAssistant/Aztec_single_origin_Coffee.jpg"
      - name: "Classic Lemonade"
        description: "Get refreshed! Introducing a lemonade with a touch of mint and ginger that make for the perfect sip, when you are chillin'."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769202/CafeteriaAssistant/Classic_Lemonade.jpg"
      - name: "Green Tea"
        description: "An aromatic tea that does wonders for your health. The leaves are mixed with Jasmine flower bits that give a distinct fragrance and flavour. Can be served either with milk or lemon."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769202/CafeteriaAssistant/Green_Tea.jpg"
      - name: "Cool Blue"
        description: "Cool Blue, a syrupy blue blend skating on crushed ice! Zap away that summer heat and enjoy a tall glass of pure shock, as you plunge your mind into CCD's summer favourite!"
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769201/CafeteriaAssistant/Cool_Blue.jpg"
      - name: "Macchiato"
        description: "Macchiato, meaning 'Marked' is bold espresso with a small amount of foamed milk to compliment it."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769202/CafeteriaAssistant/Macchiato.jpg"
      - name: "Cold Cocoa Latte"
        description: "Smooth, creamy ice cold chocolate milkshake. Who can say no to this classic beverage?"
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769201/CafeteriaAssistant/Cold_Cocoa_Latte.jpg"
      - name: "Café Americano"
        description: "A double shot of espresso topped with hot water, served with a complimentary milk on the side."
        image: "http://res.cloudinary.com/psjsaravana/image/upload/v1522769202/CafeteriaAssistant/Caf%C3%A9_Americano.jpg"
    transitions: {}  
  Intent:
    component: "System.Intent"
    properties:
      variable: "iresult"
    transitions:
      actions:
        unresolvedIntent: "Unresolved"
        OrderBeverages: "OrderBeverages"
        ShowMenu: "ShowMenu"
        OrderFood: "OrderFood"
  Unresolved:
    component: "System.CommonResponse"
    properties:
      metadata:
        responseItems:
        - type: "text"
          text: "Sorry, I don't understand you, I am not human. Please try another\
            \ sentence."
          name: "Sorry"
          separateBubbles: true
      processUserMessage: false
    transitions:
      return: "done"
  ShowMenu:
    component: "System.CommonResponse"
    properties:
      metadata:
        responseItems:
        - type: "text"
          text: "Hello ${profile.firstName}, this is our menu for today:"
          name: "hello"
          separateBubbles: true
          actions:
          - label: "Food"
            keyword: "1"
            type: "postback"
            payload:
              action: "Food"
            name: "Food"
          - label: "Beverages"
            keyword: "2"
            type: "postback"
            payload:
              action: "Beverages"
            name: "Beverages"         
      processUserMessage: true
    transitions:
      actions:
        Food: "OrderFood"
        Beverages: "OrderBeverages"
        textReceived: "Intent"
  OrderFood:
    component: "System.CommonResponse"
    properties:
      metadata:
        responseItems:
        - type: "text"
          text: "Here are our food items you can order today"
          separateBubbles: true
          rendered: "<#if cardsRangeStart?number == 0>true<#else>false</#if>"
          name: "Our foods"
        - type: "text"
          text: "Some more items for you:"
          separateBubbles: true
          rendered: "<#if cardsRangeStart?number != 0>true<#else>false</#if>"
          name: "More food items"
        - type: "cards"
          cardLayout: "vertical"
          name: "FoodCards"
          actions:
          - label: "More food items"
            type: "postback"
            rendered: "<#if cardsRangeStart?number+4 < foods.value?size>true<#else>false</#if>"
            payload:
              action: "more"
              variables:
                cardsRangeStart: "${cardsRangeStart?number+4}"
            name: "More"
          cards:
          - title: "${foods.name}"
            description: "${foods.description}"
            imageUrl: "${foods.image}"
            name: "FoodCard"
            iteratorVariable: "foods"
            rangeStart: "${cardsRangeStart}"
            rangeSize: "4"
            actions:
            - label: "Order Now"
              type: "postback"
              payload:
                action: "order"
                variables:
                  orderedFood: "${foods.name}"
                  orderedFoodImage: "${foods.image}"
              name: "Order"
          channelCustomProperties:
          - channel: "facebook"
            properties:
              top_element_style: "large"
      processUserMessage: true
    transitions:
      actions:
        order: "AskItemSize"
        more: "OrderFood"
        textReceived: "Intent"

  OrderBeverages:  
    component: "System.CommonResponse"
    properties:
      metadata:
        responseItems:
        - type: "text"
          text: "Here are our beverages you can order today"
          separateBubbles: true
          rendered: "<#if cardsRangeStart?number == 0>true<#else>false</#if>"
          name: "Our beverages"
        - type: "text"
          text: "Some more items for you:"
          separateBubbles: true
          rendered: "<#if cardsRangeStart?number != 0>true<#else>false</#if>"
          name: "More beverages"
        - type: "cards"
          cardLayout: "vertical"
          name: "BeveragesCards"
          actions:
          - label: "More beverages items"
            type: "postback"
            rendered: "<#if cardsRangeStart?number+4 < beverages.value?size>true<#else>false</#if>"
            payload:
              action: "more"
              variables:
                cardsRangeStart: "${cardsRangeStart?number+4}"
            name: "More"
          cards:
          - title: "${beverages.name}"
            description: "${beverages.description}"
            imageUrl: "${beverages.image}"
            name: "BeveragesCard"
            iteratorVariable: "beverages"
            rangeStart: "${cardsRangeStart}"
            rangeSize: "4"
            actions:
            - label: "Order Now"
              type: "postback"
              payload:
                action: "order"
                variables:
                  orderedFood: "${beverages.name}"
                  orderedFoodImage: "${beverages.image}"
              name: "Order"
          channelCustomProperties:
          - channel: "facebook"
            properties:
              top_element_style: "large"
      processUserMessage: true
    transitions:
      actions:
        order: "AskItemSize"
        more: "OrderFood"
        textReceived: "Intent"
  AskItemSize:
    component: "System.CommonResponse"
    properties:
      variable: "itemSize"
      nlpResultVariable: "iresult"
      maxPrompts: 2
      metadata:
        responseItems:
        - type: "text"
          text: "<#if user.botsUserError == 'true'>Invalid size, please try again.\
            \ </#if>What size do you want?"
          name: "What size"
          separateBubbles: true
          actions:
          - label: "${enumValue}"
            type: "postback"
            payload:
              action: ""
              variables:
                itemSize: "${enumValue}"
            name: "size"
            iteratorVariable: "itemSize.type.enumValues"
      processUserMessage: true
    transitions:
      actions:
        cancel: "Intent"
      next: "AskLocation"
  AskLocation:
    component: "System.CommonResponse"
    properties:
      variable: "location"
      metadata:
        responseItems:
        - text: "To which location do you want the item to be delivered?"
          type: "text"
          name: "What location"
          separateBubbles: true
        globalActions:
        - label: "Send Location"
          type: "location"
          name: "SendLocation"
      processUserMessage: true
    transitions:
      actions:
        cancel: "Intent"
      next: "Confirmation"
  Confirmation:
    component: "System.CommonResponse"
    properties:
      metadata:
        responseItems:
        - text: "Thank you for your order, your ${itemSize} ${orderedFood} \
            \ will be delivered in 10 minutes at GPS position ${location.value.latitude},${location.value.longitude}!"
          type: "text"
          name: "conf"
          separateBubbles: true
        - type: "attachment"
          attachmentType: "image"
          name: "image"
          attachmentUrl: "${orderedFoodImage}"
      processUserMessage: false
    transitions:
      return: "done"
  HandleUnexpectedAction:
    component: "System.Switch"
    properties:
      variable: "user.botsUnexpectedAction"
      values:
      - "food"
      - "beverages"
      - "order"
    transitions:
      actions:
        NONE: "ActionNoLongerAvailable"
        food: "OrderFood"
        beverages: "OrderBeverages"
        order: "AskItemSize"
  ActionNoLongerAvailable:
    component: "System.Output"
    properties:
      text: "Sorry, this action is no longer available"
    transitions:
      return: "done"
  DefaultErrorHandler:
    component: "System.Output"
    properties:
      text: "Unexpected error occurred, please contact the helpdesk"
    transitions:
      return: "done"
  exitFlow:
    component: "System.Output"
    properties:
      text: "Alright. Have a nice day!"
      keepTurn: true
    transitions: {}
```
### **Step 8**: Validate, Train and Test your ChatBot

- Finally, click the **Validate** button in the upper right corner and you should see a message that there were no problems found in your bot.

<!-- - In the next section, you train the Bot to recognize responses that might be entered and then test it.

- In this part of the tutorial, you run the training tool on the Bot. This will train the Bot allowing it to understand similar user inputs to the example utterances used when building the Bot. -->

- In the upper right, click the **Train** button. This will kick-off a process that will run an algorithm to take your example utterances and build the model that will be used to ascertain the intents and entities. Anytime the ChatBot platform recognizes your Skill needs to be trained, it will display an exclamation point within the train button. Once the training is complete the exclamation point is replaced by a check mark.

![D:\\Workshop\_Bot\\Capture13.PNG](images/100/image22.png)

![](images/100/image23.png)

  **Note:** Oracle provides three models that learn from your corpus: Trainer Ht ,Trainer Tm and Q&A Training. Each uses a different algorithm to reconcile the user input against your intents. Trainer Ht uses pattern matching while Trainer Tm detects variations in user input and Q&A training is used to train for the pre-defined question and answers. You'd typically follow training process when you're creating intents:

    a.  Choose Trainer Ht from the options.

    b.  Refine your corpus, retrain with Trainer Ht. Repeat as necessary.

  The Train button (<img src="images/100/image24.png" title="This is an image of the "dirty" Train button" class="infra" />) activates whenever you add an intent or when you update an intent by adding, changing, or deleting its utterances. To bring the training up to date, choose a training model and then click **Train**. The model displays an exclamation point whenever it needs training. When its training is current, it displays a check mark.

- To test the ChatBot, click the **play** (Run) icon in the upper right of the page. This takes you into the tester

![D:\\Workshop\_Bot\\image3.PNG](images/100/playButton.png)

- Where you can see three tabs: Conversation, Intent/QnA and View JSON.

![](images/100/26.png)

- What you type in at the bottom in the **Message** area, is what will be sent to the skill when you click the **Send** button.

- Let's start out simple to test the bot: In the Message area, type **Show menu** and then click the **Send** button.

![](images/100/26b.png)

- The bot will show cafeteria menu for you with two options.

- Click one of the option i.e Food and the details for that item is displayed.

![](images/100/27.png)

- Now, let's try a message that includes the **ItemSize**.
<!-- TODO: need to include the instructions for testing ItemSize -->

![](images/100/28.png)

- Please finish each flow if you are testing the Bot, or hit **Reset** to create a new session and avoid confusion with an incomplete flow from a previous session.

- Under the conversation tab you can see the flow of intents the bot recognizes throughout the conversation.

![](images/100/29.png)

- Now reset your bot by clicking the reset button above the chat window. Then click the **Intent/Q&A** tab. We are going to now test only the intent for a single message.

- In the message area type **Show menu** and press **Send**.

![](images/100/confidence.png)

- Here you can see a confidence percentage that the message is an Intent. You also see that the Show menu is recognized.

**Note:** You can see the JSON as click option here, as the user interface component, which is provided for debugging purpose while the Bot is in testing, so that you can see the JSON response to check if it's not responding properly. Once you integrate the bot with some channel i.e. Facebook messenger, Web Page this JSON option will not appear.

<!-- TODO: it would be good to add some recap text, telling the user what they have accomplished, where you can go from here, and any links to more information -->
#### You have successfully created **Cafeteria ChatBot**. You are now ready to move to the next lab.
