import QtQuick 2.0
import Felgo 3.0
import "../"

EntityBase{
    id:cake
    entityType: "cake"

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml


    MultiResolutionImage{
        id:boximg
        height: 15
        width: 15
        x:2
        y:3
        source: "../../../assets/prop/pinkcake.png"
    }

    CircleCollider{
        radius: parent.width/2
        anchors.centerIn: parent
        bodyType: Body.Static
        categories: Circle.Category3
        collidesWith: Circle.Category1 | Circle.Category4 | Circle.Category5 | Circle.Category6 | Circle.Category7

        //碰撞检测
        fixture.onBeginContact: {
          var collidedEntity = other.getBody().target
          if(collidedEntity.entityType === "player") {
//            monstersDestroyed++
            // remove the projectile entity
//            collidedEntity.removeEntity()
            // remove the monster
            removeEntity()
          }
        }
    }


    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize
}
