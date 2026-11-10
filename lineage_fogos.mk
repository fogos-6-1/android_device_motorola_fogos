# SPDX-License-Identifier: Apache-2.0

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/motorola/fogos/device.mk)
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_fogos
PRODUCT_DEVICE := fogos
PRODUCT_MANUFACTURER := motorola
PRODUCT_BRAND := motorola
PRODUCT_MODEL := moto g34 5G
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# Evolution specific Flags
EVO_BUILD_TYPE := Unofficial
TARGET_ENABLE_BLUR := true
TARGET_DISABLE_MATLOG := true
TARGET_BOOT_ANIMATION_RES := 720
TARGET_USES_LEGACY_BOOTANIMATION := true
TARGET_INCLUDES_OEM_App := true
