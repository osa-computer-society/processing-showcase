/**
 * Project title: Pong
 * Author: manav_joshi
 * Pong, classic game. Google it boyos.
 */

boolean ballLeft = false; //these controls whether the ball is moving any direction at any given point in time
boolean ballRight = false;
boolean ballUp = false;
int tex = 0;
float texSize = 20;
boolean ballDown = false;
float ballHeight = 0;//ball's y location
int start;
float ballDist = 40;// distance from player paddle
float pointer = 475;
int gamesWon = 0;
int gamesLost = 0;
int x = 255;
float xx = 100;//these are all just for the location of the achievements on the list
float yy = 200;
float zz = 300;
float aa = 400;
float bb = 500;
float cc = 600;
float tt = 0;
color bg;
int i = 30;
int y = 0;
boolean menu = true;// these beauties allow me to have different menu screens
boolean pong = false;
boolean game = false;
boolean difficulty = false;
boolean custom = false;
boolean highscore = false;
boolean help = false;
int one = 0; //I was going to use the variables, never got around to it
int two = 0;
int three = 0;
int four = 0;
int five = 0;
int six = 0;
int AISPEED = 10; //the speed of the opponent's paddle

boolean kingSlayer = false; //achievements, turn them all to true if you want to see what it triggers
boolean loser = false;
boolean winner = false;
boolean tenWinner = false;
boolean tenLoser = false;
boolean soClose = false;
color ballC = color(255,255,255);
color rand;

PImage img;

int fast = 15;

int scoreAI = 0;
int scoreP = 0;

String stringDisplay;
String howHard;

float paddleY = (height/2) - 15; //your paddle
float AIY = (height/2) - 15; //computer paddle

void setup() {
  img = loadImage("PongLogo.png");
  fullScreen();
  colorMode(HSB, 360, 100, 100); //makes background beautifully rainbow
  paddleY = (height/2) - 15;
  AIY = (height/2) - 15;
  frameRate(60);

  ballHeight = height/2;
  ballDist = width/2;

  int start = round(random(0, 1)); //which way the ball's x goes
  int start2 = round(random(0, 1)); //which way the ball's y goes

  if (start == 0) {
    ballRight = true;
    ballLeft = false;
  }

  if (start == 1) {
    ballLeft = true;
    ballRight = false;
  }
   if (start2 == 0) {
    ballUp = true;
    ballDown = false;
  }

  if (start2 == 1) {
    ballUp = false;
    ballDown = true;
  }
}

void draw() { ///////////////////////////////////////////////////////////

  if (menu == true) { //this is true beauty
    menu();
  }
  if (pong == true) {
    pong();
  }
  if (difficulty == true) {
    difficulty();
  }
  if (custom == true) {
    custom();
  }
  if (highscore == true) {
    highscore();
  }
  if (help == true) {
    help();
  }
  if (game == true) {
    game();
  }
}

void menu() { /////////////////////////////////////////////////////////////////

  x--;
  fill(0,0,100);
  if (x==0)x=360;
  bg = color (x, 255, 255);

  background(bg);
  imageMode(CENTER);
  image(img, width/2, 200);

  textSize(40);
  text("Pong", 880, 500);
  text("Difficulty", 840, 550);
  text("Customization", 790, 600);
  text("Achievements", 800, 650);
  text("Help", 885, 700);



  triangle(760, pointer, 780, pointer+ 10, 760, pointer + 20); //pointer is the basis for the triangle's coordinates
}

