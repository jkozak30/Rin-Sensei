class Monster {
  PImage img;
  int health;
  int attack;
  int x, y, dx, dy;
  Square pos;
  boolean wasAttacked;
  int t = 0;
  
  public Monster(){}
  
  public Monster(int x, int y) {
    this.x = x; 
    this.y = y;
    this.attack = 2;
    img = loadImage("weapon.png");
  }
  
  void draw() {
    image(img, x, y);
    x += dx;
    y += dy;
  }
  
  
  void move() {
    if (this.x < p.x) {dx = 1;}
    else {dx = -1;}
  
    if (this.y < p.y) {dy = 1;}
    else {dy = -1;}
    damage();
  }

  void damage() {
   if (t >= 10 && abs(p.x - x) <= 15 && abs(p.y - y) <= 15) {
      p.health -= attack;
      t = 0;
    }
    t++;
  }

}
