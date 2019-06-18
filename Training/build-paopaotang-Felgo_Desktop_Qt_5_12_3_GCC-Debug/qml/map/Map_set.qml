import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "." as Walls

Walls.WallBase {
    id:wall
    width: 42 * gameScene.gridSize
    Obstacle1{
        row: 0
        column: 0
        size: 1
    }
    Obstacle2{
        row: 1
        column: 1
        size: 1
    }
    Floor{
        row: 2
        column: 2
        size: 1
    }
}

