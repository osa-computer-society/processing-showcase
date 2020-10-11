/**
 * Project title: Paint
 * Author: manav_joshi
 * Paint is a simple paing program :/
 */

color one;
float erase = 1;
float save = 0;
boolean rainbow;

float fatness = 1;


float x = 110;
float y = 460;    //Clear
float w = 43;
float h = 40;

float ax = 10;
float by = 70;   //Paint Green
float c = 40;
float d = 40;

float ex = 10;
float fy = 120;   //Paint Red
float g = 40;
float i = 40;

float jx = 10;
float ky = 170;    //Paint Blue
float l = 40;
float m = 40;

float nx = 60;
float oy = 70;    //Paint Black
float p = 40;
float q = 40;

float rx = 110;
float sy = 70;    //Paint Grey
float t = 40;
float u = 40;

float vx = 60;
float wy = 120;    //Paint Green
float z = 40;
float z1 = 40;

float a1 = 60;
float a2 = 170;    //Paint Yellow
float h1 = 40;
float h2 = 40;

float b1 = 110;
float b2 = 170;    //Paint Orange
float w1 = 40;
float w2 = 40;

float c1 = 110;
float c2 = 120;    //Paint Orange
float f1 = 40;
float f2 = 40;

float e1 = 10;
float e2 = 460;    //Eraser
float g1 = 80;
float g2 = 40;

float t1 = 10;
float t2 = 410;    //Thin line
float v1 = 100;
float v2 = 10;

float m1 = 10;
float m2 = 360;    //Medium line
float n1 = 100;
float n2 = 20;

float vf1 = 10;
float vf2 = 310;    //Fat line
float vvf1 = 100;
float vvf2 = 30;

float pf1 = 10;
float pf2 = 220;    //Pink
float ppf1 = 40;
float ppf2 = 40;

float r1 = 60;
float r2 = 220;    //Pink
float rr1 = 40;
float rr2 = 40;


void setup() {
  size(1300,700);
  background(255);
  cursor(CROSS);
}
void draw() {
  fill(200);
  noStroke();
  rect(0,0,165,1000);
 
   fill(255);
   strokeWeight(1);
   stroke(0);      //Clear
   rect(x,y,w,h);
   
   fill(0,255,0);      //Green
   rect(ax,by,c,d);
   
   fill(255,0,0);      //Red
   rect(ex,fy,g,i);
   
   fill(0,0,255);      //Blue
   rect(jx,ky,l,m);
   
   fill(0);          //Black
   rect(nx,oy,p,q);
   
   fill(150);
   rect(rx,sy,t,u);     //Grey
   
   fill(0,100,0);
   rect(vx,wy,z,z1);    //Dark Green 
   
   fill(255,255,0);
   rect(a1,a2,h1,h1);    //Orange
   
   fill(255,165,0);
   rect(b1,b2,w1,w2);    //Yellow
   
   fill(78,46,40);
   rect(c1,c2,f1,f2);    //Brown
   
   fill(255,105,180);
   rect(pf1,pf2,ppf1,ppf2);    //Pink
   
   fill(random(255),random(255),random(255));
   rect(r1,r2,rr1,rr2);    //rainbow
   
   fill(255);            //Eraser
   rect(e1,e2,g1,g2);
   
   fill(0);            //Line sizes
   rect(t1,t2,v1,v2);
   rect(m1,m2,n1,n2);
   rect(vf1,vf2,vvf1,vvf2);
   
   textSize(20);          //Instructions
   fill(0);
   text("Manav's paint",10,30);
   text("Line thickness",10,295);
   textSize(15);
   fill(0);
   text("Eraser",25,485);
   text("Clear",113,485);
   textSize(15);
   text("Have fun painting",10,550);
   text("Press S to save!",10,570);
/**
*   if (keyPressed){
*   
*     if(key == 's' | key == 'S') {
*       save = save + 1;
*       fill(255);
*       stroke(255);
*       rect(0,0,165,1000);
*       saveFrame("image" + save + ".png");
*     }
*   }
*/
 if (erase % 2 == 0) {                  //Erase function
   ellipseMode(CENTER);
   noStroke();
   fill(255);
   ellipse(mouseX,mouseY,40,40);
  }
  
  if (rainbow) {
    one = color(random(255),random(255),random(255));
  }
 
  if(mousePressed){
    
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){          //Clear all
  noStroke();
  fill(255);
  rect(165,0,1400,1000);
  
  fill(0); 
  }
  else if(mouseX>ax && mouseX <ax+c && mouseY>by && mouseY <by+d){    //Green
    one = color(0,255,0);
    rainbow = false;
  }
  else if(mouseX>e1 && mouseX <e1+g1 && mouseY>e2 && mouseY <e2+g2){      //erase
      erase = erase + 1;
      rainbow = false;
  }
  else if(mouseX>ex && mouseX <ex+g && mouseY>fy && mouseY <fy+i){    //Red
    one = color(255,0,0);
    rainbow = false;
  }
  else if(mouseX>jx && mouseX <jx+l && mouseY>ky && mouseY <ky+m){    //Blue
    one = color(0,0,255);
    rainbow = false;
  }
   else if(mouseX>nx && mouseX <nx+p && mouseY>oy && mouseY <oy+q){    //Black
    one = color(0);
    rainbow = false;
  }
  else if(mouseX>pf1 && mouseX <pf1+ppf1 && mouseY>pf2 && mouseY <pf2+ppf2){    //Pink
    one = color(255,105,180);
    rainbow = false;
  }
   else if(mouseX>rx && mouseX <rx+t && mouseY>sy && mouseY <sy+u){    //Grey
    one = color(150);
    rainbow = false;
  }
   else if(mouseX>a1 && mouseX <a1+h1 && mouseY>a2 && mouseY <a2+h2){    //Yellow
    one = color(255,255,0);
    rainbow = false;
  }
   else if(mouseX>vx && mouseX <vx+z && mouseY>wy && mouseY <wy+z1){    //Dark Green
    one = color(0,100,0);
    rainbow = false;
  }
  else if(mouseX>b1 && mouseX <b1+w1 && mouseY>b2 && mouseY <b2+w2){    //Orange
    one = color(255,165,0);
    rainbow = false;
  }
  else if(mouseX>c1 && mouseX <c1+f1 && mouseY>c2 && mouseY <c2+f2){    //Brown
    one = color(78,46,48);
    rainbow = false;
  }
  else if(mouseX>r1 && mouseX <r1+rr1 && mouseY>r2 && mouseY <r2+rr2){    //Rainbow
    rainbow = true;
  }
  else if(mouseX>t1 && mouseX <t1+v1 && mouseY>t2 && mouseY <t2+v2){    //Line size
    fatness = 1;
 } 
 else if(mouseX>m1 && mouseX <m1+n1 && mouseY>m2 && mouseY <m2+m2){    //Line size
    fatness = 3;
 } 
 else if(mouseX>vf1 && mouseX <vf1+vvf1 && mouseY>vf2 && mouseY <vf2+vvf2){    //Line size
    fatness = 7;
 } 
  }
  }

void mouseDragged() {                                          //Drawing function
  stroke(one);
  strokeWeight(fatness);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
