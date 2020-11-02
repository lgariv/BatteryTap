ARCHS = arm64 arm64e
TARGET := iphone:clang:latest

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BatteryTap

BatteryTap_FILES = Tweak.x
BatteryTap_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
