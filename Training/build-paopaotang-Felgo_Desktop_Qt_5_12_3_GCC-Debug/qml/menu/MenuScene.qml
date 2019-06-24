import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: menuScene

    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed
    signal setPressed

    Image {
      anchors.fill: menuScene.gameWindowAnchorItem
      source: "../../assets/menu/paopao.jpg"
    }
    // the "logo"
    Text {
        font.family: gameFont.name
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Bomberman"
    }
    Menu {
      anchors.centerIn: parent

      onNetworkPressed: creditsPressed()
      onPlayPressed: selectLevelPressed()
      onSettingPressed: setPressed()
    }

}
