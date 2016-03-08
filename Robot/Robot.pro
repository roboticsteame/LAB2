TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt
CONFIG += c++11
CONFIG+=address_sanitizer

LIBS += -pthread
SOURCES += main.cpp



win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Core/Network/release/ -lNetwork
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Core/Network/debug/ -lNetwork
else:unix: LIBS += -L$$OUT_PWD/../Core/Network/ -lNetwork

INCLUDEPATH += $$PWD/../Core/Network
DEPENDPATH += $$PWD/../Core/Network

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Core/Network/release/libNetwork.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Core/Network/debug/libNetwork.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Core/Network/release/Network.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Core/Network/debug/Network.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../Core/Network/libNetwork.a
