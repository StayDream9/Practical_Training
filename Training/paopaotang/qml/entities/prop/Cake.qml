import QtQuick 2.0
import Felgo 3.0
import "../"
import "../../"

EntityBase{
    id:cake
    entityType: "cake"
    x: row * gameScene.gridSize
    y: gameScene.gridSize * 16 - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml
    property int rand


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
        categories: Circle.Category13
        collidesWith: Circle.Category1

        //碰撞检测
        fixture.onBeginContact: {
          var collidedEntity = other.getBody().target
          if(collidedEntity.entityType === "player") {
            gameScene.cakenum--
            gameScene.highscore += 50
//            randshow()
            removeEntity()
          }
        }
    }

//    //产生随机数
//    Timer{
//        id: randT
//        interval: 100
//        repeat: true

//        onTriggered: {
//            rand = Math.random()
//        }
//    }

//    function getRandomNum(Min,Max){
//        var Range = Max - Min;
//        return (Min+Math.round(rand*Range));

//    }

//    function randshow(){
//        var propx = getRandomNum(0, 24)
//        var propy = getRandomNum(0, 16)

//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/prop/Cake.qml"),{ "column" : propx, "row" : propx, "size" : 1 })
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/prop/Cake.qml"),{ "column" : propx, "row" : propx, "size" : 1 })
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/prop/Cake.qml"),{ "column" : propx, "row" : propx, "size" : 1 })
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/prop/Cake.qml"),{ "column" : propx, "row" : propx, "size" : 1 })
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/prop/Cake.qml"),{ "column" : propx, "row" : propx, "size" : 1 })
//    }

}
