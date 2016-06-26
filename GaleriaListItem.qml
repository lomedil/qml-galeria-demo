import QtQuick 2.2
import "utiles.js" as Utiles

Panel{
	id: listitem
	height: 72
	width: parent.width

	property alias pathImagen: thumbnail.source
	property int bytesImagen: 0
	property alias nombre: itemName.text

	signal triggered()

	Image{
		id: thumbnail
		anchors{
			left: parent.left
			leftMargin: 16
			verticalCenter: parent.verticalCenter
		}
		height: 56
		width: height
		source: model.filePath
		sourceSize{
			width: 56
			height: 56
		}
		asynchronous: true
	}

	BusyIndicator{
		anchors.centerIn: thumbnail
		running: thumbnail.status == Image.Loading
	}
	Rectangle{
		anchors.bottom: parent.bottom
		width: parent.width
		height: 2
		color: "#ddd"
	}

	Column{
		anchors{
			left: thumbnail.right
			right:  parent.right
			verticalCenter: parent.verticalCenter
			margins: 16
		}
		spacing: 4
		Label{
			id: itemName
			width: parent.width
			style: "body2"
		}
		Label{
			id: itemSize
			width: parent.width
			text: Utiles.normalizarBytes(listitem.bytesImagen)
			style: "caption"
		}
	}

	MouseArea{
		anchors.fill: parent
		onClicked: triggered()
	}
}