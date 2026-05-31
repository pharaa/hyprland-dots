import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Widgets

ShellRoot {
    Variants {
        model: Quickshell.screens

        // Окно
        delegate: WlrLayershell {
            id: root
            property var modelData

            width: 800
            height: 600
            layer: WlrLayer.Overlay
            namespace: "wallpaper-picker"
            keyboardFocus: WlrKeyboardFocus.Exclusive
            anchors { top: false; bottom: false; left: false; right: false }
            color: "transparent"
            property var allWalls: []
            property var filteredWalls: []
            property string stdoutBuffer: ""
            property string searchQuery: ""

            // Получение json-данных обоев (см. get_wallpapers.py)
            Process {
                id: getWallsProc
                command: ["python3", "get_wallpapers.py"]
                running: true
                stdout: SplitParser {
                    onRead: data => root.stdoutBuffer += data
                }
                onExited: {
                    try {
                        root.allWalls = JSON.parse(root.stdoutBuffer);
                        root.filterWalls("");
                    } catch(e) {
                        console.log("Wallpaper JSON Parse error: " + e);
                    }
                }
            }

            function filterWalls(text) {
                searchQuery = text;
                var list = !text ? allWalls : allWalls.filter(function(wall) {
                    return wall.name.toLowerCase().indexOf(text.toLowerCase()) !== -1;
                });
                filteredWalls = list;
                wallsModel.clear();
                for (var i = 0; i < list.length; i++)
                    wallsModel.append(list[i]);
            }

            // Функция установки обоев (см. set_wallpaper.sh)
            function setWallpaper(path) {
                var proc = Qt.createQmlObject('import Quickshell.Io; Process {}', root);
                proc.command = ["bash", "set_wallpaper.sh", path];
                proc.running = true;
                Qt.quit();
            }

            // Окно
            Rectangle {
                id: mainWindow
                anchors.fill: parent
                radius: 15
                color: "#1e1e2e" // Catppuccin Mocha Base
                border.color: "#89b4fa" // Mauve
                border.width: 3
                clip: true
                
                opacity: 0
                scale: 0.95

                Component.onCompleted: appearAnim.start()

                ParallelAnimation {
                    id: appearAnim
                    NumberAnimation { target: mainWindow; property: "opacity"; from: 0; to: 1; duration: 250; easing.type: Easing.OutCubic }
                    NumberAnimation { target: mainWindow; property: "scale"; from: 0.95; to: 1.0; duration: 250; easing.type: Easing.OutBack }
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 25
                    spacing: 20

                    // Поле поиска
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 20

                        Rectangle {
                            Layout.fillWidth: true
                            height: 48
                            radius: 15
                            color: Qt.rgba(1, 1, 1, 0.05)
                            border.width: 1.5
                            border.color: searchInput.activeFocus ? "#89b4fa" : Qt.rgba(1, 1, 1, 0.1)

                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 15
                                anchors.rightMargin: 15

                                TextField {
                                    id: searchInput
                                    Layout.fillWidth: true
                                    font.family: "JetBrainsMono Nerd Font"
                                    font.pixelSize: 15
                                    color: "#CDD6F4"
                                    background: Item {}
                                    placeholderText: "Search wallpapers..."
                                    placeholderTextColor: Qt.rgba(205/255, 214/255, 244/255, 0.3)
                                    focus: true
                                    onTextChanged: root.filterWalls(text)
                                    Keys.onEscapePressed: Qt.quit()
                                }
                            }
                        }
                    }

                    // Превьюшки обоев
                    GridView {
                        id: wallsGrid
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        cellWidth: width / 3
                        cellHeight: 180
                        clip: true
                        model: ListModel { id: wallsModel }

                        delegate: Item {
                            width: wallsGrid.cellWidth
                            height: wallsGrid.cellHeight
                            
                            property bool hovered: false

                            Rectangle {
                                id: card
                                anchors.fill: parent
                                anchors.margins: 8
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                radius: 15
                                clip: true
                                color: "transparent"

                                Image {
                                    anchors.fill: parent
                                    source: "file://" + path
                                    fillMode: Image.PreserveAspectCrop
                                    asynchronous: true
                                    smooth: true
                                    opacity: status === Image.Ready ? 1 : 0
                                    Behavior on opacity { NumberAnimation { duration: 300 } }
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.parent.hovered = true
                                    onExited: parent.parent.hovered = false
                                    onClicked: setWallpaper(path)
                                }

                                scale: hovered ? 1.05 : 1.0
                                Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutCubic } }
                            }
                        }
                    }
                }
            }
        }
    }
}