import QtQuick 2.0
import Felgo 3.0
import "../"
import "../../"

//城堡障碍物
EntityBase{
    id:castle
    entityType: "castle"
    z:2
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+6)*gameScene.gridSize
    width: gameScene.gridSize * size * 4
    height: gameScene.gridSize * size * 4

    MultiResolutionImage{
        id: castleimg
        height: 120
        width: 80
        source: "../../../assets/wall/castle.png"
    }
    BoxCollider{
        anchors.left: castleimg.left
        anchors.bottom: castleimg.bottom
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
//            removeEntity()
          }
        }
    }

}
