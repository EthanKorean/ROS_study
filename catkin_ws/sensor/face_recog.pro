QT += core guid
greaterThan(QT_MAJOR_VERSION, 5): QT += widgets

TARGET = face_sensor
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS
INCLUDEPATH += include
SOURCES += \
            src/face_recog/main.cpp\
            src/face_recog/mainwindow.cpp\
HEADERS += \
            include/mainwindow.h
DISTFILES += CMakeList.txt
QML_IMPORT_PATH += /usr/share/doc/qml-module-qtgraphicaleffects
