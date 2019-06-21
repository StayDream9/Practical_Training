import QtQuick 2.0
import Felgo 3.0

Rectangle{
    id: boomButton
//    radius: GameInfo.radius
//    opacity: GameInfo.opacity
//    color: "transparent"
//    width: 90
//    height: 90

    height: 50
    width: 50
    color: "red"
    opacity: 0.4

    Text {
      anchors.centerIn: parent
      text: "boom"
      color: "white"
      font.pixelSize: 9
    }

    property var people;

    MouseArea {
        anchors.fill: parent
             onClicked: {
                 //炸弹爆炸
                 console.log("this")
                 var newEntityProperties = {
                      x: activeLevel.player.x,
                      y: activeLevel.player.y
                 }
                 people=newEntityProperties
                 entityManager.createEntityFromUrlWithProperties(
                             Qt.resolvedUrl("entities/Boom.qml"),newEntityProperties);
                 shot.start()

                }
    }

    Timer{
        id:shot
        interval: 3000
        repeat: false

        onTriggered: {
            fire()
        }
    }

    function fire(){
       //火焰向右
            console.log(people.x,people.y)
        var destination = Qt.point(people.x+45, people.y+3)
        var initpoint = Qt.point(people.x, people.y)
        var realMoveDuration = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire.qml"), {"initpoint": initpoint,"destination": destination, "moveDuration": realMoveDuration})
        //火焰向左
        var destination1 = Qt.point(people.x-45, people.y+3)
        var initpoint1 = Qt.point(people.x, people.y)
        var realMoveDuration1 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire1.qml"), {"initpoint": initpoint1,"destination": destination1, "moveDuration": realMoveDuration1})
        //火焰向上
        var destination2 = Qt.point(people.x+3, people.y-45)
        var initpoint2 = Qt.point(people.x, people.y)
        var realMoveDuration2 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire2.qml"), {"initpoint": initpoint2,"destination": destination2, "moveDuration": realMoveDuration2})
        //火焰向下
        var destination3 = Qt.point(people.x+3, people.y+45)
        var initpoint3 = Qt.point(people.x, people.y)
        var realMoveDuration3 = 1000
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Fire3.qml"), {"initpoint": initpoint3,"destination": destination3, "moveDuration": realMoveDuration3})
    }

}
