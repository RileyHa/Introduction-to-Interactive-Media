# Assignment 3: Making a game with Object Oriented Programming 

## Project Description
In this project, we had to make a simple game or artwork using object oriented programming (OOP). For me, I focused on games because they are a bit more challenging, but looks fun! However, I couldn't really come up with an idea until I thought of a brick-breaking game. Because we had learned about bouncing balls, I thought that it would be fun to apply the balls into a game.

**Demo**

Below is the animation that shows how my game turned out:

![](images/gameDemo.gif)

## Process
1) Working on the rough draft
- I got my ideas while watching the videos for bouncing balls. Brick breaking game is one of the most popular classic game even until now. Thus, I thought it would be nice to create the game for myself, but in a slightly different way. I found the last step of the brick breaking game most difficult; when there is only one brick left. Thus, giving a little twist, I decided to display only one brick. 
2) Creating the display
- I planned out in 5 steps:
  - Creating the Ball class (classBall)
  - creating the Bar class (classBar)
  - creating the Target class (classTarget)
  - working on the details (score)
  - Start page, end page
3) Working on codes
- classBall
  - displaying a ball: not difficult, because we had learned this in class!
  - making the ball move in random directions when it hits the wall
- classBar
  - displaying the bar: required some knowledge about the midpoint of rectangle, but still not that difficult!
  - making the X position of the bar move according to the mouse
  - making the ball move in opposite direction when it hits the bar
- classTarget
  - 1 block of rectangle that appears in random locations
  - making the new block appear in other random location when the ball hits the target
- Score
  - increasing the score by 1 when it successfully hits the target
- Start / Endpage
  - using boolean, the user has to click the mouse to start the game
  - when the user drops the ball on the floor, the game ends


## Challenges
- Making the ball move in opposite direction after it hits the bar
- Making sure that the ball actually hit the target
  - using 4 if-statements!
