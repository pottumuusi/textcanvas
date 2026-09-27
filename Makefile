LIBRARY_NAME := textcanvas
LIBRARY_FILE := lib$(LIBRARY_NAME).a

PROJECT_ROOT := /home/tank/my/repositories/github/re-release/pottumuusi/textcanvas

HEADER_DIRECTORY := include
SOURCE_DIRECTORY_LIBRARY := src/library
SOURCE_DIRECTORY_TEST := src/test
SOURCE_DIRECTORY_DEMO := src/demo
OUT_DIRECTORY := out # Not used currently

HEADER_FILES := $(wildcard $(HEADER_DIRECTORY)/*.h)
SOURCE_FILES_LIBRARY := $(wildcard $(SOURCE_DIRECTORY_LIBRARY)/*.c)
SOURCE_FILES_TEST := $(wildcard $(SOURCE_DIRECTORY_TEST)/*.c)
SOURCE_FILES_DEMO := $(wildcard $(SOURCE_DIRECTORY_DEMO)/*.c)

AR_OPTIONS := rcs

OBJECT_FILES_LIBRARY := $(SOURCE_FILES_LIBRARY:.c=.o)
OBJECT_FILES_TEST := $(SOURCE_FILES_TEST:.c=.o)
OBJECT_FILES_DEMO := $(SOURCE_FILES_DEMO:.c=.o)

CFLAGS := -c -I$(HEADER_DIRECTORY)
LDFLAGS := -l$(LIBRARY_NAME)

EXE_TEST := test
EXE_DEMO := demonstration

# https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html
# https://www.gnu.org/software/make/manual/html_node/Suffix-Rules.html
.c.o:
	$(CC) $(CFLAGS) -o $@ $<

$(LIBRARY_FILE): $(OBJECT_FILES_LIBRARY)
	$(AR) $(AR_OPTIONS) $(LIBRARY_FILE) $^

$(EXE_TEST): $(LIBRARY_FILE) $(OBJECT_FILES_TEST)
	LIBRARY_PATH=$(PROJECT_ROOT) $(CC) -o $@ $^ $(LDFLAGS)

$(EXE_DEMO): $(LIBRARY_FILE) $(OBJECT_FILES_DEMO)
	LIBRARY_PATH=$(PROJECT_ROOT) $(CC) -o $@ $^ $(LDFLAGS)
