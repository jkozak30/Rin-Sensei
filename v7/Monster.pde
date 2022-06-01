class Monster {
  PImage img;
  int health;
  int attack;
  int x, y, dx, dy;
  Square pos;
  boolean wasAttacked;
  
  public Monster(){}
  
  public Monster(int x, int y) {
    this.x = x; 
    this.y = y;
    img = loadImage("");
  }
  
  void draw() {
    image(img, x, y);
  }
  void move() {
    if (p.x < this.x) {dx = -1;}
    else if (p.x > this.x) {dx = 1;}
    else { dx = 0; }
    if (p.y < this.y) {dx = -1;}
    else if (p.y > this.y) {dy = 1;}
    else {dy = 0;}
    
  }
}
