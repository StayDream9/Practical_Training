import QtQuick 2.0
import Felgo 3.0

//冰屋障碍物
EntityBase{
    id:icehouse
    entityType: "icehouse"

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+2)*gameScene.gridSize
    width: gameScene.gridSize * size * 2
    height: gameScene.gridSize * size * 2

    property int rand

    MultiResolutionImage{
        id: icehouseimg
        height: 40
        width: 40

        source: "../../../assets/ice/icehouse.png"
    }

    TexturePackerAnimatedSprite{
        id: hlsimg //动画
        height: parent.height+5
        width: parent.width+5
        x:-2
        y:-10
        running: true
        source: "../../../assets/flower/hls.json"
        frameNames: ["star1.png", "star2.png", "star3.png", "star4.png", "star5.png", "star6.png"]
        interpolate: false
        frameRate: 5
    }

    BoxCollider{
        anchors.left: icehouseimg.left
        anchors.bottom: icehouseimg.bottom
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
                //                removeEntity()
            }
        }
    }

}
