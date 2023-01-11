# InterIntel Technologies Flutter Interview Test
Design a user interface to capture basic user information and fetch data from a provided API [InterIntel technologies interview solution]


## Requirements

* Set up a flutter project that incorporates an actionbar, side menu drawer or a bottom navigation
bar and the menu items are info,design,response and dictionary. When the menu items are
clicked it should open the respective screens that updates the actionbar title with a back button
on the action button in which the initial screen being the info screen.



 ![side drawer](https://user-images.githubusercontent.com/33094474/211810695-936417cc-de45-48ea-8bd9-4205d7234a97.png)

  ![info screen](https://user-images.githubusercontent.com/33094474/211810714-cf22e312-e897-4e4f-8fe4-0540a6c2ee59.png)
  
  
  

* In the info screen create a form that captures a user basic information. That is, name, email
,phone number and a submit button.
    * When the submit button is clicked, a user profile card should be created on the design
    screen and auto navigates to the screen for the user to see the card.
    
    ### Minor drawbacks
    For the custom widget for this section, I wanted to add a PDF export option but opted for an image share option. In a production app scenario I would do an API call to a server with all the data needed, create the pdf on the server then return a download link to the user.
    
    
    
    ![done design](https://user-images.githubusercontent.com/33094474/211810748-191639f9-4ba9-49fb-95e7-7dc7875d69cc.png)
![incomplete design](https://user-images.githubusercontent.com/33094474/211810763-1cea4a2b-f381-44d1-98f7-21a1a322901a.png)


* In the response screen using any networking library make a call to this api
https://jsonplaceholder.typicode.com/todos?_limit=5 and the response displays the todos’ in a
list indicating the todo title and the completed value.




![todos](https://user-images.githubusercontent.com/33094474/211810790-c5bf36e7-ade2-451e-97ec-c9790d1cd4fa.png)


* In the dictionary screen Sort the below dictionary/array key using dart and output the information
in key:value format on a card widget or any other display widget. The entire numeric key should
be sorted in an ascending order and all the alpha keys should be sorted in ascii, ascending order.
    Dictionary = {'34': 'thirty-four', '90': 'ninety',
'91': 'ninety-one''21': 'twenty-one',
'61': 'sixty-one', '9': 'nine',
'2': 'two', '6': 'six', '3': 'three',
'8': 'eight', '80': 'eighty', '81': 'eighty-one',
'Ninety-Nine': '99', 'nine-hundred': '900'}
![dictionary](https://user-images.githubusercontent.com/33094474/211810807-257b5e15-ed8a-410f-b82b-387dd46a7e56.png)

