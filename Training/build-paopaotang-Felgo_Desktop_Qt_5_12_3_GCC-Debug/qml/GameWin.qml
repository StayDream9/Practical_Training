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

    signal playaPressed()
    signal networkPressed()

    MultiResolutionImage {
        width: 350
        height: 100
        source: "../assets/menu/gamewin.png"
        anchors.bottom: scoreBoard.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
    }

    MultiResolutionImage {
        id: scoreBoard
        width: 350
        height: 300
        anchors.centerIn: parent
        source: "../assets/menu/win.png"
    }

    MenuOver {
        anchors.top: scoreBoard.bottom
        anchors.topMargin: 15
        onPlayPressed: parent.playaPressed()
        onNetworkPressed: parent.networkPressed()
    }

}
