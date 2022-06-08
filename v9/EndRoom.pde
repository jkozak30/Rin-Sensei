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
  
  }
  //fight boss?
}
