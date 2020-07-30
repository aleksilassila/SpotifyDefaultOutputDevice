TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = Spotify


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SpotifyDefaultOutputDevice

SpotifyDefaultOutputDevice_FILES = Tweak.xm
SpotifyDefaultOutputDevice_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
