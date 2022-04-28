#
# Copyright (C) 2021 The Android Open-Source Project
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

LOCAL_PATH := $(call my-dir)

$(call declare-license-metadata,$(LOCAL_PATH)/vendor.img,legacy_proprietary,proprietary,$(LOCAL_PATH)/../LICENSE,"Vendor Image",vendor)

ifneq ($(filter raven,$(TARGET_DEVICE)),)
  $(call add-radio-file,bootloader.img)
  $(call declare-license-metadata,$(LOCAL_PATH)/bootloader.img,legacy_proprietary,proprietary,$(LOCAL_PATH)/../LICENSE,"Vendor Bootloader Image",vendor)
  $(call add-radio-file,radio.img)
  $(call declare-license-metadata,$(LOCAL_PATH)/radio.img,legacy_proprietary,proprietary,$(LOCAL_PATH)/../LICENSE,"Vendor Radio Image",vendor)
endif

$(eval $(call declare-copy-files-license-metadata,vendor/google_devices/raven,:samsung,legacy_proprietary,proprietary,vendor/google_devices/raven/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,vendor/google_devices/raven,.jar,legacy_proprietary,proprietary,vendor/google_devices/raven/LICENSE,))
$(eval $(call declare-copy-files-license-metadata,vendor/google_devices/raven,.xml,legacy_proprietary,proprietary,vendor/google_devices/raven/LICENSE,))

ifneq ($(filter raven,$(TARGET_DEVICE)),)
include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE := ShannonQualifiedNetworksService
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_CLASS := APPS
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := platform
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/../COPYRIGHT $(LOCAL_PATH)/../LICENSE
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE := ShannonIms
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_CLASS := APPS
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := platform
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/../COPYRIGHT $(LOCAL_PATH)/../LICENSE
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE := ShannonRcs
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_OWNER := samsung
LOCAL_MODULE_CLASS := APPS
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := platform
LOCAL_LICENSE_KINDS := SPDX-license-identifier-Apache-2.0
LOCAL_LICENSE_CONDITIONS := notice
LOCAL_NOTICE_FILE := $(LOCAL_PATH)/../COPYRIGHT $(LOCAL_PATH)/../LICENSE
include $(BUILD_PREBUILT)

endif
