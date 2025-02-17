float WINDOW_WIDTH = 1280;
float WINDOW_HEIGHT = 720;

int clickCount = 0;
float cookieX = 0;
float cookieY = 0;
int cookieW = 400;
int cookieH = 400;
boolean stopClick = false;
float offsetX, offsetY;
float[] cCoor = {0, 0};
float sca = cookieW++;

PImage cookie;
PImage bg;
PFont font;

void drawUi(){
  noStroke();
  fill(84, 84, 84, 100);
  rect(-177, 1, 720, 800);
  fill(135, 80, 35);
  rect(-200, 1, 720, 800);
}

void drawCount(){
  int[] tCoor = {width/2 + 500, height/5};
  noStroke();
  textFont(font);
  fill(135, 80, 35);
  rect(1010, height/11, 500, 88);
  fill(255);
  
  println(tCoor[0]);
  text(clickCount, tCoor[0], tCoor[1]);
  
  if (clickCount >= 10) {
    tCoor[0] += 30;
    println(tCoor[0]);
  }
  
  if (clickCount == 100) {
    tCoor[0] += 30 * 6;
  }
}

void drawCookie(){
  /*if (stopClick) {
    scale(sca);
    println(sca);
  }*/
  tint(84, 84, 84, 100);
  image(cookie, cCoor[0] + 15, cCoor[1]);
  noTint();
  image(cookie, cCoor[0], cCoor[1]);
  cookie.resize(cookieW, cookieH);
}

void setup(){
  cookie = loadImage("perfectCookie.png");
  bg = loadImage("bgBlue.jpg");
  font = loadFont("ComicSansMS-98.vlw");
  size(1280, 720);
}

void draw(){
  background(bg);
  drawUi();
  drawCookie();
  drawCount();
  
}

void mousePressed(){
  if (mouseX > cCoor[0] && mouseX < cCoor[0] + cookieW && mouseY > cCoor[1] && mouseY < cCoor[1] + cookieH) {
    stopClick = true;
    offsetX = mouseX - cookieX;
    offsetY = mouseY - cookieY;
    cCoor[0] = random(width - cookieW);
    cCoor[1] = random(height - cookieH);
    clickCount++;
  }
}
