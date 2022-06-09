class MonsterRoom extends Square {
  Monster[] monsters;
  int t = 0;
  
  public MonsterRoom(int r, int c) {
    super(r, c);
    isCompleted = false;
    int monsterNum = int(random(8));
    monsters = new Monster[3+monsterNum];
    this.hps = null;
  }
  
  void spawn() {
    int gcolor = int(random(3));
    for (int i=0; i<monsters.length; i++) {
      monsters[i] = new Monster((int)random(width-20)+10, (int)random(width-20)+10, gcolor);
    }
  }
  
  void draw() {
    if (t == 0 && p.pos.r == this.r && p.pos.c == this.c) {spawn(); t = 1; }
    int ctr = 0;
    for (int i=0; i<monsters.length; i++) {monsters[i].draw(); monsters[i].move(); if (!monsters[i].dead) {ctr++;} if (ctr == 0) {isCompleted = true;} else {isCompleted = false;}}
    //print(ctr);
    
    super.draw();
  }
}
