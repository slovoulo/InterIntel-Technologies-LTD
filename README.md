# InterIntel Technologies Flutter Interview Test
Design a user interface to capture basic user information and fetch data from a provided API [InterIntel technologies interview solution]


##Requirements
*Set up a flutter project that incorporates an actionbar, side menu drawer or a bottom navigation
bar and the menu items are info,design,response and dictionary. When the menu items are
clicked it should open the respective screens that updates the actionbar title with a back button
on the action button in which the initial screen being the info screen.

  //Screenshots
  
*In the info screen create a form that captures a user basic information. That is, name, email
,phone number and a submit button.
    *When the submit button is clicked, a user profile card should be created on the design
    screen and auto navigates to the screen for the user to see the card.
    

*In the response screen using any networking library make a call to this api
https://jsonplaceholder.typicode.com/todos?_limit=5 and the response displays the todos’ in a
list indicating the todo title and the completed value.



In the dictionary screen Sort the below dictionary/array key using dart and output the information
in key:value format on a card widget or any other display widget. The entire numeric key should
be sorted in an ascending order and all the alpha keys should be sorted in ascii, ascending order.
    Dictionary = {'34': 'thirty-four', '90': 'ninety',
'91': 'ninety-one''21': 'twenty-one',
'61': 'sixty-one', '9': 'nine',
'2': 'two', '6': 'six', '3': 'three',
'8': 'eight', '80': 'eighty', '81': 'eighty-one',
'Ninety-Nine': '99', 'nine-hundred': '900'}

