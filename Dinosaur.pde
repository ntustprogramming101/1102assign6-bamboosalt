class Dinosaur extends Enemy {
  // Requirement #4: Complete Dinosaur Class

  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float currentSpeed = 1f;
  //boolean RIGHT;
  // boolean LEFT;

  void display() {
    int direction = (currentSpeed > 0) ? RIGHT : LEFT;
    //if( currentSpeed > 0)RIGHT = true;LEFT = false;
    // if( currentSpeed < 0)RIGHT = false;LEFT = true;
    pushMatrix();
    translate(x, y);
    if ( direction == RIGHT) {
      scale(1, 1);
      image(dinosaur, 0, 0, 80, 80);
    } else {
      scale(-1, 1);
      image(dinosaur, -w, 0, 80, 80);
    }
    popMatrix();
  }

  void update() {

    if (y == player.y && (currentSpeed > 0 && x+80 < player.x)) {
      //right

      currentSpeed  += currentSpeed * TRIGGERED_SPEED_MULTIPLIER;
      //println(y == player.y && (currentSpeed > 0 && x+80 < player.x));
    }
    if (y == player.y && (currentSpeed<0 && x > player.x+80)) {

      currentSpeed  += currentSpeed * TRIGGERED_SPEED_MULTIPLIER;
    }

    if (x < 0 || x > width - 80) {
      currentSpeed *= -1 ;
    }
    x += currentSpeed;
  }

  Dinosaur(float x, float y) {
    super(x, y);
  }

  // HINT: Player Detection in update()
  /*
	float currentSpeed = speed
   	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
   		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
   	}
   	*/
}
