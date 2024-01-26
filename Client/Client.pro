QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    clientgreeter.cpp \
    main.cpp \
    clientwindow.cpp

HEADERS += \
    clientgreeter.h \
    clientwindow.h

FORMS += \
    clientwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

#add both windows and linux can use
win32{
    include(grpc_win.pri)
    CONFIG(debug,debug|release){
        INCLUDEPATH += $$PWD/../gRPC_install/grpc_install_debug_win/proto_gen_debug

        SOURCES += \
            $$PWD/../gRPC_install/grpc_install_debug_win/proto_gen_debug/helloworld.grpc.pb.cc \
            $$PWD/../gRPC_install/grpc_install_debug_win/proto_gen_debug/helloworld.pb.cc \

        HEADERS += \
            $$PWD/../gRPC_install/grpc_install_debug_win/proto_gen_debug/helloworld.grpc.pb.h \
            $$PWD/../gRPC_install/grpc_install_debug_win/proto_gen_debug/helloworld.pb.h \
    }else{
        INCLUDEPATH += $$PWD/../gRPC_install/grpc_install_release_win/proto_gen_release

        SOURCES += \
            $$PWD/../gRPC_install/grpc_install_release_win/proto_gen_release/helloworld.grpc.pb.cc \
            $$PWD/../gRPC_install/grpc_install_release_win/proto_gen_release/helloworld.pb.cc \

        HEADERS += \
            $$PWD/../gRPC_install/grpc_install_release_win/proto_gen_release/helloworld.grpc.pb.h \
            $$PWD/../gRPC_install/grpc_install_release_win/proto_gen_release/helloworld.pb.h \
    }
}
unix{
    include(grpc_linux.pri)
    CONFIG(debug,debug|release){
        INCLUDEPATH += $$PWD/../gRPC_install/grpc_install_debug_linux/proto_gen_debug

        SOURCES += \
            $$PWD/../gRPC_install/grpc_install_debug_linux/proto_gen_debug/helloworld.grpc.pb.cc \
            $$PWD/../gRPC_install/grpc_install_debug_linux/proto_gen_debug/helloworld.pb.cc \

        HEADERS += \
            $$PWD/../gRPC_install/grpc_install_debug_linux/proto_gen_debug/helloworld.grpc.pb.h \
            $$PWD/../gRPC_install/grpc_install_debug_linux/proto_gen_debug/helloworld.pb.h \
    }else{
            INCLUDEPATH += $$PWD/../gRPC_install/grpc_install_release_linux/proto_gen_release

            SOURCES += \
                $$PWD/../gRPC_install/grpc_install_release_linux/proto_gen_release/helloworld.grpc.pb.cc \
                $$PWD/../gRPC_install/grpc_install_release_linux/proto_gen_release/helloworld.pb.cc \

            HEADERS += \
                $$PWD/../gRPC_install/grpc_install_release_linux/proto_gen_release/helloworld.grpc.pb.h \
                $$PWD/../gRPC_install/grpc_install_release_linux/proto_gen_release/helloworld.pb.h \
    }
}
