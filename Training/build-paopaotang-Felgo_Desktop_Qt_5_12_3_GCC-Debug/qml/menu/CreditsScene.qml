import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id:creditsScene

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#49a349"
    }

    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: creditsScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: creditsScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }



    Rectangle{
        id:highscoreimg
        width: 300
        height: 300
        color: "#49a349"
        anchors.centerIn: parent
        MultiResolutionImage {
            source: "../../assets/menu/highscore.png"
            anchors.fill: parent
        }

        Text{
            id:time
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            font.family: gameFont.name
            font.pixelSize: 20

            width: parent.width/2

            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment: Text.AlignVCenter//(2)
            text:"Time"
        }
        Text{
            id:score
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.right: parent.right
            font.family: gameFont.name
            font.pixelSize: 20

            width: parent.width/2
            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment: Text.AlignVCenter//(2)
            text:"Score"
        }
        Text{
            id:firsttime
            anchors.top: time.bottom
//            anchors.topMargin: 20
            anchors.left: parent.left
            font.family: gameFont.name
            font.pixelSize: 12

            width: parent.width/2
            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment: Text.AlignVCenter//(2)
            text:gameScene.time
        }
        Text{
            id:firstscore
            anchors.top: score.bottom
//            anchors.topMargin: 20
            anchors.right: parent.right
            font.family: gameFont.name
            font.pixelSize: 12

            width: parent.width/2
            horizontalAlignment: Text.AlignHCenter//(1)
            verticalAlignment: Text.AlignVCenter//(2)
            text:gameScene.score
        }
    }

}
