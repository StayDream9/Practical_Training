import Felgo 3.0
import QtQuick 2.0

Row {
  signal playPressed()
  signal networkPressed()

  spacing: 18
  anchors.horizontalCenter: parent.horizontalCenter
  height: menuItem.height

  ImageButton {
    id: menuItem
    onClicked: {
      playPressed()
    }
    source: "../../assets/menu/back.png"
  }

  ImageButton {
    onClicked: {
      networkPressed()
    }
    source: "../../assets/menu/paihang.png"
  }
}
