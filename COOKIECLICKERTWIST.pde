float WINDOW_WIDTH = 1280;
float WINDOW_HEIGHT = 720;

int clickCount = 0;
float cookieX = 0;
float cookieY = 0;
int cookieW = 400;
int cookieH = 400;
boolean stopClick = false;
float offsetX, offsetY;
PImage cookie;
PImage bg;
PFont font;

void drawUiElems(){
  noStroke();
  fill(84, 84, 84, 100);
  rect(-177, 1, 720, 800);
  fill(135, 80, 35);
  rect(-200, 1, 720, 800);
}

void drawCount(){
  noStroke();
  textFont(font);
  fill(135, 80, 35);
  rect(1010, height/11, 500, 88);
  fill(255);
  text(clickCount, width/2 + 500, height/5);
}

void drawCookie(){
  tint(84, 84, 84, 100);
  image(cookie, cookieX + 15, cookieY);
  noTint();
  image(cookie, cookieX, cookieY);
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
  drawUiElems();
  drawCount();
  drawCookie();
}

void mousePressed(){
  if (mouseX > cookieX && mouseX < cookieX + cookieW && mouseY > cookieY && mouseY < cookieY + cookieH) {
    stopClick = true;
    offsetX = mouseX - cookieX;
    offsetY = mouseY - cookieY;
    cookieX = random(width - cookieW);
    cookieY = random(height - cookieH);
    clickCount++;
  }
}
