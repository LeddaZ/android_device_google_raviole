#
# Copyright (C) 2020 The Android Open-Source Project
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
#

TARGET_KERNEL_DIR := device/google/raviole-kernel

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-slider.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/slider/device-vendor-slider.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/slider/overlay

include device/google/gs101/device-common.mk
include device/google/raviole/audio/slider/audio-tables.mk
include hardware/google/pixel/vibrator/cs40l25/device.mk

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.slider.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.slider.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.slider.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.slider.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.slider.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
    device/google/raviole/thermal_info_config_slider.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Camera
PRODUCT_COPY_FILES += \
    device/google/raviole/media_profiles_slider.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# Bluetooth default BDADDR for EVB only
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.bluetooth.evb_bdaddr="22:22:22:33:44:55"

# SecureElement
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2-service-gto \
    android.hardware.secure_element@1.2-service-gto-ese2

PRODUCT_COPY_FILES += \
    device/google/gs101/nfc/libse-gto-hal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf \
    device/google/gs101/nfc/libse-gto-hal2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal2.conf

# NFC
PRODUCT_COPY_FILES += \
	device/google/raviole/nfc/libnfc-hal-st-disable.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

DEVICE_MANIFEST_FILE += \
	device/google/gs101/nfc/manifest_se_gs101.xml

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += device/google/raviole/powerstats/slider

# Trusty liboemcrypto.so
PRODUCT_SOONG_NAMESPACES += vendor/google_devices/raviole/prebuilts
