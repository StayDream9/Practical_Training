import Felgo 3.0
import QtQuick 2.0

EntityBase {
  entityType: "wall"
  // default width and height
  width: 1
  height: 1

  // make this public so we can check from anywhere if there is a collision,
  // will be needed to check if the bullet hits the floor
  property alias collision: collider.fixture

  // walls should be invisible so we only need to put a collider here for collision detection
  BoxCollider {
    id: collider
    anchors.fill: parent
    // walls should be static
    bodyType: Body.Static

    //碰撞检测
    fixture.onBeginContact: {

      // if the collided type was a projectile, both can be destroyed and the player gets a point
      var collidedEntity = other.getBody().target
      console.debug("collided with entity", collidedEntity.entityType)
      // monsters could also collide with other monsters because they have a random speed - alternatively, collider categories could be used
      if(collidedEntity.entityType === "fire" || collidedEntity.entityType === "fire1" || collidedEntity.entityType === "fire2" || collidedEntity.entityType === "fire3") {
//            monstersDestroyed++
        // remove the projectile entity
        collidedEntity.removeEntity()
        // remove the monster
//        removeEntity()
      }
    }
  }
}
