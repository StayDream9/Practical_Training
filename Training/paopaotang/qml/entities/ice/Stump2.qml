import QtQuick 2.0
import Felgo 3.0

//冰桶障碍物
EntityBase{
    id:icestump
    entityType: "icestump"

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

    MultiResolutionImage{
        id:icestumpimg
        height: 20
        width: 20
        source: "../../../assets/ice/icestump.png"
    }

    CircleCollider{
        radius: icestumpimg.width/2
        anchors.centerIn: parent
        bodyType: Body.Static

        categories: Circle.Category8
        collidesWith: Circle.Category1 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7

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
//            removeEntity()
          }
        }
    }

}
