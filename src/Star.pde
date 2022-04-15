class Star {
  int x, y, diam, speed;



  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 5));
    speed = int(random(1, 10));
  }

  void display() {
    fill(255);
    ellipse(x, y, diam, diam);
  }

  void move() {
    y += speed;
  }
  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
