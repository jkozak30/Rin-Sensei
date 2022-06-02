class MonsterRoom extends Square {
  Monster[] monsters;
  int t = 0;
  
  public MonsterRoom(int r, int c) {
    super(r, c);
    isCompleted = false;
    monsters = new Monster[10];
    this.hps = null;
  }
  
  void spawn() {
    for (int i=0; i<monsters.length; i++) {
      monsters[i] = new Monster((int)random(width-20)+10, (int)random(width-20)+10);
    }
  }
  
  void draw() {
    if (t == 0 && p.pos.r == this.r && p.pos.c == this.c) {spawn(); t = 1; }
    for (int i=0; i<monsters.length; i++) {monsters[i].draw(); monsters[i].move();}
    super.draw();
  }
}
