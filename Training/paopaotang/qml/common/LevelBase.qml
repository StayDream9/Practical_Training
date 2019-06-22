import QtQuick 2.0
import Felgo 3.0
import "../entities"
//import "../common"

Item{
    id: levelBaseScene

    property int column: 0
    property int row: 0
    property int size // gets set in Platform.qml and Ground.qml

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
//        var toRemoveEntityTypes1 = ["boom", "fire", "fire1", "fire2", "fire3"]
//        entityManager.removeEntitiesByFilter(toRemoveEntityTypes1)
    }

}
