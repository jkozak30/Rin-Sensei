class Eye extends Monster {
  
  
  public Eye(Square pos, int x, int y) {
    this.attack = 5;
    this.img = loadImage("weapon.png");
    this.health = 50;
    this.x = x;
    this.y = y;
    this.pos = pos;
  }
  
  void draw() {
  }
}
