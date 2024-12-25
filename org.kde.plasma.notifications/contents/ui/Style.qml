// https://doc.qt.io/qt-6/qml-qtqml-qt.html#rgba-method
pragma Singleton
import QtQuick 2.8
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

	QtObject {
		id: object
		property real coordX: 0.05
		property real coordY: 0.1
		property real width: 0.9
		property real height: 1.2
		property real radius: 5
		property bool jobDetail: false
		property int backgroundHints: PlasmaCore.Types.NoBackground
		property string bgcolor: theme.textColor //Style.bgcolor
		// property string bgcolor: Qt.rgba(0.92,0.92,0.92,0.8)
		property string fgcolor: theme.backgroundColor //Style.fgcolor
		property string bgcolorButton: theme.backgroundColor //Style.bgcolor_button
		property string bgcolorButtonBorder: Qt.darker(theme.backgroundColor, 1.5) //Style.bgcolor_button
		property string bgcolorButtonHover: Qt.darker(theme.highlightColor, 1.5) //Style.bgcolor_button
		property string bgcolorBorderHover: theme.highlightColor
	}