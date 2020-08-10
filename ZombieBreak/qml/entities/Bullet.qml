import Felgo 3.0
import QtQuick 2.0

EntityBase {
  id: entity
  entityType: "bullet"
  width: sprite.width
  height: sprite.height

  // the speed of the bullet, needed in different functions so we define it as global property
  property int speed

  // for collision detection of the bullet
  CircleCollider {
    id: circleCollider
    radius: sprite.width/2
    // entity does not have its own width and height, therefore we center the CircleCollider in the entity.
    anchors.centerIn: parent
    // the bullets speed should stay the same on each collision
    // so we set restitution(bounciness) to 1 and the friction to 0
    fixture.friction: 0
    fixture.restitution: 1
    // the ball is a fast and small object therefore, we set the bullet flag to true
    // to get better physic results during collision detection.
    bullet: true
  }

  // the image of the bullet
  Image {
    id: sprite
    source: "../../assets/img/bullet.png"
  }

  // set the bullet to the defined position and start it
  function reStart(posx,posy) {

    // set the bullet to the defined position without starting it
    reset(posx,posy)

    // generate random angle for the bullet
    var angle = utils.generateRandomValueBetween(-135,-115)

    // add a toRad() function to the angle, to change the grades to radians
    if (typeof(Number.prototype.toRad) === "undefined") {
      Number.prototype.toRad = function() {
            return this * Math.PI / 180;
          }
    }

    // do the trig to get the x and y components
    var x = Math.cos(angle.toRad())*speed
    var y = Math.sin(angle.toRad())*speed

    // apply phscis impulse to start the bullet
    circleCollider.applyLinearImpulse(Qt.point(x, y), circleCollider.pos)
  }

  // set the bullet to the defined position without starting it
  function reset(xpos,ypos) {
    x = xpos
    y = ypos
    speed = 350
    //entity.rotation = 0.0;
    // set linear velocity of the entity to 0
    circleCollider.linearVelocity = Qt.point(0, 0)
  }
}
