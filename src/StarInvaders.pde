ArrayList<Star> stars = new ArrayList<Star>();
int score, starCount, health;
boolean play;
PImage logo;

void setup() {
  size(1000, 1000);
  logo = loadImage("logo2.png");
  starCount = 100;
  play = false;
}

void draw() {
  background(50);
  noCursor();
  infoPanel();
  stars.add(new Star());
  if (!play) {
    startScreen();
  }
  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()) {
      stars.remove(star);
    }
  }
}
void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 80);
  fill(255, 200);
  textSize(18);
  textAlign(CENTER);
}
void startScreen() {
  background(0);
  image(logo, 500, 500);
  textAlign(CENTER);
  fill(255);
  textSize(45);
  text("Welcome To StarInvaders", width/2, height/2-20);
  text("by Aiden Ciaravino", width/2, height/2+20);
  text("Destroy Aliens before they destroy you!", width/2, height/2+60);
  text("Click to shoot lasers!", width/2, height/2+100);
  text("Click Anywhere to start.....", width/2, height/2+140);
  if (mousePressed) {
    play = true;
  }
}

void mousePressed() {
}
