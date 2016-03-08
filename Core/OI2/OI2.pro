TARGET = OI2
TEMPLATE = lib
CONFIG += staticlib
CONFIG += c++11
CONFIG+=address_sanitizer

LIBS += -lpthread
HEADERS += \
    irobot.h \
    error.h \
    packets.h \
    psensor.h

SOURCES += \
    irobot.cpp \
    psensor.cpp

