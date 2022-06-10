class ShopRoom extends Square {
  
  Weapon sword, staff, axe; 
  boolean purchasing;
  PImage display = loadImage("howto.png");
  
  public ShopRoom(int r, int c) {
    super(r, c);
    sword = new Weapon(loadImage("weapon.png"), 20, 2);
    staff = new Weapon(loadImage("staff.png"), 20, -2);
    axe = new Weapon(loadImage("axe.png"), 20, 2);
  }
  
  void draw() {
    axe.drawShop(155, 130);
    staff.drawShop(185, 130);
    sword.drawShop(215, 130);
    this.keyPressed();
    image(display, 200, 200);
    
  }
  
  void keyPressed() {
    if (key == ' ') {
      if (axe.selected) {p.weapon = axe; p.setWeapon(1); p.weapon.type = 1;}
      if (staff.selected) {p.weapon = staff; p.setWeapon(2); p.weapon.type = 2;}
      if (sword.selected) {p.weapon = sword; p.setWeapon(0); p.weapon.type = 0;}
    }
  }
  
  
}
