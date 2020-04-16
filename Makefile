INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TripleToLow

TripleToLow_FILES = Tweak.x
TripleToLow_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
