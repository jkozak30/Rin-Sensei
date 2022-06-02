class Monster {
  PImage img;
  int health;
  int attack;
  int x, y, dx, dy;
  Square pos;
  boolean wasAttacked;
  int t, t1;
  boolean dead;
  
  
  public Monster(){}
  
  public Monster(int x, int y) {
    this.x = x; 
    this.y = y;
    this.attack = 2;
    this.health = 5;
    img = loadImage("weapon.png");
  }
  
  void draw() {
    if (this.health > 0) {
    image(img, x, y);
    x += dx;
    y += dy;
    } else dead = true;
  }
  
  
  void move() {
    if (this.x < p.x) {dx = 1;}
    else {dx = -1;}
  
    if (this.y < p.y) {dy = 1;}
    else {dy = -1;}
    damage();
    //takeDamage();
    this.keyPressed();
  }

  void damage() {
   if (!dead && t >= 10 && abs(p.x - x) <= 15 && abs(p.y - y) <= 15) {
      p.health -= attack;
      t = 0;
    }
    t++;
  }
  
  void takeDamage() {
    if (!dead && abs(this.x - p.x) <= 10 && abs(p.y - this.y) <= 10) { t1 = 0; this.health -= p.attack;}
    t1++;
  }
  
  void keyPressed() {
    if (key == 'u') { takeDamage(); }
  }
  
  
  

}
