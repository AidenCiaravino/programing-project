class Ship {
  // member variables
  int x, y, w, health, laserCount;
  boolean alive;
  PImage ship;

  // constructer
  Ship() {
    x = 0;
    y = 0;
    w = 80;
    health = 100;
    laserCount = 500;
    alive = true;
    ship = loadImage("Cannon.png");
  }

  // member variables
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    imageMode(CENTER);
    ship.resize(80, 80);
    image(ship, x, y);
  }

  void move() {
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }
}
