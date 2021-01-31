# Assignment 2: Computer Graphic Arts 

## Project Description
In this project, we had to make a simple work of art using for loops or while loops. For me, I focused on for loops because they were easier to draw the shapes as I intended them to be. While thinking about the rough draft, I came up with two major ideas for the artwork, and wanted to create an interactive art where the screen changes as the user does some action (mouseClicked). 

**First Version:**

Below is the animation that shows my first version of interactive graphic art:

![](images/Ass2A.gif)
- The concept of this version is broken TV screen. 
- Some lines and dots will randomly appear like this: 
![](images/Ass2a_NotClicked.png)
- When the user takes an action of clicking the mouse, the screen will display lines with randomized color, length, and thickness.
![](images/Ass2a_Clicked.png)


**Second Version:**

This is the animation that shows my second version:

![](images/Ass2B.gif)
- The concept of this version is space and galaxy. 
- The blank page with black background will appear:
![](images/Ass2b_NotClicked.png)
- When the user takes an action of clicking the mouse, the screen will display dots (circles) with randomized color and size.
![](images/Ass2b_Clicked.png)

## Process
1) Working on the rough draft
- I had to think of an motif. My motivations came while stargazing.
2) Creating the display
- I wanted the screen to be relatively large, so I set the screen to 600 X 800.
- The background color of both versions were black.
3) Working on codes
- I used for loops for both versions.
- The if / else statements inside the for loops made me able to display different screens depending on the user's input.
- I applied the shapes that we have learned in the previous lessons (circle, line).

## How did I use for-loops?
As you see in the code, I used if loops inside the for loops. The logics of the two versions are similar.

for (int initial=1; initial<5; initial++) { // Although the initial is not used in the latter code, the initial<X manages how many lines or circles gets drawn
    float location= random(0, width); // This was the variable for locations of both the lines and circles.
    float len = random(0, height); // This was the variable for length of the line
    if (mousePressed) { // If the user makes an action (clicking)
      strokeWeight(random(0, 5)); // There will be a line (circle) with random thickness,
      stroke(random(0, 255), random(0, 255), random(0, 255)); // random color, 
      line(location, len, location, random(0, height)); // and random location
    } else { // if not, 
      background(0, 0, 0); // there would only be a blank space for the second version
      stroke(random(0, 255), random(0, 255), random(0, 255)); // and some randomly appearing lines 
      circle(location, random(0, height), 3); // and circles with random location and size for the first version
      line(location, random(0, height), location, random(0, height));
    }
  }

## Challenges
- Figuring out how to create random lines 
- Computational drawing 
