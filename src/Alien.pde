
class Alien {
  PImage logo;
  int x, y, speed, rand, diam, health;

  Alien(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(7);
    diam = int(110);
    health = diam;
    logo = loadImage("logo2.png");
  }

  void display() {
    image(logo, x, y, diam, diam);
    imageMode(CENTER);
    logo.resize(100, 100);
    textAlign(CENTER, CENTER);
    textSize(8);
    fill(0);
    text(diam, x, y);
  }
  void move() {
    x += speed;
  }

  boolean reachedSide() {
    if (x>990) {
      return true;
    } else {
      return false;
    }
  }
  boolean reachedBottom() {
    if (y>990) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Ship s) {
    float distance = dist(x, y, s.x, s.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }
}
