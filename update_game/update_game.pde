PImage bg;


float gunX = 350;
float bulY = 650;
float bulX = 355;

float ellX = 350;
float ellY = 0;
boolean Down = true;
boolean Up = false;
boolean burst = false;

boolean bul = true;

int cntA = 0;
int cntY = 0;

PFont font;
PImage alienship;
PImage gun;
PImage explosion;


void setup()
{
  size(600,600);
  bg = loadImage("space.jpg");
  font = loadFont("Arial-Black-18.vlw");
  alienship = loadImage("alienship.png");
  gun = loadImage("gun.png");
  explosion = loadImage("explosion.png");
  
}
void draw()
{
     background(bg);
     
     if(keyPressed == true && key == CODED && keyCode == LEFT)
     {
       gunX = gunX -6;
     }
      if(keyPressed == true && key == CODED && keyCode == RIGHT)
      {
        gunX = gunX +6;
      }
      if(Down == true)
      {
        ellY = ellY+4;
      }
       if(ellY <= 650)
      {
        Down = true;
      }
      if(ellY>650)
      {
        ellY = 0;
        ellX = random(30,650);
        Down=true;
        cntA++;
      }
      if(keyPressed && key == ' ')
      {
        Up = true;
      }
      if (Up == true)
      {
        bulY = bulY - 10;
      }
      if(bulY < 10)
      {
        bulY = 650;
        Up = false;
      }
      
      if(bulY < ellY +50 && bulY> ellY && bulX<ellX + 50 && bulX>ellX-50)// needs to be updated
      {
        burst= true;
        cntY++;
      }
      if(burst == true)
      {
        image(explosion,gunX,300,150,150);
        ellY = ellY-60;
      }
      
      if(burst == true & ellY<10)
      {
        ellY=0;
        ellX = random(30,670);
        burst = false;
        Down = true;
        
      }
      textFont(font);
      fill(0,255,0);
      image(alienship,ellX,ellY,75,50);
      text("Alienship",50,50);
      text(cntA,280,50);
      
      fill(255,0,0);
      image(gun,gunX,520,60,100);
      text("You",450,50);
      text(cntY,550,50);
      
      bulX = gunX + 30;
      rect(bulX,bulY,5,50);
     
     
     
}
