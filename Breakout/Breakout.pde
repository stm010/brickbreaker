PImage [] gif;
int numberOfFrames;
int f;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//sv
Minim minim;
AudioPlayer theme, coin, bump, gameover;

//color = #;
color darkpink = #e8a598;
color vividpink = #ffb5a7;
color medpink= #fec5bb;
color lightpink = #fcd5ce;
color palepink = #fae1dd;
color white2 = #f8edeb;
color paleorange = #f9e5d8;
color lightorange = #f9dcc4;
color medorange = #fcd2af;
color vividorange = #fec89a;

//game entities
float bx, by, bd, vx, vy, px, py, pd;
int score, lives;

//brick variables , arrays
int [] x;
int [] y;
int brickd;
int n;
int tempx, tempy;
boolean [] alive;

//keyboard variables
boolean akey, dkey;

//mode framwork
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

void setup () {
  //gif
  numberOfFrames = 19;
  gif = new PImage [numberOfFrames];

  int g = 0;
  while (g < numberOfFrames) {
    gif [g] = loadImage ("frame_"+g+"_delay-0.16s.gif");
    g=g+1;
  }

  //minim
  minim = new Minim (this);
  theme = minim.loadFile ("mario bros theme.mp3");
  coin = minim.loadFile ("coin.wav");
  bump = minim.loadFile ("bump.wav");
  gameover = minim.loadFile ("gameover.wav");
  
  brickd = 25;
  n = 112;
  x = new int [n];
  y = new int [n];
  alive = new boolean [n];
  tempx= 100;
  tempy= 100;
  textAlign (CENTER, CENTER);
  score = 0;
  lives = 3;
  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 50; //distance apart from each other x
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 50; //distance apart from each other y
    }
    i=i+1;
  }

  size (800, 800);
  textAlign (CENTER, CENTER);
  rectMode (CENTER);
  noStroke ();
  mode = INTRO;

  //paddle and ball initializing
  bx = width/2;
  by = height-200;
  bd = 10;
  px = width/2;
  py = height;
  pd = 100;
  vx = 0;
  vy = 1;
}


void draw () {
  if (mode == INTRO) {
    intro ();
  } else if (mode == GAME) {
    game ();
  } else if (mode == PAUSE) {
    pause ();
  } else if (mode == GAMEOVER) {
    gameover ();
  } else {
    println ("Mode error: " + mode);
  }
}

//void reset () {
//  //setup ();
//  score = 0;
//  lives = 3;
//  bx = width/2;
//  by = height-200;
//  bd = 10;
//  px = width/2;
//  py = height;
//  pd = 100;
//  vx = 0;
//  vy = 1;
//}
