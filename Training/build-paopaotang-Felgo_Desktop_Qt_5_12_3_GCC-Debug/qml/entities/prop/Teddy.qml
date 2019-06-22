import QtQuick 2.0
import Felgo 3.0

//玩具熊障碍物
EntityBase{
    id:teddy
    entityType: "teddy"
    z:1

    MultiResolutionImage{
        id: teddyimg
        height: 60
        width: 40
        source: "../../../assets/wall/teddy.png"
    }
    BoxCollider{
        anchors.left: teddyimg.left
        anchors.bottom: teddyimg.bottom
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
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height -  (column+3)*gameScene.gridSize
    width: gameScene.gridSize * size * 2
    height: gameScene.gridSize * size * 2
}

