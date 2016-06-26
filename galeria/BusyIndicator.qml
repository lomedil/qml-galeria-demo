import QtQuick 2.2

Item{
	id: widget

	width: 56
	height: width

	property alias size: icon.size

	property bool running: false
	visible: running

	Icon{
		id: icon
		name: "action/autorenew"
		anchors.centerIn: parent
		size: 56
		NumberAnimation on rotation{
			loops: Animation.Infitine
			from: 0
			to: 360			
			running: widget.visible
			duration: 1500
		}
	}
}