class EndRoom extends Square{
  Boss waffler;
    
  public EndRoom(int r, int c) { 
    super(r, c);
    waffler = new Boss();
    //isCompleted = false;
  }
  
  void draw() {
  //text("END", 200, 200); 
  waffler.draw();
  if (p.x > 280) { p.dx = 0; p.x --;}
  }
  //fight boss?
}
