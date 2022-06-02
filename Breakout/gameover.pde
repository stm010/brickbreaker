void gameover () {
  background (lightpink);
  if (lives == 0) {
    fill (white2);
    text ("GAMEOVER", 400, 400);
    gameover.play();
    theme.pause ();
  }

  if (score == 112) {
    fill (white2);
    text ("you win! here's a cookie", 400, 400);
    gameover.play();
    theme.pause ();
  }
}

void gameoverClicks () {
  mode = INTRO;
}
