class MonsterRoom extends Square {
  Monster[] monsters;
  
  public MonsterRoom(int r, int c) {
    super(r, c);
    isCompleted = false;
    monsters = new Monster[10];
    this.hps = null;
  }
  
  void draw() {
    
    super.draw();
  }
}
