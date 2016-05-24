FILES := $(wildcard src/*.cpp)
OBJS := $(FILES:.cpp=.o)
CFLAGS = -std=c++11 -Wall

TARGET = test
BUILD_DIR = .build

all: CPPFLAGS = -DCATCH_TEST
all: INCLUDE = -I.

# link all
all: dir $(OBJS)
	g++ $(OBJS) -o $(BUILD_DIR)/$(TARGET) 

# pull deps in .d files
-include $(OBJS:.o=.d)

# compile
%.o: %.cpp
	g++ -c $(CFLAGS) $(INCLUDE) $(CPPFLAGS) $*.cpp -o $*.o
	g++ -MM $(CFLAGS) $*.cpp > $*.d

clean:
	rm -rf $(BUILD_DIR)

MKDIR = mkdir -p

.PHONY: dir

dir: ${BUILD_DIR}

${BUILD_DIR}:
	${MKDIR} ${BUILD_DIR}
