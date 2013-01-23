class Ghost {

  float ghostX, ghostY, speedX, speedY;
  float ghostWidth, ghostHeight;

  Ghost(float x, float y) {

    ghostX = x;
    ghostY = y;
    speedX = random(-1, 1);
    speedY = random(-1, 1);
  }

  void moveGhost(float ghostWidth, float ghostHeight) {

    ghostX+=speedX;
    ghostX+=random(-2, 2);
    ghostY+=speedY;
    ghostY+=random(-2, 2);
    shape(ghostsvg, ghostX, ghostY, ghostWidth, ghostHeight);
  }

  void checkWall() {

    if (ghostX>width || ghostX<0) speedX*=-1;
    if (ghostY>height || ghostY<0) speedY*=-1;
  }

}

//begin cat class

class Cat {

  float catX, catY, speedX, speedY;
  float catWidth;
  float catHeight;

  Cat(float x, float y) {

    catX = x;
    catY = y;
    speedX = 1;
    //speedY = random(-1, 1);
  }

  void moveCat(float catWidth, float catHeight) {

    catX+=speedX;
    //catY+=speedY;
    shape(catsvg, catX, catY, catWidth, catHeight);
  }
  
}
