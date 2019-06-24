import QtQuick 2.0
import Felgo 3.0

//泳池障碍物
EntityBase{
    id:obstacle6
    entityType: "obstacle6"

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size*2
    height: gameScene.gridSize

    MultiResolutionImage{
        id:poolimg
        height: 20
        width: 40
        source: "../../assets/wall/pool.png"
    }

    TexturePackerAnimatedSprite{
        id: hlsimg //泳池上的动画
        height: parent.height+5
        width: parent.width+5
        x:-2
        y:-10
        running: true
        source: "../../assets/flower/hls.json"
        frameNames: ["leaf1.png", "leaf2.png", "leaf3.png", "leaf4.png", "leaf5.png", "leaf6.png"]
        interpolate: false
        frameRate: 5
    }

    BoxCollider{
        anchors.left: poolimg.left
        anchors.bottom: poolimg.bottom
        bodyType: Body.Static

        categories: Circle.Category8
        collidesWith: Circle.Category1 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7 | Circle.Category9

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

