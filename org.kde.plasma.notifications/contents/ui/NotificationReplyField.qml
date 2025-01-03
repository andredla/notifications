/*
    SPDX-FileCopyrightText: 2019 Kai Uwe Broulik <kde@broulik.de>

    SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
*/

import QtQuick 2.8
import QtQuick.Layouts 1.1

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3

RowLayout {
    id: replyRow

    signal beginReplyRequested
    signal replied(string text)

    property bool replying: false

    property alias text: replyTextField.text
    property string placeholderText
    property string buttonIconName
    property string buttonText

    spacing: PlasmaCore.Units.smallSpacing

    function activate() {
        replyTextField.forceActiveFocus();
    }

    PlasmaComponents3.TextField {
        id: replyTextField
        Layout.fillWidth: true
        placeholderText: replyRow.placeholderText
                         || i18ndc("plasma_applet_org.kde.plasma.notifications", "Text field placeholder", "Type a reply…")
        onAccepted: {
            if (replyButton.enabled) {
                replyRow.replied(text);
            }
        }

        // Catches mouse click when reply field is already shown to start a reply
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.IBeamCursor
            visible: !replyRow.replying
            onPressed: replyRow.beginReplyRequested()
        }
    }

    PlasmaComponents3.Button {
        id: replyButton
        icon.name: replyRow.buttonIconName || "document-send"
        text: replyRow.buttonText
              || i18ndc("plasma_applet_org.kde.plasma.notifications", "@action:button", "Send")
        enabled: replyTextField.length > 0
        onClicked: replyRow.replied(replyTextField.text)
        // André
        Rectangle {
        	color: plasmoid.configuration.bgcolorButton ? plasmoid.configuration.bgcolorButton : Style.bgcolorButton
        	implicitWidth: parent.implicitWidth
        	implicitHeight: parent.implicitHeight
        	border.width: 1
        	border.color: plasmoid.configuration.bgcolorButtonBorder ? plasmoid.configuration.bgcolorButtonBorder : Style.bgcolorButtonBorder
									MouseArea { 
										anchors.fill: parent; hoverEnabled: true
										onEntered: {
											parent.color = plasmoid.configuration.bgcolorButtonHover ? plasmoid.configuration.bgcolorButtonHover : Style.bgcolorButtonHover;
											parent.border.color = plasmoid.configuration.bgcolorBorderHover ? plasmoid.configuration.bgcolorBorderHover : Style.bgcolorBorderHover;
										}
										onExited: {
											parent.color = plasmoid.configuration.bgcolorButton ? plasmoid.configuration.bgcolorButton : Style.bgcolorButton;
											parent.border.color = plasmoid.configuration.bgcolorButtonBorder ? plasmoid.configuration.bgcolorButtonBorder : Style.bgcolorButtonBorder;
										}
										onClicked: parent.parent.clicked()
									}
        }
    }
}
