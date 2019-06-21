import QtQuick 2.0
import Felgo 3.0

EntityBase {
    entityType: "fire1"
    width: 18;height: 18

    MultiResolutionImage {
        width: 15;height: 15
        id: fireimage1
        source: "../../assets/fire/fireleft.png"
    }

    // these values can then be set when a new projectile is created in the MouseArea below
    property point destination
    property point initpoint
    property int moveDuration

    PropertyAnimation on x {
      from: initpoint.x
      to: destination.x
      duration: moveDuration
    }

    PropertyAnimation on y {
      from: initpoint.y
      to: destination.y
      duration: moveDuration
    }

    BoxCollider {
        anchors.fill: fireimage1
        collisionTestingOnlyMode: true
    }
}

