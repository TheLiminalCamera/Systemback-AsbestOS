QT -= gui
QT += core

TARGET = systemback-cli

CONFIG -= app_bundle
CONFIG += console \
          c++11 \
          exceptions_off

TEMPLATE = app

DEFINES += _FILE_OFFSET_BITS=64

SOURCES += main.cpp \
           systemback-cli.cpp

HEADERS += systemback-cli.hpp

QMAKE_CXXFLAGS += -g \
                  -fno-rtti \
                  -fvisibility=hidden \
                  -fvisibility-inlines-hidden \
                  -fno-asynchronous-unwind-tables


QMAKE_LFLAGS += -g \
                -Wl,-rpath=/usr/lib/systemback \
                -Wl,--as-needed \
                -fuse-ld=gold \
                -Wl,-z,relro

! equals(QMAKE_CXX, clang++) {
    QMAKE_CXXFLAGS += -flto
    QMAKE_LFLAGS += -flto
}

LIBS += -L../libsystemback \
        -lsystemback \
        -lncursesw

# for arch linux with gcc 12

QMAKE_CC = gcc-11
QMAKE_CXX = g++-11
QMAKE_LINK = g++-11
QMAKE_AR = gcc-ar-11 cqs
