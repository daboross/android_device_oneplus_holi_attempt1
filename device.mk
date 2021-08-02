
LOCAL_PATH := device/oneplus/holi

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Launched with pie
$(call inherit-product, build/make/target/product/product_launched_with_p.mk)

# define hardware platform
PRODUCT_PLATFORM := sm4350

#TEST
# A/B support
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES += \
    bootctrl.sm4350

TARGET_RECOVERTY_DEVICE_MODULES +=
    android.hidl.base@1.0


AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Enable update engine sideloading by including the static version of the
# boot_control HAL and its dependencies.
PRODUCT_PACKAGES := \
    bootctrl.sm4350 \
    libgptutils \
    libz \
    libcutils


# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service
