int TITLE = 0;
int INSTRUCTIONS= 1;
int GAME = 2;
int END = 3;
int SCREEN = TITLE;
boolean DEATH = false;

Sprite player = new Sprite(playerUrl, width/2, height/2, 100,100)
void setup() {
  size(800,800);      
}

void drawTitle() {
    int screen = 0;
    background(255,255,255);
    textSize(100);
    text("GAME NAME", 400, 400);
}

void drawInstructions() {
    int screen = 1; 
    background(255,255,255);
    textSize(40);
    text("INSTRUCTIONS",400,100);
    text("Use the arrow keys to avoid the .... and survive!!!!!", 200,300);
}

void drawGame(){
}   
void movePlayer(){
    if (leftkey) {
        float newX = player.getX() - 5;
        player.setX(newX);
        if (newX <= 0) {
            DEATH = true;
        }
    }
    
void drawEnd () {
    if (DEATH
}

void keyPressed(){
    if (keyCode == ' ' && SCREEN == INSTRUCTIONS)
    if (keyCode == LEFT){
    leftKey = true;
    }
    if (keyCode == RIGHT){
    rightKey = true;
    }
    if (keyCode == UP){
    upKey = true;
    }
 }
void keyReleased(){
    if (keyCode == LEFT){
    leftkey = false;
    }
    if (keyCode == RIGHT){
    rightKey = false;
    }
    if (keyCode == UP){
    upKey = false;
    }
 }
class Sprite {
  // do not modify these except through the provided methods
  PImage _img;
  float _w;
  float _h;
  float _x;
  float _y;
  PVector _rotVector; // for movement
  float _front = 0;   // angle of front relative to right of image
  
  // constructor to create a Sprite at (x, y) with size (w, h)
  // using the image provided by the url
  Sprite(String url, float x, float y, float w, float h) {
    _img = loadImage(url);
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    _rotVector = new PVector(1, 0, 0);
  }
  
  // constructor to create a Sprite at (x, y) with size (w, h)
  // with a solid black color. The color of this Sprite can
  // change using the setColor() function
  Sprite(float x, float y, float w, float h) {
    _img = createImage(1, 1, RGB);
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    _rotVector = new PVector(1, 0, 0);
  }
  
  // consturctor to create a copy of Sprite s
  Sprite(Sprite s) {
    _img = s._img;
    _x = s._x;
    _y = s._y;
    _w = s._w;
    _h = s._h;
    _rotVector = new PVector(s._rotVector.x, s._rotVector.y, 0);
  }

  // adjust the direction of the PImage of the Sprite
  // without changing the orientation of the Sprite
  void frontAngle(float degrees) {
    _front = radians(degrees);
    // movement done from this direction from now on
    _rotVector.rotate(_front);
  }

  // change the color of a Sprite created without an image
  void setColor(float r, float g, float b) {
    color c = color(r, g, b);
    for(int x = 0; x < _img.width; x++) {
      for(int y = 0; y < _img.height; y++) {
        _img.set(x, y, c);
      }
    }
  }
  
  // turn the specified number of degrees
  void turn(float degrees) {
    _rotVector.rotate(radians(degrees));
  }
  
  // turn to the specified (x, y) location
  void turnToPoint(float x, float y) {
    _rotVector.set(x - _x, y - _y, 0);
    _rotVector.setMag(1);
  }
  
  // turn to the specified angle
  void turnToDir(float angle) {
    
    float radian = radians(angle);
    _rotVector.set(cos(radian), sin(radian));
    _rotVector.setMag(1);
  }
  
  // turn to the specified Sprite s
  void turnToSprite(Sprite s) {
    turnToPoint(s._x, s._y);
  }
  
  // move sprite to location (x, y)
  void moveToPoint(float x, float y) {
    _x = x;
    _y = y;
  }
  
  // move sprite to location of Sprite s
  void moveToSprite(Sprite s) {
    _x = s._x;
    _y = s._y;
  }

  // move in the X direction by the specified amount 
  void moveX(float x) {
    _x += x;
  }

  // move in the Y direction by the specified amount 
  void moveY(float y) {
    _y += y;
  }
  
  // move forward in the direction the sprite is facing
  // by the specified number of steps (pixels)
  void forward(float steps) {
    _x += _rotVector.x * steps;
    _y += _rotVector.y * steps;
  }
  
  // move 90 degree clockwise from the direction
  // the sprite is facing by the specified number of steps (pixels)
  void sideStep(float steps) {
    _rotVector.rotate(PI / 2);
    _x += _rotVector.x * steps;
    _y += _rotVector.y * steps;
    _rotVector.rotate(-PI / 2);
  }
  
  // draw the Sprite. This function
  // should be called in the void draw() function
  void display() {
    translate(_x, _y);
    rotate(_rotVector.heading() - _front);
    
    image(_img, 0, 0, _w, _h);
    rotate(-_rotVector.heading() + _front);
    translate(-_x, -_y);
    resetMatrix();
  }

  // change the direction of the Sprite by flipping
  // the x component of its direction
  void flipX() {
    _rotVector.x *= -1;
  }

  // change the direction of the Sprite by flipping
  // the y component of its direction
  void flipY() {
    _rotVector.y *= -1;
  }
  
  // set the size of the Sprite
  void setSize(float w, float h) {
    _w = w;
    _h = h;
  }

  void setCoor(float x, float y) {
    _x = x;
    _y = y;
  }

  // set the x coordinate
  void setX(float x) {
    _x = x;
  }

  // set the y coordinate
  void setY(float y) {
    _y = y;
  }
  
  // change the image of the Sprite
  void setImage(PImage img) {
    _img = img;
  }
  
  // get the x coordinate of the sprite 
  float getX() {
    return _x;
  }
  
  // get the y coordinate of the sprite
  float getY() {
    return _y;
  }
  
  // get the width of the sprite
  float getW() {
    return _w;
  }
  
  // get the height of the sprite
  float getH() {
    return _h;
  }
  
  // get the image of the sprite
  PImage getImage() {
    return _img;
  }
  
  // get the direction (in degrees) the Sprite is facing
  float getDir() {
    return degrees(_rotVector.heading());
  }
  
  // calculate the distance from this Sprite to Sprite s
  float distTo(Sprite s) {
    return dist(_x, _y, s._x, s._y);
  }
 
  float distToPoint(float x, float y) {
    return dist(_x, _y, x, y);
  }
 
  Point[] _getPoints() {
    float[] dx = {-_w/2, _w/2, _w/2, -_w/2};
    float[] dy = {-_h/2, -_h/2, _h/2, _h/2};
    Point[] points = new Point[4];
    float angle = _rotVector.heading() - _front;
    float cosA = cos(angle);
    float sinA = sin(angle);
    for(int i = 0; i < 4; i++) {
      float newX = cosA * dx[i] + sinA * dy[i];
      float newY = sinA * dx[i] - cosA * dy[i];
      points[i] = new Point(newX + _x, newY + _y);
    }
    return points;
  }
  
  // checks whether this Sprite is touching Sprite s
  boolean touchingSprite(Sprite s) {
    Point[] s1Points = s._getPoints();
    Point[] s2Points = this._getPoints();
    
    for(int i = 0; i < 4; i++) {
      Point a = s1Points[i], b = s1Points[(i+1)%4];
      for(int j = 0; j < 4; j++) {
        Point c = s2Points[j], d = s2Points[(j+1)%4];
        if(_ccw(a, c, d) != _ccw(b, c, d) && _ccw(a, b, c) != _ccw(a, b, d)) {
          return true;
        }
      }
    }
        
    return false;
  }

  // checks whether this Sprite is touching the specified point
  boolean touchingPoint(float x, float y) {
    Point c = new Point(x, y);
    Point d = new Point(-1, -1);
    // count how many edge of this Sprint the line p-q crosses
    int count = 0;
    Point[] s1Points = this._getPoints();
    for(int i = 0; i < 4; i++) {
      Point a = s1Points[i], b = s1Points[(i+1)%4];
        if(_ccw(a, c, d) != _ccw(b, c, d) && _ccw(a, b, c) != _ccw(a, b, d)) {
          count++;
        }
    }

    return count % 2 == 1;
  }
  
  // checks whether this Sprite is inside the canvas
  boolean isInsideScreen() {
    Point[] points = this._getPoints();
    for(Point p : points) {
      if(0 <= p.x && p.x < width && 0 <= p.y && p.y < height) {
        return true;
      }
    }
    return false;
  }

  private boolean _ccw(Point A, Point B, Point C) {
    return (C.y-A.y) * (B.x-A.x) > (B.y-A.y) * (C.x-A.x);
  }
  
  class Point {
    float x, y;
    
    Point(float _x, float _y) {
      x = _x;
      y = _y;
    }
  }
}
    