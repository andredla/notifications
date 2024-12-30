import QtQuick 2.0
import QtQuick.Controls 2.5 as QtControls
import QtQuick.Layouts 1.15

import org.kde.kirigami 2.5 as Kirigami
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

ColumnLayout {
	id: main

	property alias cfg_radius: radius.text
	property alias cfg_coordX: coordX.text
	property alias cfg_coordY: coordY.text
	property alias cfg_width: width.text
	property alias cfg_height: height.text
	property alias cfg_jobDetail: jobDetail.checked
	property alias cfg_bgcolor: bgcolor.text
	property alias cfg_fgcolor: fgcolor.text
	property alias cfg_bgcolorButton: bgcolorButton.text
	property alias cfg_bgcolorButtonBorder: bgcolorButtonBorder.text
	property alias cfg_bgcolorButtonHover: bgcolorButtonHover.text
	property alias cfg_bgcolorBorderHover: bgcolorBorderHover.text

	PlasmaCore.DataSource {
		id: shell
		engine: 'executable'

		connectedSources: []

		function run(cmd){
			shell.connectSource(cmd);
		}
		
		function kill(cmd){
			shell.disconnectSource(cmd);
		}
		
		onSourceAdded: {
			//print(source)
		}

		onNewData: {
			var exitCode = data["exit code"]
			var exitStatus = data["exit status"]
			var stdout = data["stdout"]
			var stderr = data["stderr"]
			// console.log(exitCode, exitStatus, stdout, stderr);
			shell.disconnectSource(sourceName);
			if(exitCode == 2){
			}
		}
	}

	Kirigami.FormLayout {
		id: generalConfigPage
		anchors.fill: parent

		Kirigami.Separator {
			Kirigami.FormData.label: i18nc("@title:group", "Format")
			Kirigami.FormData.isSection: true
		}

		RowLayout {
			Kirigami.FormData.label: i18n("X:")
			QtControls.TextField {
				id: coordX
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Y:")
			QtControls.TextField {
				id: coordY
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Width:")
			QtControls.TextField {
				id: width
			}
			visible: false
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Height:")
			QtControls.TextField {
				id: height
			}
			visible: false
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Radius:")
			QtControls.TextField {
				id: radius
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Job detail:")
			QtControls.CheckBox {
				id: jobDetail
				text: i18n("Display detail information by default.")
			}
		}

		Kirigami.Separator {
			Kirigami.FormData.label: i18nc("@title:group", "Colors")
			Kirigami.FormData.isSection: true
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Background color:")
			QtControls.TextField {
				id: bgcolor
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Foreground color:")
			QtControls.TextField {
				id: fgcolor
			}
		}

		Kirigami.Separator {
			Kirigami.FormData.label: i18nc("@title:group", "Buttons background colors")
			Kirigami.FormData.isSection: true
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Normal:")
			QtControls.TextField {
				id: bgcolorButton
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Border:")
			QtControls.TextField {
				id: bgcolorButtonBorder
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Hover:")
			QtControls.TextField {
				id: bgcolorButtonHover
			}
		}

		RowLayout {
			Kirigami.FormData.label: i18n("Border hover:")
			QtControls.TextField {
				id: bgcolorBorderHover
			}
		}

		Kirigami.Separator {
			Kirigami.FormData.label: i18nc("@title:group", "System settings")
			Kirigami.FormData.isSection: true
		}

		RowLayout {
			QtControls.Button {
				text: i18nc("@action:button", "Configure")
				enabled: true
				onClicked: {
					shell.run("systemsettings kcm_notifications");
				}
			}
		}

	}

}