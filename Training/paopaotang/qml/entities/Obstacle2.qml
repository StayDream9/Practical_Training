import QtQuick 2.0
import Felgo 3.0

//红房子障碍物
EntityBase{
    id:obstacle2
    entityType: "obstacle2"

    property int rand: Math.random()%3

    MultiResolutionImage{
        id: redhouseimg
        height: 20
        width: 20
        property string house0: "../../assets/wall/redhouse.png"
        property string house1: "../../assets/wall/bluehouse.png"
        property string house2: "../../assets/wall/yellowhouse.png"

        source: switch(rand){
                case 0: house0;break;
                case 1: house1;break;
                case 2: house2;break;
                }
        //            source: "../../assets/wall/redhouse.png"
    }

    function sethouse(){
        switch(rand){
        case 0: redhouseimg.source= house0;break;
        case 1: redhouseimg.source= house1;break;
        case 2: redhouseimg.source= house2;break;
        }
    }

    CircleCollider{
        radius: redhouseimg.width/2
        anchors.centerIn: parent
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

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize
}
