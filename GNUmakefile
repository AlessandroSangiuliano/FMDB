PACKAGE_NAME = FMDBKit

include $(GNUSTEP_MAKEFILES)/common.make

FRAMEWORK_NAME = FMDBKit

VERSION = 0.1

LIBRARIES_DEPEND_UPON = $(shell pkg-config --libs sqlite3)

BUNDLE_NAME = $(FRAMEWORK_NAME)

${FRAMEWORK_NAME}_OBJCFLAGS += -g -std=c99 -fobjc-arc
${FRAMEWORK_NAME}_LDFLAGS += -g

FMDBKit_OBJC_FILES += $(wildcard FM*.m)

FMDBKit_HEADER_FILES_DIR = .

FMDBKit_HEADER_FILES += $(wildcard FM*.h)

include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/framework.make
