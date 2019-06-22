import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:fire2
    entityType: "fire2"
    width: 15;height: 15

    signal die()

    MultiResolutionImage {
        id: fireimage2
        width: 15;height: 15
        source: "../../assets/fire/fireup.png"
    }

    Timer{
        id:removeF2
        interval: 500
        running: true
        repeat: false
        onTriggered: {
            fire2.removeEntity()
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

        categories: Box.Category6
        collidesWith: Circle.Category1 | Circle.Category3 | Circle.Category8 | Circle.Category9 |Circle.Category10 |Circle.Category11 |Circle.Category12

        //碰撞检测
        fixture.onBeginContact: {
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
          if(collidedEntity.entityType === "obstacle1" || collidedEntity.entityType === "obstacle2" || collidedEntity.entityType === "obstacle4" || collidedEntity.entityType === "obstacle5") {
//            monstersDestroyed++

            removeEntity()
          }
//          if(collidedEntity.entityType === "player"){
////              playerdie.running = true
//              collidedEntity.removeEntity()
////               remove the monster
//              removeEntity()
//              fire.die()
//          }
        }
    }
}

