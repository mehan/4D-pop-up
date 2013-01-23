//Remember to install XZing before trying to run this code.
//installation instructions can be found here:
//http://blog.makezine.com/archive/2011/03/codebox-use-qr-codes-in-processing.html

import processing.video.*;
import com.google.zxing.*;
import java.awt.image.BufferedImage;

Capture cam; 
com.google.zxing.Reader reader = new com.google.zxing.qrcode.QRCodeReader();

int WIDTH = 640;
int HEIGHT = 480;
int counter = 0;
int ghostcounter = 0;

int ghostWidth = 50; 
int ghostHeight = 100;
int catWidth = 50; 
int catHeight = 100;

Ghost[] ghosts = new Ghost[0];
Cat [] cats = new Cat[0];

PShape ghostsvg;
PShape pumpkinsvg;
PShape catsvg;
PShape skullsvg;  

void setup() {
  size(640, 480);
  cam = new Capture(this, WIDTH, HEIGHT);
  cam.start();
   ghostsvg = loadShape("clearghost.svg");
   pumpkinsvg = loadShape("pumpkin.svg");
   catsvg = loadShape("black_cat.svg");
   skullsvg = loadShape("skull.svg");
   smooth();
}
 

void draw() {
  
  if (ghostcounter < 2){
    for (int i=0; i< ghosts.length; i++) {
    ghosts[i].moveGhost(50, 75); 
    ghosts[i].checkWall();    
    
  }}
  
     for (int i=0; i< cats.length; i++) {
    cats[i].moveCat(200, 100); 
   // cats[i].checkWall();    
    
  }
  
   
  if (cam.available() == true) {
    cam.read();    
    image(cam, 0,0);//,1024,768);
    
    
    try {
      
       LuminanceSource source = new BufferedImageLuminanceSource((BufferedImage)cam.getImage());
       BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));       
       Result result = reader.decode(bitmap); 
   
       
       
       if (result.getText() != null) { 
         
         println(result.getText());
            
                ResultPoint[] points = result.getResultPoints();
                
                
                 if (result.getText().equals("show ghost")) {

  Ghost temp= new Ghost(points[1].getX(), points[1].getY());
  ghosts = (Ghost[])append(ghosts, temp);


}  
                
      if (result.getText().equals("show pumpkin")) {
          
            println("PUMPKIN DETECTED");
            
            shape(pumpkinsvg, ((points[1].getX())-230), ((points[1].getY())-290), 120, 100);
         
        }
        
            if (result.getText().equals("show cat")) {
          
            println("CAT DETECTED");
            ghostcounter++;
            
            if (counter == 0) {
              
              println("generate new cat");
            
           Cat temp= new Cat(points[1].getX(), points[1].getY());
  cats = (Cat[])append(cats, temp);
      counter++;  
      }}
      
         if (result.getText().equals("show skull")) {
          
            println("SKULL DETECTED");
            
            shape(skullsvg, ((points[1].getX())-20), ((points[1].getY())-30), 100, 120);
         
        }
  
        }
      
          }
          
    catch (Exception e) { 
    
   }
  }
}
