import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../"

Item{
    id: levelBaseScene

    property alias timetext: timetext.text
    property alias scoretext: scoretext.text

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

    Rectangle{
        id:showtime
        width: 65
        height: 70
        x:-70
        y: 50
        radius: 10

        color: "white"

        Text {
            id: timetext
            width: parent.width
            height: parent.height/4
            font.family: gameFont.name
            text: "time:\n   0"
            font.pixelSize: 18
        }
    }
    Rectangle{
        id:showscore
        width: 70
        height: 70
        x:500
        y: 50
        radius: 10

        color: "white"

        Text {
            id:scoretext
            width: parent.width
            height: parent.height/4
            font.family: gameFont.name
            text: "score:\n   0"
            font.pixelSize: 18
        }
    }

    MenuButton {
        x:-70
        text: "back"
        label.height: 40
        label.width: 40

        color: "white"
        z: 10
        anchors.right: gameWindowAnchorItem.right
        anchors.verticalCenter: gameWindowAnchorItem.verticalCenter
        onClicked: {
            resetLevel()
            gameScene.backButtonPressed()
        }
    }

    function resetLevel(){
        activeLevelFileName = ""
        entityManager.removeAllEntities()
//        var toRemoveEntityTypes1 = ["boom", "fire", "fire1", "fire2", "fire3", "cake"]
//        entityManager.removeEntitiesByFilter(toRemoveEntityTypes1)
    }

}
