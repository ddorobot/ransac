OPENCV_INC_PATH='/usr/local/include'
OPENCV_LIB_PATH='/usr/local/lib'

OPENCV_DEP_LIB+=-lopencv_calib3d.2.4.11 
OPENCV_DEP_LIB+=-lopencv_contrib.2.4.11 
OPENCV_DEP_LIB+=-lopencv_core.2.4.11 
OPENCV_DEP_LIB+=-lopencv_features2d.2.4.11 
OPENCV_DEP_LIB+=-lopencv_flann.2.4.11 
OPENCV_DEP_LIB+=-lopencv_gpu.2.4.11 
OPENCV_DEP_LIB+=-lopencv_highgui.2.4.11 
OPENCV_DEP_LIB+=-lopencv_imgproc.2.4.11 
OPENCV_DEP_LIB+=-lopencv_legacy.2.4.11 
OPENCV_DEP_LIB+=-lopencv_ml.2.4.11 
OPENCV_DEP_LIB+=-lopencv_nonfree.2.4.11 
OPENCV_DEP_LIB+=-lopencv_objdetect.2.4.11 
OPENCV_DEP_LIB+=-lopencv_ocl.2.4.11 
OPENCV_DEP_LIB+=-lopencv_photo.2.4.11 
OPENCV_DEP_LIB+=-lopencv_stitching.2.4.11 
OPENCV_DEP_LIB+=-lopencv_superres.2.4.11 
OPENCV_DEP_LIB+=-lopencv_ts 
OPENCV_DEP_LIB+=-lopencv_video.2.4.11 
OPENCV_DEP_LIB+=-lopencv_videostab.2.4.11

TARGET = RansacCurveFitting

CXX=gcc
CXXFLAGS = -I$(OPENCV_INC_PATH) -I$(INCLUDE) -O0 -g3 -Wall -c -std=c++11
LIBS =    -L$(OPENCV_LIB_PATH) -lpthread -ldl -lm -std=gnu++0x -std=c++0x -lstdc++ $(OPENCV_DEP_LIB)

SOURCES += main.cpp

OBJECTS += main.o 

.PHONY: all clean

all:  $(TARGET)

$(TARGET): $(OBJECTS)
	@echo 'Building $(TARGET)='
	@echo $(CXX) -o $(TARGET) $(OBJECTS) $(LIBS) 
	$(CXX) -o $(TARGET) $(OBJECTS) $(LIBS) -framework OpenGL -framework GLUT
	@echo 'Building Finished:'

clean:
	@echo rm -f $(OBJECTS) $(TARGET) 
	rm -f $(OBJECTS) $(TARGET) 
	@echo 'Clean FInished!'
 
.cpp .h .hpp .o :
	$(CCX) $(CXXFLAGS) -c $< -o $@ 

-include $(OBJS:.o=.d)
