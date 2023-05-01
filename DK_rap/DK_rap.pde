import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PShape DonkeyKong;
PShape DonkeyKongText;

void setup()
{
  
  size(512, 500, P3D);
  
  DonkeyKong = loadShape("DonkeyKongHead.obj");
  DonkeyKongText = loadShape("DKtext.obj");
  
  minim = new Minim(this);
  ap = minim.loadFile("Y2Mate.is - Donkey Kong 64 (N64) - DK Rap Introduction-npuuTBlEb1U-160k-1656653848268.mp3", frameSize);
  ap.play();
  ab = ap.mix;
  colorMode(HSB);
  
}

//float ry;
int frameSize = 512;
Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;

float headRotate = 0.0f;

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

void Head()
{
  
  pushMatrix();
  
  lights();
  translate(width / 2, (height * 6) / 10, -200);
  rotateZ(PI);

  rotateY(headRotate);
  
  scale((height / 100) * 3);
  shape(DonkeyKong);
  
  headRotate += (PI / 45) * -1;
  
  //ry += 0.05;
  popMatrix();
  
}

void Text1()
{
  
  pushMatrix();

  lights();
  translate(width / 10, height / 25, 0);
  scale((height / 50) * 4);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text2()
{
  
  pushMatrix();
  
  lights();
  translate(width / 10, (height / 25) * 21, 0);
  scale((height / 50) * 4);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text3()
{
  
  pushMatrix();
  
  lights();
  translate((width / 10) * 9, (height / 25) * 21, 0);
  scale((height / 50) * 4);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text4()
{
  
  pushMatrix();
  
  lights();
  translate((width / 10) * 9, height / 25, 0);
  scale((height / 50) * 4);
  shape(DonkeyKongText);
  
  popMatrix();
  
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
