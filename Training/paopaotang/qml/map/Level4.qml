import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../common" as Common
import "../entities/prop"
import "../entities/ice"

Common.LevelBase {
    id:scene
    height: gameScene.gridSize * 16 // 32 * 21 = 320
    width: 42 * gameScene.gridSize

    MultiResolutionImage {
        width: 480
        height: 320
        source: "../../assets/land/iceland.png"
      anchors.centerIn: gameScene.gameWindowAnchorItem
    }

    Wall {height:parent.height; anchors.right:parent.left}
    // right wall
    Wall {height:parent.height; anchors.left:parent.right}
    // ceiling
    Wall {width:parent.width; anchors.bottom:parent.top}
    // floor, if bullet hits it, the player failed the level
    Wall {
        id:bottom
        width: gameScene.width
        anchors.top: parent.bottom
    }

//地图
//------------------------------------------
    //0
    Box{
        row: 0
        column: 0
        size: 1
    }
    Backet2{
        row: 3
        column: 0
        size: 1
    }
    Backet1{
        row: 8
        column: 0
        size: 1
    }
    Backet1{
        row: 15
        column: 0
        size: 1
    }
    Backet2{
        row: 20
        column: 0
        size: 1
    }
    Box{
        row: 23
        column: 0
        size: 1
    }


    //1
    Icetree{
        row: 1
        column: 1
        size: 1
    }
    Backet1{
        row: 5
        column: 1
        size: 1
    }
    Backet2{
        row: 6
        column: 1
        size: 1
    }
    Box{
        row: 8
        column: 1
        size: 1
    }
    Icetree{
        row: 10
        column: 1
        size: 1
    }
    Icetree{
        row: 11
        column: 1
        size: 1
    }
    Icetree{
        row: 12
        column: 1
        size: 1
    }
    Icetree{
        row: 13
        column: 1
        size: 1
    }
    Box{
        row: 15
        column: 1
        size: 1
    }
    Backet2{
        row: 17
        column: 1
        size: 1
    }
    Backet1{
        row: 18
        column: 1
        size: 1
    }
    Icetree{
        row: 22
        column: 1
        size: 1
    }


    //2
    Stump1{
        row: 1
        column: 2
        size: 1
    }
    Iceman1{
        row: 3
        column: 2
        size: 1
    }
    Iceman2{
        row: 8
        column: 2
        size: 1
    }
    Firewood{
        row: 10
        column: 2
        size: 1
    }
    Stump2{
        row: 11
        column: 2
        size: 1
    }
    Stump2{
        row: 12
        column: 2
        size: 1
    }
    Firewood{
        row: 13
        column: 2
        size: 1
    }
    Iceman2{
        row: 15
        column: 2
        size: 1
    }
    Iceman1{
        row: 20
        column: 2
        size: 1
    }
    Stump1{
        row: 22
        column: 2
        size: 1
    }


    //3
    Icetree{
        row: 1
        column: 3
        size: 1
    }
    Stump1{
        row: 4
        column: 3
        size: 1
    }
    Icehouse{
        row: 5
        column: 3
        size: 1
    }
    Stump2{
        row: 7
        column: 3
        size: 1
    }
    Iceman1{
        row: 11
        column: 3
        size: 1
    }
    Iceman1{
        row: 12
        column: 3
        size: 1
    }
    Stump2{
        row: 16
        column: 3
        size: 1
    }
    Icehouse{
        row: 17
        column: 3
        size: 1
    }
    Stump1{
        row: 19
        column: 3
        size: 1
    }
    Icetree{
        row: 22
        column: 3
        size: 1
    }

    //4
    Firewood{
        row: 2
        column: 4
        size: 1
    }
    Firewood{
        row: 4
        column: 4
        size: 1
    }
    Firewood{
        row: 7
        column: 4
        size: 1
    }
    Icetree{
        row: 9
        column: 4
        size: 1
    }
    Stump1{
        row: 11
        column: 4
        size: 1
    }
    Stump1{
        row: 12
        column: 4
        size: 1
    }
    Icetree{
        row: 14
        column: 4
        size: 1
    }
    Firewood{
        row: 16
        column: 4
        size: 1
    }
    Firewood{
        row: 19
        column: 4
        size: 1
    }
    Firewood{
        row: 21
        column: 4
        size: 1
    }

    //5
    Icetree{
        row: 0
        column: 5
        size: 1
    }
    Box{
        row: 3
        column: 5
        size: 1
    }
    Icetree{
        row: 7
        column: 5
        size: 1
    }
    Backet1{
        row: 9
        column: 5
        size: 1
    }
    Backet1{
        row: 14
        column: 5
        size: 1
    }
    Icetree{
        row: 16
        column: 5
        size: 1
    }
    Box{
        row: 20
        column: 5
        size: 1
    }
    Icetree{
        row: 23
        column: 5
        size: 1
    }


    //6
    Backet1{
        row: 2
        column: 6
        size: 1
    }
    Iceman2{
        row: 4
        column: 6
        size: 1
    }
    Backet2{
        row: 5
        column: 6
        size: 1
    }
    Box{
        row: 8
        column: 6
        size: 1
    }
    Backet2{
        row: 11
        column: 6
        size: 1
    }
    Backet2{
        row: 12
        column: 6
        size: 1
    }
    Box{
        row: 15
        column: 6
        size: 1
    }
    Backet2{
        row: 18
        column: 6
        size: 1
    }
    Iceman2{
        row: 19
        column: 6
        size: 1
    }
    Backet2{
        row: 21
        column: 6
        size: 1
    }

    //7
    Iceman1{
        row: 1
        column: 7
        size: 1
    }
    Firewood{
        row: 2
        column: 7
        size: 1
    }
    Icehouse{
        row: 3
        column: 7
        size: 1
    }
    Firewood{
        row: 5
        column: 7
        size: 1
    }
    Icetree{
        row: 7
        column: 7
        size: 1
    }
    Iceman2{
        row: 9
        column: 7
        size: 1
    }
    Iceman2{
        row: 14
        column: 7
        size: 1
    }
    Icetree{
        row: 16
        column: 7
        size: 1
    }
    Firewood{
        row: 18
        column: 7
        size: 1
    }
    Icehouse{
        row: 19
        column: 7
        size: 1
    }
    Firewood{
        row: 21
        column: 7
        size: 1
    }
    Iceman1{
        row: 22
        column: 7
        size: 1
    }

    //8
    Firewood{
        row: 2
        column: 8
        size: 1
    }
    Firewood{
        row: 5
        column: 8
        size: 1
    }
    Firewood{
        row: 7
        column: 8
        size: 1
    }
    Firewood{
        row: 9
        column: 8
        size: 1
    }
    Stump2{
        row: 10
        column: 8
        size: 1
    }
    Icehouse{
        row: 11
        column: 8
        size: 1
    }
    Stump2{
        row: 13
        column: 8
        size: 1
    }
    Firewood{
        row: 14
        column: 8
        size: 1
    }
    Firewood{
        row: 16
        column: 8
        size: 1
    }
    Firewood{
        row: 18
        column: 8
        size: 1
    }
    Firewood{
        row: 21
        column: 8
        size: 1
    }

    //9
    Icetree{
        row: 0
        column: 9
        size: 1
    }
    Iceman2{
        row: 2
        column: 9
        size: 1
    }
    Firewood{
        row: 10
        column: 9
        size: 1
    }
    Firewood{
        row: 13
        column: 9
        size: 1
    }
    Iceman2{
        row: 21
        column: 9
        size: 1
    }
    Icetree{
        row: 23
        column: 9
        size: 1
    }

    //10
    Backet2{
        row: 3
        column: 10
        size: 1
    }
    Icetree{
        row: 5
        column: 10
        size: 1
    }
    Iceman1{
        row: 7
        column: 10
        size: 1
    }
    Backet1{
        row: 8
        column: 10
        size: 1
    }
    Backet1{
        row: 15
        column: 10
        size: 1
    }
    Iceman1{
        row: 16
        column: 10
        size: 1
    }
    Icetree{
        row: 18
        column: 10
        size: 1
    }
    Backet2{
        row: 20
        column: 10
        size: 1
    }


    //11
    Stump2{
        row: 1
        column: 11
        size: 1
    }
    Box{
        row: 4
        column: 11
        size: 1
    }
    Backet1{
        row: 5
        column: 11
        size: 1
    }
    Backet2{
        row: 6
        column: 11
        size: 1
    }
    Box{
        row: 9
        column: 11
        size: 1
    }
    Iceman1{
        row: 10
        column: 11
        size: 1
    }
    Icetree{
        row: 11
        column: 11
        size: 1
    }
    Icetree{
        row: 12
        column: 11
        size: 1
    }
    Iceman1{
        row: 13
        column: 11
        size: 1
    }
    Box{
        row: 14
        column: 11
        size: 1
    }
    Backet2{
        row: 17
        column: 11
        size: 1
    }
    Backet1{
        row: 18
        column: 11
        size: 1
    }
    Box{
        row: 19
        column: 11
        size: 1
    }
    Stump2{
        row: 22
        column: 11
        size: 1
    }

    //12
    Icetree{
        row: 1
        column: 12
        size: 1
    }
    Iceman1{
        row: 3
        column: 12
        size: 1
    }
    Iceman2{
        row: 8
        column: 12
        size: 1
    }
    Firewood{
        row: 10
        column: 12
        size: 1
    }
    Stump1{
        row: 11
        column: 12
        size: 1
    }
    Stump1{
        row: 12
        column: 12
        size: 1
    }
    Firewood{
        row: 13
        column: 12
        size: 1
    }
    Iceman2{
        row: 15
        column: 12
        size: 1
    }
    Iceman1{
        row: 20
        column: 12
        size: 1
    }
    Icetree{
        row: 22
        column: 12
        size: 1
    }


    //13
    Stump1{
        row: 1
        column: 13
        size: 1
    }
    Box{
        row: 3
        column: 13
        size: 1
    }
    Stump1{
        row: 4
        column: 13
        size: 1
    }
    Icehouse{
        row: 5
        column: 13
        size: 1
    }
    Stump2{
        row: 7
        column: 13
        size: 1
    }
    Icetree{
        row: 10
        column: 13
        size: 1
    }
    Icetree{
        row: 11
        column: 13
        size: 1
    }
    Icetree{
        row: 12
        column: 13
        size: 1
    }
    Icetree{
        row: 13
        column: 13
        size: 1
    }
    Stump2{
        row: 16
        column: 13
        size: 1
    }
    Icehouse{
        row: 17
        column: 13
        size: 1
    }
    Stump1{
        row: 19
        column: 13
        size: 1
    }
    Box{
        row: 20
        column: 13
        size: 1
    }
    Stump1{
        row: 22
        column: 13
        size: 1
    }

    //14
    Icetree{
        row: 1
        column: 14
        size: 1
    }
    Firewood{
        row: 2
        column: 14
        size: 1
    }
    Firewood{
        row: 4
        column: 14
        size: 1
    }
    Firewood{
        row: 7
        column: 14
        size: 1
    }
    Iceman2{
        row: 9
        column: 14
        size: 1
    }
    Iceman2{
        row: 14
        column: 14
        size: 1
    }
    Firewood{
        row: 16
        column: 14
        size: 1
    }
    Firewood{
        row: 19
        column: 14
        size: 1
    }
    Firewood{
        row: 21
        column: 14
        size: 1
    }
    Icetree{
        row: 22
        column: 14
        size: 1
    }

    //15
    Stump1{
        row: 0
        column: 15
        size: 1
    }
    Stump1{
        row: 1
        column: 15
        size: 1
    }
    Stump2{
        row: 2
        column: 15
        size: 1
    }
    Stump2{
        row: 11
        column: 15
        size: 1
    }
    Stump2{
        row: 12
        column: 15
        size: 1
    }
    Stump2{
        row: 21
        column: 15
        size: 1
    }
    Stump1{
        row: 22
        column: 15
        size: 1
    }
    Stump1{
        row: 23
        column: 15
        size: 1
    }

}
