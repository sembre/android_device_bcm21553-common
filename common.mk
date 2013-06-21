# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Libs
PRODUCT_PACKAGES += \
    libstagefrighthw \
    overlay.bcm21553 \
    lights.bcm21553

# Update utilities
PRODUCT_PACKAGES += \
    libOmxCore \
    SamsungServiceMode \
    dexpreopt \
    dump_image \
    e2fsck \
    erase_image \
    flash_image \
    screencap \
    FM \
    HoloSpiralWallpaper \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/bcm21553-common/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/samsung/bcm21553-common/prebuilt/usr/keychars/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \

# Keymap
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/bcm21553-common/prebuilt/usr/keylayout/sec_keypad.kl:system/usr/keylayout/sec_keypad.kl

# Media
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
    device/samsung/bcm21553-common/prebuilt/etc/asound.conf:system/etc/asound.conf \
    device/samsung/bcm21553-common/prebuilt/etc/vold.fstab:system/etc/vold.fstab \

# GPS
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/etc/gps.conf:system/etc/gps.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/samsung/bcm21553-common/prebuilt/bin/get_macaddrs:system/bin/get_macaddrs \

# HGL
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/lib/egl/libGLES_hgl.so:system/lib/egl/libGLES_hgl.so \

# Gralloc
PRODUCT_COPY_FILES += \
    device/samsung/bcm21553-common/prebuilt/lib/hw/gralloc.bcm21553.so:system/lib/hw/gralloc.default.so 


PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.telephony.ril_class=samsung \
    ro.telephony.sends_barcount=1 \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
    persist.service.usb.setting=0 \
    dev.sfbootcomplete=0 \
    persist.sys.vold.switchexternal=1

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# Enable Google-specific location features, like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Note for the kernel:
#    * This kernel is not compatible with your device, it's just for build the ROM
#    * Delete the boot.img inside your package and modify update-script to not install kernel

#ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/bcm21553-common/prebuilt/kernel
#else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
#endif

#PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
