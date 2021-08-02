#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := holi

$(call inherit-product, build/target/product/aosp_arm64.mk)

# Inherit from our custom product configuration
#$(call inherit-product, vendor/holi/config/common.mk)
# fingers crossed this is close enough to the sm4350!
#$(call inherit-product, device/oneplus/sm8350-common/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oneplus/holi/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := holi
PRODUCT_NAME := aosp_holi
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := OnePlus DE2117
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=oneplusnordn2005g \
    BUILD_PRODUCT=OnePlusNordN2005G \
    TARGET_DEVICE=OnePlusNordN2005G


# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
