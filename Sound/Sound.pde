import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(512, 500);
  
  minim = new Minim(this);
  ap = minim.loadFile("Y2Mate.is - Donkey Kong 64 (N64) - DK Rap Introduction-npuuTBlEb1U-160k-1656653848268.mp3"
  , frameSize);
  //ap.play();
  ab = ap.mix;
  
  /*
    c = lerp(a, b, t);
    
    c = a + (b-a) * t
    
    a = 50
    b = 200
    t = 0.1
    
    a = lerp(a, b, 0.1)
    
    
    
  */
  
  colorMode(HSB);
}

float bryansLerp(float a, float b, float t)
{
  return a + (b-a) * t;
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

float yy = 200;

void draw()
{
  background(0);
  stroke(255);
  float half = height / 2;
  for(int i = 0 ; i < ab.size() ; i ++)
  {
    //float c = (i / (float) ab.size()) * 255.0f;
    float c = map(i, 0, ab.size(), 0, 255);
    stroke(c, 255, 255);
    line(i, half, i, half + ab.get(i) * half);
  }
  
  circle(100, yy, 60);
  circle(300, yyy, 60);
  yy += random(-10, 10);
  yyy = lerp(yyy, yy, 0.1f);
  
  // Calculate average of audio buffer (use abs values)
  // Use the value to control radius of a circle
  // Use lerp to smooth out the value
  
}

float yyy = 0;

int frameSize = 512;
Minim minim;
AudioPlayer ap;
AudioInput ai;
AudioBuffer ab;
