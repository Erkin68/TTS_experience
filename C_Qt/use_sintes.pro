TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        main.cpp

HEADERS += \
    audio_util.h \
    cxxopts.hpp \
    dr_wav.h \
    json.hpp \
    tf_synthesizer.h

LIBS += /home/erkin/use_sintes/tf_synthesizer.cc.o
LIBS += /home/erkin/use_sintes/audio_util.cc.o
LIBS += -lasan
LD_FLAGS = -fsanitize=address -static-libasan



INCLUDEPATH += $$PWD/../../../usr/local/include
DEPENDPATH += $$PWD/../../../usr/local/include

INCLUDEPATH += $$PWD/../../../usr/local/cuda-10.0/nvvm/lib64
DEPENDPATH += $$PWD/../../../usr/local/cuda-10.0/nvvm/lib64

INCLUDEPATH += $$PWD/../../../usr/lib/gcc/x86_64-linux-gnu/9
DEPENDPATH += $$PWD/../../../usr/lib/gcc/x86_64-linux-gnu/9



LIBS += -L$$PWD/../tensorflow/bazel-bin/tensorflow/ -ltensorflow
LIBS += -L$$PWD/../../../usr/local/cuda-10.0/lib64/ -lcudnn
LIBS += -L$$PWD/../../../usr/local/cuda-10.0/lib64/ -lcublas

INCLUDEPATH += $$PWD/../tensorflow/bazel-bin/tensorflow
DEPENDPATH += $$PWD/../tensorflow/bazel-bin/tensorflow

INCLUDEPATH += $$PWD/../../../usr/local/cuda-10.0/lib64
DEPENDPATH += $$PWD/../../../usr/local/cuda-10.0/lib64


LIBS += -L$$PWD/../../../usr/lib/x86_64-linux-gnu/ -lcuda

INCLUDEPATH += $$PWD/../../../usr/lib/x86_64-linux-gnu
DEPENDPATH += $$PWD/../../../usr/lib/x86_64-linux-gnu
