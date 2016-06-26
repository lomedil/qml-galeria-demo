import QtQuick 2.2

Item{
	id: panel

	property alias backgroundColor: __storage.bgcolor
	property int elevation: 0

	QtObject{
		id: __storage
		property color bgcolor: "#ddd"
	}

	Rectangle{
		id: backgroundRectangle
		anchors.fill: parent
		color: elevation == 0 ? "transparent" : __storage.bgcolor
		radius: 3
		Rectangle{
			width: parent.width
			height: 3
			anchors.bottom: parent.bottom
			visible: elevation > 0
			color: Qt.darker(parent.color)
		}
	}
}