import QtQuick 2.2
import Qt.labs.folderlistmodel 2.0


Item{
	anchors.fill: parent
	clip: true

	property bool mostrandoImagen: false
	
	GaleriaHeader{
		id: header
		mostrarBotonBack: mostrandoImagen
		onBackTriggered: mostrandoImagen = false
		z: 8
	}

	FolderListModel{
		id: folderModel
		folder: "<path a la carpeta de imagenes>"
		nameFilters:  ["*.jpg"]
	}

	ListView{
		id: listview
		anchors{
			top: header.bottom
			bottom: parent.bottom
			left: parent.left
			right: parent.right
		}
		z: 4
		clip: true
		
		model: folderModel

		delegate: GaleriaListItem{
			bytesImagen: model.fileSize
			pathImagen: model.filePath
			nombre: model.fileName
			onTriggered: {
				imagen.source = model.filePath
				mostrandoImagen = true;
			}
		}
	}

	ImagePanel{
		id: imagen
		showing: mostrandoImagen
		anchors{
			top: listview.top
			bottom: listview.bottom
		}
	}

}