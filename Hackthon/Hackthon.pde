int TITLE = 0;
int INSTRUCTIONS= 1;
int GAME = 2;
int END = 3;
int SCREEN = TITLE;
boolean DEATH = false;
ArrayList<Platform> platforms = new ArrayList<Platform>();
Player p1 = new Player(400,400,100,100);

void setup() {
  size(800,800); 
  rectMode(CENTER);
  addPlat();
}

void draw(){
    if (SCREEN == TITLE) {
        drawTitle();
    } else if (SCREEN == GAME){
        drawGame();
    }else if (SCREEN == END){
        drawEnd();
    }
}

void addPlat(){

}

void drawTitle() {
    background(255,0,255);
    textSize(100);
    text("GAME NAME", 200, 400);
}

void drawInstructions() {
    background(255,255,255);
    textSize(40);
    text("INSTRUCTIONS",400,100);
    text("Use the arrow keys to avoid the .... and survive!!!!!", 200,300);
}

void drawGame(){
  if (p1.pressA){
    p1.vx = -5;
  }
  if (p1.pressD){
    p1.vx = 5;
  }
  if (p1.pressW && p1.canJump){
    p1.vy -=11;
    p1.canJump = false;
  }
  p1.move();
  p1.vy += 0.4;
  displayAllPlats(platforms);
  for (int i= 0; i<platforms.size(); i++){
      Platform p = platforms.get(i);
      if (p.doesCollide(p1)){
      collideLogic (p1,p);
      }
  }
  p1.display();
  if (p1.y >800){
      DEATH = true;
  }
  if (DEATH){
      drawEnd();
  }
}   
void drawEnd () {
    background(0);
    fill(0,255,0);
    textSize(40);
    text("GAME OVER", width/2, height/2-50);
    text("PRESS R TO RESTART", width/2, height/2 + 50);
}

void keyPressed(){
    if (keyCode == ' ' && SCREEN == TITLE){
        SCREEN = INSTRUCTIONS;
    }
    else if (keyCode == ' ' && SCREEN == INSTRUCTIONS){
        SCREEN = GAME;
    }
    if (keyCode == LEFT){
      p1.pressA = true;
    }
    if (keyCode == RIGHT){
      p1.pressD = true;
    }
    if (keyCode == UP){
      p1.pressW = true;
    } if (key == 'r') {
        drawGame();
    }
 }
void keyReleased(){
    if (keyCode == LEFT){
      p1.pressA = false;
      p1.vx = 0;
    }
    if (keyCode == RIGHT){
      p1.pressD = false;
      p1.vx = 0;
    }
    if (keyCode == UP){
      p1.pressW = false;
    }
 }
 void displayAllPlats(ArrayList<Platform> list){
     for (int i=0; i<list.size(); i++){
         Platform tmp = list.get(i);
         fill(tmp.c);
         rect(tmp.x, tmp.y, tmp.w, tmp.h);
     }
}
 void collideLogic(Player p1, Platform p) {
  float dx = abs(p1.x - p.x);
  float dy = abs(p1.y - p.y);
  float gapx = dx-(p.w+p1.w)/2;
  float gapy = dy-(p.h+p1.h)/2; 
  if (gapx < gapy) {
    if (p.y > p1.y) {
      p1.canJump = true;
      p1.vy = 0;
      p1.y = p.y - p.h/2 - p1.h/2;
    } else {
      p1.vy = 0;
      p1.y = p.y + p.h/2 + p1.h/2 + 1;
    }
  } else {
    if (p.x > p1.x) {
      p1.vx = 0;
      p1.x = p.x - p.w/2 - p1.w/2;
    } else {
      p1.vx = 0;
      p1.x = p.x + p.w/2 + p1.w/2;
    }
  }
}
class Player {//player class
  int x, y, w, h;
  float vx = 0;
  float vy = 0;
  color c = color(0, 0, 255);
  boolean pressA = false;
  boolean pressD = false;
  boolean pressW = false;
  boolean canJump = false;
  Player(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    fill(c);
    rect(x, y, w, h);
  }

  void move() {
    x+=vx;
    y+=vy;
  }
}
class Platform{
  int x,y,w,h;
  color c = color (0,255,0);
  Platform (int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  boolean doesCollide(Player p){
    float dx = abs(x - p.x);
    float dy = abs(y - p.y);
    return dx < (p.w + w)/2 && dy < (p.h +h/2);
  }
  
  void display(){
    fill (c);
    rect (x,y,w,h);
  }
}