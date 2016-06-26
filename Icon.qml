import QtQuick 2.2

Item{
	id: widget

	width: size+16
	height: size+16

	property string name: ""
	property int size: 48
	property color color: "red" 

	onNameChanged:{
		if(name == ""){
			icon.source = "";
			return;
		} 
		var partes = name.split('/');
		if(partes.length != 2){
			icon.source = "";
			return;
		}
		var iconpath = "material-design-icons/%1/svg/production/ic_%2_48px.svg";
		iconpath = iconpath.arg(partes[0]).arg(partes[1]);
		icon.source = iconpath;
	}

	Image{
		id: icon
		anchors.centerIn: parent
		sourceSize{
			width: size
			height: size
		}
	}
}