void pong() { /////////////////////////////////////////////////////////////////
  i++;
  background(0);
  fill(0,0,100);
  rect(width - 30, paddleY, 20, 100);
  rect(10, AIY, 20, 100);

  textMode(CENTER);
  textSize(80);
  text(scoreAI, width/2 -100, 70);
  text(scoreP, width/2 +70, 70);


  if (keyPressed) { //everything beyond here is pretty intuitive and self explanatory, the variables are named according to their role
    if (keyCode == UP && paddleY >= 0) {

      paddleY = paddleY - 15;
    } else if (keyCode == DOWN && paddleY <= height - 100) {

      paddleY = paddleY + 15;
    }
  }
  if (paddleY < 0) {
    paddleY = 0;
  }
  if (AIY < 0) {
    AIY = 0;
  }
  if (paddleY > height - 100) {
    
    
    paddleY = height - 100;
  }
  if (AIY > height - 100) {
    
    
    AIY = height - 100;
  }
  
  if((AIY + 50 < ballHeight && ballLeft) && (ballDist > 0) && (fast == 15)) {
    AIY = AIY + AISPEED;
  }
  
  if((AIY + 50 > ballHeight && ballLeft) && (ballDist > 0) && (fast == 15)) {
    AIY = AIY - AISPEED;
  }
    if((AIY + 50 < ballHeight && ballLeft) && (ballDist > 0) && (fast == 20) && (i >= 20)) {
    AIY = AIY + AISPEED;
  }
  
  if((AIY + 50 > ballHeight && ballLeft) && (ballDist > 0) &&  (fast == 20) && (i >= 20)) {
    AIY = AIY - AISPEED;
  }
    if((AIY + 50 < ballHeight && ballLeft) && (ballDist > 0) &&  (fast == 30) && (i >= 30)) {
    AIY = AIY + AISPEED;
  }
  
  if((AIY + 50 > ballHeight && ballLeft) && (ballDist > 0) && (fast == 30) && (i >= 30)) {
    AIY = AIY - AISPEED;
  }

  ellipseMode(CENTER);
  fill(ballC);
  ellipse(ballDist, ballHeight, 30, 30);




  if ((ballDist + 45 > width) && (ballHeight > paddleY && ballHeight < paddleY + 100) && (ballDist > width-50 && ballDist < width - 10)) {
    ballRight = false;
    ballLeft = true;
    i = 0;
  }
  if ((ballDist - 45 < 0) && (ballHeight > AIY && ballHeight < AIY + 100) && (ballDist < 50 && ballDist > 10)) {
    ballLeft = false;
    ballRight = true;
  }
  if (ballHeight + 15 > height) {
    ballUp = true;
    ballDown = false;
  }
    if (ballHeight - 15 < 0) {
    ballUp = false;
    ballDown = true;
  }

  if (ballRight) {
    ballDist = ballDist + fast;
  }

  if (ballLeft) {
    ballDist = ballDist - fast;
  }

 if (ballUp) {
    ballHeight = ballHeight - fast;
  }

  if (ballDown) {
    ballHeight = ballHeight + fast;
  }
  
  if(ballDist < 0) {
    scoreP = scoreP + 1;
    ballDist = width/2;
    ballRight = true;
    ballLeft = false;
  }
  if(ballDist > width) {
    scoreAI = scoreAI + 1;
    ballDist = width/2;
    ballRight = false;
    ballLeft = true;
  }
  if((scoreP  == 9|| scoreAI == 9) && y < 60)  {
  text("MATCH POINT",(width/2) - 100,(height/2) - 100);
  y++;
  }
  if (scoreP == 10 || scoreAI == 10) {
    pong = false;
    game = true;
  }
}
void game() {////////////////////////////////////////////////////////////////////////
background(0,0,0);
textMode(CENTER);
  tex++;
  textSize(texSize);
  
  if (scoreAI == scoreP + 1) {
    soClose = true;
  }
  
  if (scoreP == 10 && fast == 30) {
    kingSlayer = true;
  }

if (scoreAI == 10) {

  if(tex <= 60 && tex > 0) {
    texSize = texSize +1;
  }
  if(tex>60) {
    tex = -60;
  }
  if (tex > -60 && tex < 0) {
    texSize = texSize -1;
     text("You lost, sorry!", 100,100);
  }
    
  text("Press enter to restart your game!",100,200);
}
else if (scoreP == 10) {
  text("YOU WON!!!",100,100);
  text("Press enter to continue your game!",100,200);

}
  
  
}

void difficulty() {/////////////////////////////////////////////////////////////////

  background(bg);
  fill(0,0,100);


  textSize(40);
  text("Easy", 830, 500);
  text("Medium", 800, 550);
  text("Hard", 830, 600);
  triangle(760, pointer, 780, pointer+ 10, 760, pointer + 20);

  stringDisplay = "Your difficulty is: " + howHard;

  if (fast == 15) {
    howHard = "Easy";
  }
  if (fast == 20) {
    howHard = "Medium";
  }
  if (fast == 30) {
    howHard = "Hard";
  }

  text(stringDisplay, 100, 100);
  
}


void custom() {//////////////////////////////////////////////////////
  background(bg);
  fill(0,0,100);
  textSize(40);
  text("Red", 880, 500);
  text("Blue", 877, 550);
  text("Orange", 871, 600);
  text("Purple", 873, 650);
  text("Green", 868, 700);

  text(ballC,100,100);

  triangle(760, pointer, 780, pointer+ 10, 760, pointer + 20);
}

