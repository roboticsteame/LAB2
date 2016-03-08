TEMPLATE = subdirs
SUBDIRS = Core
CONFIG += c++11

control{
    SUBDIRS += Control
}
robot{
    SUBDIRS += Robot
}


CONFIG += ordered
