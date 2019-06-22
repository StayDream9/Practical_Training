import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:fire3
    entityType: "fire3"
    width: 15;height: 15

    signal playerdie()

    MultiResolutionImage {
        width: 15;height: 15
        id: fireimage3
        source: "../../assets/fire/firedown.png"
    }

    Timer{
        id:removeF3
        interval: 2500
        running: true
        repeat: false
        onTriggered: {
            fire3.removeEntity()
        }
    }

    // these values can then be set when a new projectile is created in the MouseArea below
    property point destination
    property point initpoint
    property int moveDuration

    PropertyAnimation on x {
        from: initpoint.x
        to: destination.x
        duration: moveDuration
    }

    PropertyAnimation on y {
        from: initpoint.y
        to: destination.y
        duration: moveDuration
    }

    BoxCollider {
        width: 10;height: 10
        anchors.centerIn: parent
        collisionTestingOnlyMode: true

//        categories: Box.Category7
//        collidesWith: Box.Category1 | Box.Category3 | Box.Category10

        //碰撞检测
        fixture.onBeginContact: {

          // if the collided type was a projectile, both can be destroyed and the player gets a point
          var collidedEntity = other.getBody().target
          console.debug("collided with entity", collidedEntity.entityType)
          // monsters could also collide with other monsters because they have a random speed - alternatively, collider categories could be used
          if(collidedEntity.entityType === "box" || collidedEntity.entityType === "obstacle3") {
//            monstersDestroyed++
            // remove the projectile entity
            collidedEntity.removeEntity()
            // remove the monster
            removeEntity()
          }
          if(collidedEntity.entityType === "player"){
              collidedEntity.removeEntity()
              // remove the monster
              removeEntity()
              playerdie()
          }
        }
    }
}

