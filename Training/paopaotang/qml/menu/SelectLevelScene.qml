import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../../qml"

SceneBase {
    id: selectLevelScene

    // signal indicating that a level has been selected
    signal levelPressed(string selectedLevel)

    Image {
      anchors.fill: selectLevelScene.gameWindowAnchorItem
      source: "../../assets/menu/select.jpg"
    }
    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: selectLevelScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }



    // levels to be selected
    Grid {
        anchors.centerIn: parent
        spacing: 10
        columns: 5
        MenuButton {
            opacity: 0.7
            text: "1"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level1.qml")
            }
        }
        MenuButton {
            opacity: 0.7
            text: "2"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level2.qml")
            }
        }
        MenuButton {
            opacity: 0.7
            text: "3"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level3.qml")
            }
        }
        MenuButton {
            opacity: 0.7
            text: "4"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level4.qml")
            }
        }
    }
}
