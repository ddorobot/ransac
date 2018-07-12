OPENCV_INC_PATH='/usr/local/include'
OPENCV_LIB_PATH='/usr/local/lib'

OPENCV_DEP_LIB+=-lopencv_calib3d 
OPENCV_DEP_LIB+=-lopencv_contrib 
OPENCV_DEP_LIB+=-lopencv_core 
OPENCV_DEP_LIB+=-lopencv_features2d 
OPENCV_DEP_LIB+=-lopencv_flann 
OPENCV_DEP_LIB+=-lopencv_gpu 
OPENCV_DEP_LIB+=-lopencv_highgui 
OPENCV_DEP_LIB+=-lopencv_imgproc 
OPENCV_DEP_LIB+=-lopencv_legacy 
OPENCV_DEP_LIB+=-lopencv_ml 
OPENCV_DEP_LIB+=-lopencv_objdetect 
OPENCV_DEP_LIB+=-lopencv_ocl 
OPENCV_DEP_LIB+=-lopencv_photo 
OPENCV_DEP_LIB+=-lopencv_stitching 
OPENCV_DEP_LIB+=-lopencv_superres 
OPENCV_DEP_LIB+=-lopencv_ts 
OPENCV_DEP_LIB+=-lopencv_video 
OPENCV_DEP_LIB+=-lopencv_videostab

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
	$(CXX) -o $(TARGET) $(OBJECTS) $(LIBS) -IOpenGL -IGLUT
	@echo 'Building Finished:'

clean:
	@echo rm -f $(OBJECTS) $(TARGET) 
	rm -f $(OBJECTS) $(TARGET) 
	@echo 'Clean FInished!'
 
.cpp .h .hpp .o :
	$(CCX) $(CXXFLAGS) -c $< -o $@ 

-include $(OBJS:.o=.d)
