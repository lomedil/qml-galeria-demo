import QtQuick 2.2


Icon{
	id: widget

	MouseArea{
		anchors.fill: parent
		onClicked: doAnimation()
	}

	signal triggered()

	function doAnimation(){
		clickAnimation.start()
		triggered()
	}

	SequentialAnimation{
		id: clickAnimation
		NumberAnimation{
			target: widget
			property: "scale"
			from: 1
			to: 1.5
			duration: 120
		}
		NumberAnimation{
			target: widget
			property: "scale"
			from: 1.5
			to: 1
			duration: 250
			easing{
				type: Easing.OutBounce
				amplitude: 2
			}
		}
	}
}