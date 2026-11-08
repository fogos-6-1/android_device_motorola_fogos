
#!/bin/bash

echo "--- Initializing Fogos Source Sync ---"

clone_if_missing() {
    local repo_url=$1
    local branch=$2
    local target_dir=$3
    local revision=""

    shift 3

    if [[ "$1" == revision=* ]]; then
        revision="${1#revision=}"
    fi

    if [ -d "$target_dir" ]; then
        echo "Skipping: $target_dir already exists"
        return 0
    fi

    echo "Cloning: $target_dir"

    git clone --single-branch --branch "$branch" "$repo_url" "$target_dir" || return 1

    if [ -n "$revision" ]; then
        git -C "$target_dir" checkout "$revision" || return 1
    fi

    echo "Successfully cloned: $target_dir"
}

# Device
clone_if_missing "https://github.com/fogos-6-1/android_device_motorola_fogos.git" "lineage-24.0-6.1" "device/motorola/fogos"

clone_if_missing "https://github.com/fogos-6-1/android_device_motorola_sm6375-common.git" "lineage-24.0-6.1" "device/motorola/sm6375-common"

# Vendor
clone_if_missing "https://github.com/fogos-6-1/proprietary_vendor_motorola_fogos.git" "lineage-24.0-6.1" "vendor/motorola/fogos"

clone_if_missing "https://github.com/fogos-6-1/proprietary_vendor_motorola_sm6375-common.git" "lineage-24.0-6.1" "vendor/motorola/sm6375-common"

# Qualcomm Health
clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_healthd-ext.git" "lineage-24.0-6.1" "vendor/qcom/opensource/healthd-ext"

# Qualcomm Hardware
clone_if_missing "https://github.com/fogos-6-1/android_hardware_qcom_bootctrl.git" "lineage-24.0-6.1" "hardware/qcom-caf/bootctrl"

clone_if_missing "https://github.com/fogos-6-1/android_hardware_qcom_common.git" "lineage-24.0-6.1" "hardware/qcom-caf/common"

clone_if_missing "https://github.com/fogos-6-1/android_hardware_qcom_audio.git" "lineage-24.0-6.1" "hardware/qcom-caf/fogos-legacy-audio"

clone_if_missing "https://github.com/fogos-6-1/android_hardware_qcom_display.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/display"

# Qualcomm Audio
clone_if_missing "https://github.com/fogos-6-1/android_hardware_qcom_audio_ar.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/audio/primary-hal"

clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_arpal_lx.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/audio/pal"

clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_agm.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/audio/agm"

clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_audioreach_graphservices.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/audio/graphservices"

# Qualcomm Data
clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_data_ipa_cfg_mgr.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/data-ipa-cfg-mgr"

clone_if_missing "https://github.com/fogos-6-1/android_vendor_qcom_opensource_dataipa.git" "lineage-24.0-6.1" "hardware/qcom-caf/sm6375-6.1/dataipa"

# Prebuilt Kernel
clone_if_missing "https://github.com/fogos-6-1/android_device_motorola_fogos-kernel.git" "lineage-24.0-6.1" "device/motorola/fogos-kernel"

# Motorola Hardware
clone_if_missing "https://github.com/fogos-6-1/android_hardware_motorola.git" "lineage-24.0-6.1" "hardware/motorola" revision="50e65e5fd3ede70dd6417a9dbfe0ce5d798c626e"

# Samsung NFC
clone_if_missing "https://github.com/fogos-6-1/android_hardware_samsung_slsi_nfc.git" "lineage-24.0-6.1" "hardware/samsung_slsi/nfc" revision="88490b4408246e6c10ef1a6942844796f66dee5e"

echo ""
echo "--- Fogos Source Sync Complete ---"
