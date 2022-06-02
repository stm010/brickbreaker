void mouseReleased () {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else {
    println ("Mode error: " + mode);
  }
}

void keyPressed () {
  //
  if (key == 'a' || key == 'A') akey = true;//if w or W is pressed
  if (key == 'd' || key == 'D') dkey = true; //reverse + and - due to programming scale system
}

void keyReleased () {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
}


void reset () {
  //setup ();
  score = 0;
  lives = 3;
  bx = width/2;
  by = height-200;
  bd = 10;
  px = width/2;
  py = height;
  pd = 100;
  vx = 0;
  vy = 1;
  n=112;
  x=new int[n];
  y=new int[n];
  alive= new boolean [n];;
  tempx=100;
  tempy=100;
  int i=0;
  while (i<n) {
    x[i]=tempx;
    y[i]=tempy;
    alive[i]=true;
    tempx=tempx+50;
    if (tempx==width) {
      tempx=100;
      tempy=tempy+50;
    }
    i=i+1;
  }
}
