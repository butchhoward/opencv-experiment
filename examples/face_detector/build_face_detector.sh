#!/usr/bin/env bash

OPENCV_INSTALL="/Users/butch.howard/projects/opencv/installation/OpenCV-master"

# remember to copy the file
#   ${OPENCV_INSTALL}/data/lbpcascades/lbpcascade_frontalface.xml
# to this folder (where the executable is)

# used brew install zlib
# instead of opencv 3rdparty tools
#-L"${OPENCV_INSTALL}"/share/OpenCV/3rdparty/lib/ -llibpng -llibjpeg -llibwebp -llibtiff -lzlib -lIlmImf -llibjasper 

#removed in opencv 4
# -lopencv_hal

#rpath setting allowed the libs to be found at runtime, but is very dependent on my system set up

g++ -std=c++11 \
-o faces faces.cpp \
-rpath @executable_path/../../../opencv/installation/OpenCV-master/lib/ \
-I"${OPENCV_INSTALL}"/include/opencv4/ \
-L"${OPENCV_INSTALL}"/lib/ -lopencv_core -lopencv_imgproc -lopencv_objdetect \
-lopencv_imgcodecs -lopencv_highgui  -lopencv_videoio \
"$(pkg-config --cflags --libs zlib)" \
-framework AVFoundation -framework QuartzCore \
-framework CoreMedia -framework Cocoa -framework QTKit
