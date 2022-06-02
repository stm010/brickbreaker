void intro (){
  
 //gif
   image(gif[f], 0, 0, width+800, height);
  if (frameCount % 2 == 0) f = f + 1; 
  if (f == numberOfFrames) f = 0;
  
  gameover.pause();
  theme.play();
  reset ();
 // background (palepink);
  textSize (100);
  fill (white2);
  text ("BRICK BREAKER", 407, 307);
  fill (vividpink);
  text ("BRICK BREAKER", 400, 300);
  
  //start button
  tactile1 (400, 500, 200, 100);
  fill (255);
  rect (400, 500, 200, 100, 10); //coord,coord,width,height
  fill (vividpink);
  textSize (30);
  text ("START", 400, 495);
}

void tactile1 (int x, int y, int w, int h) {
  if (mouseX > 300 && mouseX < 500 && mouseY > 450 && mouseY < 550) {
    strokeWeight (6);
    stroke (vividpink);
  } else {
    strokeWeight (0);
    stroke (255);
  }
}

void introClicks () {
 if (mouseX > 300 && mouseX < 500 && mouseY > 450 && mouseY < 550)
    mode = GAME;
}
