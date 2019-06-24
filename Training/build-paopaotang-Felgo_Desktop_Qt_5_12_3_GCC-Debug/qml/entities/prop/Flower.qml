import QtQuick 2.0
import Felgo 3.0
import "../"
import "../../"

EntityBase{
    id:flower
    entityType: "flower"

    x: row * gameScene.gridSize
    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize
    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml
    property double rand

    //产生随机数
    Timer{
        id: randT
        interval: 10
        repeat: true
        running: true

        onTriggered: {
            rand = Math.random()
//            console.debug(rand)
        }
    }

    function getRandomNum(Min,Max){
        var Range = Max - Min;
        return (Min+Math.round(rand*Range));
    }

    TexturePackerAnimatedSprite {
      id: flowerimg
      x:-8
      y:-12
      width: 40
      height: 40
      running: true
      source: "../../../assets/flower/flower.json"
      frameNames: ["flower1.png", "flower2.png", "flower3.png", "flower4.png", "flower5.png", "flower6.png", "flower7.png", "flower8.png", "flower9.png", "flower10.png"]
//      anchors.fill: parent
      frameRate: 5
    }

    CircleCollider{
        radius: parent.width/2
        anchors.centerIn: parent
        bodyType: Body.Static
        categories: Circle.Category3
        collidesWith: Circle.Category1

        //碰撞检测
        fixture.onBeginContact: {
          var collidedEntity = other.getBody().target
          if(collidedEntity.entityType === "player") {
              monstershow()//出现怪物
            randshowcake1()
//            randshowcake2()
//            randshowcake3()
//            randshowcake4()
//            randshowcake5()
            removeEntity()
          }
        }

    }






    function randshowcake1(){
        var propx1 = getRandomNum(0, 24)
        var propy1 = getRandomNum(0, 16)
        console.debug(propx1,propy1)

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 3, "column" : 3, "size" : 1 })
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 0, "column" : 9, "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 8, "column" : 7, "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 12, "column" : 11, "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 20, "column" : 8, "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "row" : 15, "column" : 2, "size" : 1 })
    }

    function monstershow(){
//        var startX=105
//        var startY=20
        var xDirection=0 //
        var yDirection=0 //

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Monster.qml"),{ "start": Qt.point(140, 160), "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Monster.qml"),{ "start": Qt.point(220, 120), "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Monster.qml"),{ "start": Qt.point(260, 280), "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Monster.qml"),{ "start": Qt.point(380, 140), "size" : 1 })
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../Monster.qml"),{ "start": Qt.point(100, 120), "size" : 1 })

    }
//    function randshowcake2(){
//        var propx1 = getRandomNum(0, 24)
//        var propy1 = getRandomNum(0, 16)

//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "column" : propx1, "row" : propy1, "size" : 1 })
//    }
//    function randshowcake3(){
//        var propx1 = getRandomNum(0, 24)
//        var propy1 = getRandomNum(0, 16)

//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "column" : propx1, "row" : propy1, "size" : 1 })
//    }
//    function randshowcake4(){
//        var propx1 = getRandomNum(0, 24)
//        var propy1 = getRandomNum(0, 16)

//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "column" : propx1, "row" : propy1, "size" : 1 })
//    }
//    function randshowcake5(){
//        var propx1 = getRandomNum(0, 24)
//        var propy1 = getRandomNum(0, 16)

//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../prop/Cake.qml"),{ "column" : propx1, "row" : propy1, "size" : 1 })
//    }

}
