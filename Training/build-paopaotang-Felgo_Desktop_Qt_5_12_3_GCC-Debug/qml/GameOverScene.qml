import Felgo 3.0
import QtQuick 2.0
import "menu"

Item {
    width: parent.width
    height: parent.height
    y: -30
    opacity: 0
    visible: opacity === 0 ? false : true
    enabled: visible

    signal playPressed()//返回选关的信号
    signal networkPressed()

    MultiResolutionImage {
        width: 350
        height: 170
        source: "../assets/menu/gameOver.png"
        anchors.bottom: scoreBoard.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
    }

    MultiResolutionImage {
        id: scoreBoard
        anchors.centerIn: parent
        source: "../assets/menu/scoreBoard.png"
    }

    MenuOver {
        anchors.top: scoreBoard.bottom
        anchors.topMargin: 15
        onPlayPressed: parent.playPressed()
        onNetworkPressed: parent.networkPressed()
    }

}
