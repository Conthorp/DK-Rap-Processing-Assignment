

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


PShape DonkeyKong;
float ry;
PShape DonkeyKongText;

void setup()
{
 size(512, 500, P3D);

DonkeyKong = loadShape("DonkeyKongHead.obj");
DonkeyKongText = loadShape("DKtext.obj");
  
  minim = new Minim(this);
  ap = minim.loadFile("Y2Mate.is - Donkey Kong 64 (N64) - DK Rap Introduction-npuuTBlEb1U-160k-1656653848268.mp3"
  , frameSize);
  ap.play();
  ab = ap.mix;
  colorMode(HSB);
}

void keyPressed()
{
  if (key == ' ')
  {
    if (ap.isPlaying())
    {
      ap.pause();
    }
    else
    {
      ap.play();
    }
  }
}

void draw()
{
  background(0);
  
  Head();
  Text1();
  Text2();
  Text3();
  Text4();
  
  
 
}



void Text2()
{
  lights();
  translate(45, 480, 0);
  scale(35);
  shape(DonkeyKongText);
}

void Text3()
{
  lights();
  translate(455, 480,0);
  scale(35);
  shape(DonkeyKongText);
}

void Text4()
{
  lights();
  translate(455, 20,0);
  scale(35);
  shape(DonkeyKongText);
}

void Head()
{
  lights();
  translate(width/2, height/2 + 100, -200);
  rotateZ(PI);
  
  scale(15);
  shape(DonkeyKong);
  
  ry += 0.05;
}

void Text1()
{
  lights();
  translate(45, 20,0);
  scale(35);
  shape(DonkeyKongText);
  
  
}

int frameSize = 512;
Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;
