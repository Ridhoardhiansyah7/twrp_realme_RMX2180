# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable virtual A/B OTA
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Inherit some common pbrp stuff.
$(call inherit-product-if-exists, vendor/pb/config/common.mk)

# Inherit from RMX2180 device
$(call inherit-product, device/realme/RMX2180/device.mk)

PRODUCT_DEVICE := RMX2180
PRODUCT_NAME := pbrp_RMX2180
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX2180
PRODUCT_MANUFACTURER := realme

PRODUCT_SHIPPING_API_LEVEL := 29

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock

# Bypass anti-rollback ROMs protection
# Set build date to Jan 1 2009 00:00:00
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.date.utc=1230768000