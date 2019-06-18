import QtQuick 2.0
import Felgo 3.0

EntityBase {
  id: wallEntity
  property int column: 0
  property int row: 0
  property int size // gets set in Platform.qml and Ground.qml

  x: row * gameScene.gridSize
  y: wall.height - (column+1)*gameScene.gridSize
  width: gameScene.gridSize * size
  height: gameScene.gridSize
}
