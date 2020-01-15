
# Prep the Environment

* Activate a Python 3.x environment (I am using 3.6.8)
Note that I am using pyenv to manage environments and do NOT have py3 as thge default (maybe something I should do).
I kept the Python environment activated the entire time. Sure that was necessary. Will experiment more without it later (since I am only using C++).


* [Install OpenCV 4.x](https://www.learnopencv.com/install-opencv-4-on-macos/)

Modify the build instructions to fit my local environment (change the install path and the python location)
```
cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=/Users/butch.howard/projects/opencv/installation/OpenCV-master \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D OPENCV_SKIP_PYTHON_LOADER=ON \
            -D CMAKE_PREFIX_PATH=/usr/local/opt/qt5/ \
            -D CMAKE_MODULE_PATH=/usr/local/opt/qt5/lib/cmake \
            -D OPENCV_PYTHON3_INSTALL_PATH=~/.pyenv/versions/3.6.8/lib/python3.6/site-packages/ \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON ..
         
make -j$(sysctl -n hw.physicalcpu)
make install
 
cd $cwd
```

# Build a simple test app

Crib some simple C++ [face detection code](https://intelligentbee.com/2015/11/18/build-a-face-detector-on-os-x-using-opencv-and-c/) to use. Modify it to fit my local environment.

See `./examples/build_face_detector.sh` for details of the mods.


