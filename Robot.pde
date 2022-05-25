class Robot extends Enemy {
  // Requirement #5: Complete Dinosaur Class
  float speed = 2f;
  int laserTimer = 0;
  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;

  boolean checkX;
  boolean checkY;

  Laser laser;

  void display() {

    int direction = (speed > 0) ? RIGHT : LEFT;
    pushMatrix();
    translate(x, y);
    if (direction == RIGHT ) {
      scale(1, 1);
      image(robot, 0, 0, 80, 80);
    } else {
      scale(-1, 1);
      image(robot, -w, 0, 80, 80);
    }
    popMatrix();
    laser.display();
  }

  void update() {
    laser = new Laser();
    if ((speed>0 && x+HAND_OFFSET_X_FORWARD < player.x + player.w) || (speed<0 && x + HAND_OFFSET_X_BACKWARD > player.x + player.w)) {
      checkX = true;
    }
    if (y / SOIL_SIZE - player.row == PLAYER_DETECT_RANGE_ROW
    ) {
      checkY = true;
    }
    if (checkX && checkY) {
     laser.fire(x+64, y, player.x+player.w/2, player.y+player.h/2);
       
        laser.update();
        laserTimer ++;
     
    } else {
      x += speed;
    }


    if (x < 0 || x > width - 80) {
      speed *= -1 ;
    }

    if (laserTimer == LASER_COOLDOWN/60) {
      laserTimer = 0;
    }
  }



  // HINT: Player Detection in update()
  /*

   	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
   					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
   
   	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me
   
   	if(checkX AND checkY){
   		Is laser's cooldown ready?
   			True  > Fire laser from my hand!
   			False > Don't do anything
   	}else{
   		Keep moving!
   	}
   
   	*/
  Robot(float x, float y) {
    super(x, y);
  }
 
}
