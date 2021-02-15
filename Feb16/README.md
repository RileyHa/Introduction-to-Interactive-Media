

# Assignment 4: Data visualization / Generative Text

## Personal Workout (Training) Manager 

### Concept & Ideas:

I used to learn Personal Training or Workout. However, due to COVID-19, it is unlikely that we are able to go to gyms. Thus, I was interested in home-trainings (a.k.a At Home Workouts). Because it is hard for beginners - or even professionals - to plan their workout every single day, I figured it would be nice if there is an app that randomly designates what you have to do for a day. The categories include men/female and beginner/advanced. You can select one category based on your level.


### Final Product

Below is the gif file of the demonstration:

![](Images/.gif)


### Description 

When the program first runs, users will face the main starting page. Here, they are given four choices of their daily workouts. 

The page is consisted of images designed by me. The program recognizes the mouseX and mouseY from the mouseClicked() function and directs the user to a different page. 

Image of the first starting page is attached below:

![](Images/.png)

Once the users have clicked something, they will be directed to the actual workout planning page. 
Here, the workouts can be divided into 4-5 categories (cardio, core, arm, etc) and they will get detailed names of the workouts, depending on what the user has selected.

I created a random csv file containing of different types of workouts for:
- Female Beginner
- Female Advanced
- Male Beginner
- Male Advanced

The users will confront different workout times and programs every time they refresh the program.

Sample images of the four different pages are attached below:

![](Images/.png)


### Interesting Lessons

**PImage and PFont**

I wanted to insert an image that allows a better and more organized look overall. Thus, I did some research on inserting images.
For inserting images, you need to declare a variable. Then, the loadImage() function will allow you to load the image.

The same thing applied to fonts; I wanted to use different types of fonts for different words.
For fonts, you also need to declare a variable. The loadFont() function will help you use the font.

**Display randomized workouts from the csv file**

The overall process went like this:
1) Load the data in table
2) Create a string for the variables
3) Import random variables from the table to the string
4) Display string

### Challenges & Further Goals

**Improving & Specifying**
Next time, I want to include meal plans and nutrition balance.
I have actually made a csv file of them, but could not put them in use.

**Click / Checking two places?**
At first, I wanted to divide male/female and beginner/advanced, but I could not think of a way to allow users to click in multiple areas, so I just combined the categories.

