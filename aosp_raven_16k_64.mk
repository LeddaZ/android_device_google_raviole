#
# Copyright 2023 The Android Open-Source Project
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

$(call inherit-product, device/google/raviole/aosp_oriole.mk)

PRODUCT_NAME := aosp_raven_16k_64
PRODUCT_MODEL := AOSP on Raven with !4k pages and support for only 64-bits libraries.
TARGET_KERNEL_DIR := device/google/raviole-kernel/16k

