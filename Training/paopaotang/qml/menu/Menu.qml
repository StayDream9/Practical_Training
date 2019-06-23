import Felgo 3.0
import QtQuick 2.0

Row {
    signal playPressed()
    signal networkPressed()
    signal quitPressed()

    spacing: 18
    anchors.horizontalCenter: parent.horizontalCenter
    height: menuItem.height

    ImageButton {
    id: menuItem
    onClicked: {
      playPressed()
    }
    source: "../../assets/menu/start.png"
    }

    ImageButton {
    onClicked: {
      networkPressed()
    }
    source: "../../assets/menu/paihang1.png"
    }

    ImageButton{
      onClicked: {
        quitPressed()
      }
      source: "../../assets/menu/bg.jpg"
    }
}
