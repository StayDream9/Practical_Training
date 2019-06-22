import QtQuick 2.0
import Felgo 3.0

//黄房子障碍物
EntityBase{
    id:obstacle5
    entityType: "obstacle5"

    property int rand

    MultiResolutionImage{
        id: yellowhouseimg
        height: 20
        width: 20

        source: "../../assets/wall/yellowhouse.png"
    }

    CircleCollider{
        radius: yellowhouseimg.width/2
        anchors.centerIn: parent
        bodyType: Body.Static

//        categories: Box.Category9
//        collidesWith: Box.Category1

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
                //                removeEntity()
            }
        }
    }

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize
}
