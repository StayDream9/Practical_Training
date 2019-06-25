import QtQuick 2.0
import Felgo 3.0

EntityBase{
    id:monster
    entityType: "monster"
//    variationType: "normal"

    x: start.x
    y: start.y

    property int size // gets set in Platform.qml and Ground.qml
    property int monsterMove: 50 //怪物速度
    property point start
    property point velocity
    property int rotate: 3


//    x: row * gameScene.gridSize
//    y: scene.height - (column+1)*gameScene.gridSize
    width: gameScene.gridSize * size
    height: gameScene.gridSize

    Timer{
        id:monsterimgchange
        interval: 1500
        repeat: false
        running: true

        onTriggered: {
            monsterimg.frameNames = ["monster1.png", "monster2.png", "monster3.png", "monster4.png"]
        }
    }


    TexturePackerAnimatedSprite{
        id: monsterimg //怪物动画
        height: parent.height
        width: parent.width

        running: true
        source: "../../assets/monster/monsters.json"
        frameNames: ["monster19.png", "monster18.png", "monster17.png", ]
        interpolate: false
        frameRate: 3
    }

    property double rand
    function getRandomNum(Min,Max){
       var Range = Max - Min;
        return (Min+Math.round(rand*Range));
    }
    Timer{
       id:timer
       interval: 4000
       repeat: true
       running: true
       onTriggered: {
           rand=Math.random()
       }
    }

//    Timer{
//        id:monsterdieimg
//        interval: 10
//        repeat: false

//        onTriggered: {
//            monsterimg.frameNames = ["monster17.png", "monster18.png", "monster19.png"]
//            monsterdie.start()
//        }
//    }

//    Timer{
//        id:monsterdie
//        interval: 1000
//        repeat: false

//        onTriggered: removeEntity()
//    }


    CircleCollider{
        id: circleCollider
        radius: monster.width/2-1
        anchors.centerIn: parent

        categories: Circle.Category9
        collidesWith: Circle.Category1 | Circle.Category3 | Box.Category4 | Box.Category5 | Box.Category6 | Box.Category7 | Circle.Category8

//        force: Qt.point(0,monsterMove)
        fixture.onBeginContact: {
            timer3.start()
            var collidedEntity = other.getBody().target
            if(collidedEntity.entityType === "fire" || collidedEntity.entityType === "fire1" || collidedEntity.entityType === "fire2" || collidedEntity.entityType === "fire3"){
                collidedEntity.removeEntity()
                removeEntity()
                monsterdieimg.start()
            }

            //根据随机数决定monster碰撞时要转向的方向
            //向下
            var num=getRandomNum(1,4)
            if(num===1){
                force=Qt.point(0,monsterMove)
                rotate=1;
                monsterimg.frameNames = ["monster1.png", "monster2.png", "monster3.png", "monster4.png"]
            }else if(num===2){ //向上
                force=Qt.point(-monsterMove,0)
                rotate=2;
                monsterimg.frameNames = ["monster5.png", "monster6.png", "monster7.png", "monster8.png"]
            }else if(num===3){//向右
                force=Qt.point(0,monsterMove)
                rotate=3;
                monsterimg.frameNames = ["monster9.png", "monster10.png", "monster11.png", "monster12.png"]
            }else if(num===4){//向左
                force=Qt.point(-monsterMove,0)
                rotate=4;
                monsterimg.frameNames = ["monster13.png", "monster14.png", "monster15.png", "monster16.png"]
            }else{
                console.log("rand error")
            }
        }
    }


    Timer{
       id:timer3
       interval: 2000//每一段时间改变一次方向
       repeat: true
       running: true
       onTriggered: {

               var num=getRandomNum(1,4)
               if(num===1){
                   circleCollider.force=Qt.point(0,monsterMove)
                   rotate=1;
                   monsterimg.frameNames = ["monster1.png", "monster2.png", "monster3.png", "monster4.png"]

               }else if(num===2){
                   circleCollider.force=Qt.point(0,-monsterMove)
                   rotate=2;
                   monsterimg.frameNames = ["monster5.png", "monster6.png", "monster7.png", "monster8.png"]
               }else if(num===3){
                   circleCollider.force=Qt.point(monsterMove,0)
                   rotate=3;
                   monsterimg.frameNames = ["monster9.png", "monster10.png", "monster11.png", "monster12.png"]
               }else if(num===4){
                   circleCollider.force=Qt.point(-monsterMove,0)
                   rotate=4;
                   monsterimg.frameNames = ["monster13.png", "monster14.png", "monster15.png", "monster16.png"]
               }else{
                   console.log("rand error")
               }
               console.log("change")

//               var num2=getRandomNum(500,4000);
//               interval=num2;//随机时间改变一次方向

       }
    }

}
