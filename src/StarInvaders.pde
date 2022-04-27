// By Aiden Ciaravino period A1
Ship s1;
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
int score, starCount, health;
boolean play;
PImage logo;

void setup() {
  size(1000, 1000);
  s1 = new Ship();
  score = 0;
  health = 100;
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
  } else {


    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    s1.display(mouseX, 900);
    if (s1.health < 1) {
      gameOver();
      noLoop();
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
  text("score:" + score + "    Health" + health + "    Ammo:" + s1.laserCount, width/2, 30);
}
void startScreen() {
  background(0);
  image(logo, 320, 0);
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
void gameOver() {
  image(logo, 320, 0);
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(46);
  text("Game Over!!!", width/2, height/2);
  text("Final Score:" + score, width/2, height/2+35);
  text("Aliens defeated:" + score, width/2, height/2+70);
}

void mousePressed() {
  if (s1.fire()) {
  }
  s1.laserCount --;
}

void keyPressed() {
}
