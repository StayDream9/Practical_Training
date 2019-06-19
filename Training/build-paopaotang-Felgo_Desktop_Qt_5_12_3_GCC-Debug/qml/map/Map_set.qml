import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "." as Walls

Walls.WallBase {
    id:wall
    width: 42 * gameScene.gridSize
    Boom{
        x:80
        y:40
        size:1
    }

    Obstacle1{
        row: 0
        column: 0
        size: 1
    }
    Obstacle2{
        row: 23
        column: 15
        size: 1
    }



}

