void game () {
  background (darkpink);
  strokeWeight (0);
  stroke (255);
  //paddle
  fill (white2);
  circle (px, py, pd);
  if (akey) px = px - 5;
  if (dkey) px = px + 5;

  //paddle limits
  if (px < 50) {
    px = 50;
  }
  if (px > 750) {
    px = 750;
  }

  //balld
  fill (white2);
  circle (bx, by, bd);
  bx = bx + vx;
  by = by + vy;

  //ball bouncing
  if (dist (bx, by, px, py) < bd/2 + pd/2) { //ball w/ paddle
    vx = (bx - px) /10;
    vy = (by - py) /10;
    bump.rewind();
    bump.play();
  }

  if (by < bd/2) {// || by > height-bd/2) { //bounce off top
    vy = vy * -1;
    bump.rewind();
    bump.play();
  }

  if (bx < bd/2 || bx > width-bd/2) { //bounce off side
    vx = vx * -1;
    bump.rewind();
    bump.play();
  }

  if (by > height-bd/2) {
    lives = lives - 1;
    bx = width/2;
    by = height-200;
    vx = 0;
    vy = 1;
  }


  //bricks
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick (i);
    }
    i++;
  }

  //if (i < 0) {
  //  mode = GAMEOVER;
  //}

  //score/lives board
  textSize (50);
  fill (255);
  text ("Score : " + score, width/2, 50);
  text ("Lives : " + lives, width/2, 100);

  if (lives == 0) {
    mode = GAMEOVER;
  }

  if (score == 112) {
    mode = GAMEOVER;
  }
}




void gameClicks () {
  mode = PAUSE;
}

void manageBrick (int i) {
  if (y[i] == 100) fill (vividpink);
  if (y[i] == 200) fill (lightpink);
  if (y[i] == 300) fill (lightorange);
  if (y[i] == 400) fill (vividorange);
  if (y[i] == 500) fill (palepink);
  circle (x[i], y[i], brickd);
  //brick bouncing
  if (dist (bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i]) /3;
    vy = (by - y[i]) /3;
    alive[i] = false;
    score = score + 1;
    coin.rewind();
    coin.play();
  }
}