void highscore() {/////////////////////////////////////////////////////////
background(bg);
if (gamesLost >= 10) {
  tenLoser = true;
}
if (gamesWon >= 10) {
  tenWinner = true;
}
if (gamesWon >=1) {
  winner = true;
}
if (gamesLost >= 1) {
  loser = true;
}
if(xx > height) {
  xx = -20;
}
if(yy > height) {
  yy = -20;
}
if(zz > height) {
  zz = -20;
}
if(aa > height) {
  aa = -20;
}
if(bb > height) {
  bb = -20;
}
if(cc > height) {
  cc = -20;
}
if(tt > height) {
  tt = -20;
}
tt = tt + 1;
xx = xx + 1;
yy = yy + 1;
zz = zz + 1;
aa = aa + 1;
bb = bb + 1;
cc = cc + 1;
fill(0,0,100);
textSize(100);
fill(60,60,98);
text("Medals",100,tt);
textSize(40);
fill(0,0,100);
text("Games won: " + gamesWon,width/2,300);
text("Games lost: " + gamesLost,width/2,400);
textSize(40);
if (kingSlayer) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("King Slayer",100,xx);
textSize(20);
text("Win once in hard mode",100,xx + 25);

textSize(40);
if (winner) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("Winner!",100,yy);
textSize(20);
text("Win once in any mode",100,yy + 25);

textSize(40);
if (loser) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("Loser...",100,zz);
textSize(20);
text("Lose any game (It's okay, don't cry..)",100,zz + 25);

textSize(40);
if (tenWinner) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("Big Winnerrr!",100,aa);
textSize(20);
text("Win 10 times in any mode",100,aa + 25);

textSize(40);
if (tenLoser) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("Big L!",100,bb);
textSize(20);
text("Lose 10 times in any mode",100,bb + 25);

textSize(40);
if (soClose) {
  fill(0,0,100);
}
else {
  fill(0,0,39);
}
text("OOOHHH ALMOST",100,cc);
textSize(20);
text("Lose by 1 point",100,cc + 25);



}

void help() {/////////////////////////////////////////////////////////
  background(bg);
  fill(0,0,100);
  textSize(20);
  text("To go back to the menu at any time press backspace!", (width/2) - 300, height/2);
  text("The customization menu allows you to change the game's colours.", (width/2) - 300, height/2 + 30);
  text("The difficulty menu lets you change the game's difficulty.", (width/2) - 300, height/2 + 60);
  text("The high scores button lets you see the best players.", (width/2) - 300, height/2 + 90);
  text("The Pong Button lets you play a game of Pong!", (width/2) - 300, height/2 + 120);
}

void keyPressed () {/////////////////////////////////////////////////////////
  frameRate(30);
  if (keyPressed) {
    if (keyCode == ENTER) {
      if (pointer == 475 && menu == true) {
        pong = true;
        menu = false;
      }
      if(game) {
          if (scoreAI == 10) {
           gamesLost = gamesLost + 1;
        }
        if (scoreP == 10) {
           gamesWon = gamesWon + 1;
      }
        scoreP = 0;
        scoreAI = 0;
        game = false;
        pong = true;
      
      }
      if (pointer == 475 && difficulty == true) {
        fast = 15;
        AISPEED = 10;
      }
      if (pointer == 525 && difficulty == true) {
        fast = 20;
        AISPEED = 15;
      }
      if (pointer == 575 && difficulty == true) {
        fast = 30;
        AISPEED = 28;
      }
      if (pointer == 475 && custom == true) {
        ballC = color(0,100,100);
      }
       if (pointer == 525 && custom == true) {
        ballC = color(240,100,50);
      }
      if (pointer == 575 && custom == true) {
        ballC = color(38.82,100,100);
      }
      if (pointer == 625 && custom == true) {
        ballC = color(255,100,100);
      }
      if (pointer == 675 && custom == true) {
        ballC = color(255,1,255);
      }
      if (pointer == 675 && custom == true) {
        ballC = color(120,100,100);
      }
      if (pointer == 525 && menu == true) {
        difficulty = true;
        menu = false;
      }
      if (pointer == 575 && menu == true) {
        custom = true;
        menu = false;
      }
      if (pointer == 625 && menu == true) {
        highscore = true;
        menu = false;
      }
      if (pointer == 675 && menu == true) {
        help = true;
        menu = false;
      }
    }
    if (keyCode == UP ) {
      pointer =  pointer - 50;
      paddleY = paddleY - 1;
    } 
    if (keyCode == DOWN) {
      pointer = pointer + 50;
      paddleY = paddleY + 1;
    } 
    if (keyCode == BACKSPACE) { //sends you back to the main menu
      menu = true;
      pong = false;
      help = false;
      custom = false;
      highscore = false;
      difficulty = false;
      game = false;
      scoreAI = 0;
      scoreP = 0;
      ballHeight = height/2;
      ballDist = width/2;
    } 
    if (pointer < 475 && menu == true) {
      pointer = 675;
    } 
    if (pointer > 725 - 50 && menu == true) {
      pointer = 475;
    }
       if (pointer < 475 && custom == true) {
      pointer = 675;
    } 
    if (pointer > 725 - 50 && custom == true) {
      pointer = 475;
    }
    if (pointer > 625 - 50 && difficulty == true) {
      pointer = 475;
    }
    if (pointer < 475 && difficulty == true) {
      pointer = 575;
    }
  }
  }
