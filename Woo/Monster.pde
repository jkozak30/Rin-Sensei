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
  
  public Monster(int x, int y, int gcolor) {
    this.x = x; 
    this.y = y;
    this.attack = 2;
    this.health = 5;
    
    img = loadImage("ghost/ghost" + nf(gcolor) + ".png");
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
    takeDamage();
    //this.keyPressed();
  }

  void damage() {
   if (!dead && t >= 10 && abs(p.x - x) <= 15 && abs(p.y - y) <= 15) {
      p.health -= attack;
      t = 0;
    }
    t++;
  }
  
  void takeDamage() {
    if (p.weapon.type == 0){
      if (p.hitbox != null && p.hitbox.t < 13 && !dead && p.hitbox.xFront < x && x < p.hitbox.xBack && p.hitbox.yTop < y && y < p.hitbox.yBottom) { t1 = 0; this.health -= p.attack;}
        t1++;
    }
    if (p.weapon.type == 1){
      if (p.hitbox != null && p.hitbox.t < 29 && !dead && p.hitbox.xFront < x && x < p.hitbox.xBack && p.hitbox.yTop < y && y < p.hitbox.yBottom) { t1 = 0; this.health -= p.attack;}
        t1++;
    }
    if (p.weapon.type == 2){
      for (int i = 0; i < 10; i++){
        if (p.projectiles[i] != null && !dead && p.projectiles[i].x - 10 < x && x < p.projectiles[i].x + 10 && p.projectiles[i].y - 6 < y && y < p.projectiles[i].y + 6) {t1 = 0; this.health -= p.attack/4;}
      }
    }
  }
  
  void keyPressed() {
    if (key == 'u') { takeDamage(); }
  }
  
  
  

}
