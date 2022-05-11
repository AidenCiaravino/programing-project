// By Aiden Ciaravino period A1
Ship s1;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Alien> aliens = new ArrayList<Alien>();
Timer alienTimer;
int score, level, def, health, alienTime;
boolean play;
PImage logo;

void setup() {
  size(1000, 1000);
  s1 = new Ship();
  score = 0;
  def = 0;
  health = 500;
  level = 1;
  logo = loadImage("logo2.png");
  alienTime = 1500;
  alienTimer = new Timer(alienTime);
  alienTimer.start();
  play = false;
}

void draw() {
  background(0);
  noCursor();
  infoPanel();

  if (!play) {
    startScreen();
  } else {

    if (alienTimer.isFinished()) {
      aliens.add(new Alien(int(random(width)), -100));
      alienTimer.start();
    }


    // display Aliens and detect ship collision
    for (int i = 0; i < aliens.size(); i++) {
      Alien alien = aliens.get(i);
      alien.display();
      alien.move();
      if (alien.reachedSide()) {
        alien.x-= 990;
        alien.y+= 50;
      }
      if (alien.reachedBottom()) {
        aliens.remove(alien);
        s1.health-=alien.diam;
      }
      if (alien.intersect(s1)) {
        aliens.remove(alien);
        score+=alien.diam;
        s1.health-=alien.diam;
      }
    }
    // display laser and detect Alien collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < aliens.size(); j++) {
        Alien alien = aliens.get(j);
        if (laser.intersect(alien)) {
          score = score + alien.diam;
          lasers.remove(laser);
          alien.health = alien.health - 100;
          if (alien.health < 10) {
            aliens.remove(alien);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    s1.display(mouseX, 950);
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }
}

void infoPanel() {
  fill(100, 100);
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
  text("Aliens defeated:" + def, width/2, height/2+70);
}


void mousePressed() {
  if (s1.fire()) {
    if (s1.turrent == 1) {
      lasers.add(new Laser(s1.x, s1.y));
    }
  }
  s1.laserCount --;
}

void keyPressed() {
}
