
#!/bin/bash
echo "--- Applying Fogos Commits ---"
add_remote_and_pick() {
    local target_dir=$1
    local remote_name=$2
    local repo_url=$3
    shift 3
    echo "Processing: $target_dir"
    if [ ! -d "$target_dir/.git" ]; then
        echo "ERROR: Repository not found: $target_dir"
        return 1
    fi
    if git -C "$target_dir" remote get-url "$remote_name" >/dev/null 2>&1; then
        git -C "$target_dir" remote set-url "$remote_name" "$repo_url" || return 1
    else
        git -C "$target_dir" remote add "$remote_name" "$repo_url" || return 1
    fi
    git -C "$target_dir" fetch "$remote_name" || return 1
    for commit in "$@"; do
        if git -C "$target_dir" merge-base --is-ancestor "$commit" HEAD 2>/dev/null; then
            echo "Already applied: $commit"
            continue
        fi
        if ! git -C "$target_dir" cat-file -e "$commit^{commit}" 2>/dev/null; then
            echo "ERROR: Commit not found: $commit"
            return 1
        fi
        echo "Cherry-picking: $commit"
        git -C "$target_dir" cherry-pick "$commit"
    done
    echo "Completed: $target_dir"
}
add_remote_and_pick vendor/lineage fogos61 https://github.com/fogos-6-1/vendor_evolution.git 67ff748c188989b75a87a8783cffac3bb3ce281e
add_remote_and_pick frameworks/av fogos61 https://github.com/fogos-6-1/frameworks_av.git 90d60bbdecd567b8c8cd80d610d5b5aaec5b5ba0
add_remote_and_pick hardware/qcom-caf/common fogos61 https://github.com/fogos-6-1/android_hardware_qcom-caf_common.git 6fb923d4d6349eb40c1689b599db44208c678b25 751dbe8e6af4d27ba84dce79c54a769966c1c322 d1ae9c46329664a44daa81bb55d924ce7c454480
echo "--- All Fogos Commits Applied Successfully ---"
