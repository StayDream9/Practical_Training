import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:fire1
    entityType: "fire1"
    width: 15;height: 15

    signal die()

    MultiResolutionImage {
        id: fireimage1
        width: 15;height: 15
        source: "../../assets/fire/fireleft.png"
    }

    Timer{
        id:removeF1
        interval: 500
        running: true
        repeat: false
        onTriggered: {
            fire1.removeEntity()
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
        width: 10
        height: 10
        anchors.centerIn: parent
        collisionTestingOnlyMode: true
        categories: Box.Category5
        collidesWith: Circle.Category1 | Circle.Category3 | Circle.Category8 | Circle.Category11 |Circle.Category12

        //碰撞检测
        fixture.onBeginContact: {
          var collidedEntity = other.getBody().target
          console.debug("collided with entity", collidedEntity.entityType)
          // monsters could also collide with other monsters because they have a random speed - alternatively, collider categories could be used

          if(collidedEntity.entityType === "obstacle1" || collidedEntity.entityType === "obstacle2" || collidedEntity.entityType === "obstacle4" || collidedEntity.entityType === "obstacle5") {
//            monstersDestroyed++

            removeEntity()
          }

        }
    }
}

