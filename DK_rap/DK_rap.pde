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
  
  fullScreen(P3D, 1);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  
  DonkeyKong = loadShape("DonkeyKongHead.obj");
  DonkeyKongText = loadShape("DKtext.obj");
  
  minim = new Minim(this);
  ai = minim.getLineIn(Minim.MONO, 512, 44100, 16);
  ap = minim.loadFile("Y2Mate.is - Donkey Kong 64 (N64) - DK Rap Introduction-npuuTBlEb1U-160k-1656653848268.mp3", width);
  ab = ap.mix;
  colorMode(HSB);
  
}

//float ry;
Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;

float headRotate = 0.0f;

boolean start = false;
boolean play = false;

float countdown = 0;

float average = 0;
float lerpedAverage = 0;

void keyPressed()
{
  
  if (key == ' ')
  {
    
    if (ap.isPlaying())
    {
      
      ap.pause();
      play = false;
      
    }
    else
    {
      
      ap.play();
      start = true;
      play = true;

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
  
  
  if (play)
  {
    
    headRotate += (PI / 45) * -1;
    
  }

  
  //ry += 0.05;
  popMatrix();
  
}

void Text1()
{
  
  pushMatrix();
  
  lights();
  translate(width / 10, height / 25, 0);
  scale(lerpedAverage * 1000);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text2()
{
  
  pushMatrix();
  
  lights();
  translate(width / 10, (height / 25) * 21, 0);
  scale(lerpedAverage * 1000);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text3()
{
  
  pushMatrix();
  
  lights();
  translate((width / 10) * 9, (height / 25) * 21, 0);
  scale(lerpedAverage * 1000);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void Text4()
{
  
  pushMatrix();
  
  lights();
  translate((width / 10) * 9, height / 25, 0);
  scale(lerpedAverage * 1000);
  shape(DonkeyKongText);
  
  popMatrix();
  
}

void draw()
{
  
  background(0, 0, 0);
  

  
  if (start)
  {
    
    if (countdown <= 170)
    {
      
      if (play)
      {
        countdown += 1;
      }
      
    }
    else if (countdown <= 335)
    {
      
      Text1();
      Text2();
      Text3();
      Text4();
      
      if (play)
      {
        countdown += 1;
      }
      
    }
    else
    {
      
      Head();
  
      Text1();
      Text2();
      Text3();
      Text4();
      
      float total = 0;
  
      for(int i = 0; i < ab.size(); i++)
      {
    
        total += abs(ab.get(i));
    
      }
  
      average = total / (float) ab.size();
      lerpedAverage = lerp(lerpedAverage, average, 0.15f);
      println(lerpedAverage);
    
    }
  
  }
  else
  {
    
    textAlign(CENTER);
  
    fill(120, 80, 90);
    
    textSize(78);
  
    text("WELCOME TO", width / 2, (height / 14) * 3);
    text("THE DK RAP!!!", width / 2, (height / 14) * 4);
    
    textSize(90);
    
    text("PRESS 'SPACE' TO BEGIN", width / 2, (height / 14) * 8);
  
    textSize(40);
    
    text("(YOU CAN USE 'SPACE' TO PAUSE OR PLAY AT ANY TIME)", width / 2, (height / 14) * 12);
    text("(TURN SOUND ON)", width / 2, (height / 14) * 13);
    
  }
  
}
