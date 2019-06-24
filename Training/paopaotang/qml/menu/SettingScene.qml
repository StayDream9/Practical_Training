import Felgo 3.0
import QtQuick 2.0
import "../common"
import ".."

SceneBase {
  id:settingScene

  // background
  Image {
    z: -2
    id: background
    source: "../../assets/menu/setting.jpg"

    // use this if the image should be centered, which is the most common case
    // if the image should be aligned at the bottom, probably the whole scene should be aligned at the bottom, and the image should be shifted up by the delta between the imagesSize and the scene.y!
    anchors.centerIn: parent
    scale: 0.5
  }

  MenuButton {
      text: "Back"
      // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
      anchors.right: selectLevelScene.gameWindowAnchorItem.right
      anchors.rightMargin: 10
      anchors.top: selectLevelScene.gameWindowAnchorItem.top
      anchors.topMargin: 10
      onClicked: backButtonPressed()
  }


  Column {
    anchors.top: parent.top
    anchors.topMargin: 70
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width - 40
    spacing: 20

    // header background music
    Text {
      font.family: gameFont.name
      font.pixelSize: 20
      text: "Background Music"
      color: "white"
    }

    // header sound effects
    Text {
      font.family: gameFont.name
      font.pixelSize: 24
      text: "Sound Effects"
      color: "white"
    }
  }

  Column {
    anchors.right: parent.right
    anchors.rightMargin: 20
    anchors.top: parent.top
    anchors.topMargin: 77
    spacing: 8

    // button to turn the music on and off
    MenuButton {
      width: 90
      height: 40
      label.source: active ? "../../assets/image/Switch_Off.png" : "../../assets/image/Switch_On.png"
      active: ! settings.musicEnabled
      opacity: 1
      onClicked:  {
        settings.musicEnabled ^= true
      }
    }

    // button to turn the sound effects on and off
    MenuButton {
      width: 90
      height: 40
      label.source: active ? "../../assets/image/Switch_Off.png" : "../../assets/image/Switch_On.png"
      active: ! settings.soundEnabled
      opacity: 1
      onClicked: {
        settings.soundEnabled ^= true
      }
    }
  }
}
