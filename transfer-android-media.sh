#!/usr/bin/env bash
# Published under MIT license.
# Copyright 2025 酸柠檬猹/SourLemonJuice

script_name="transfer-android-media.sh"

function PrintHelp {
    echo "Usage: ${script_name} [--help] <source_prefix> <destination_prefix>"
}

# $1: log message
function PrintWarning {
    echo -n "${script_name}: "
    echo -e "$1"
}

# parsing source arg

if [[ "$1" == "--help" ]]; then
    PrintHelp
    exit 0
elif [[ -z "$1" ]]; then
    PrintWarning "Source prefix folder missing.\n"
    PrintHelp
    exit 1
fi
src_prefix="$1"

if [[ ! -d "${src_prefix}/DCIM/" ]]; then
    PrintWarning "No DCIM folder found in: ${src_prefix}"
    exit 1
fi

# parsing dest arg

if [[ -z "$2" ]]; then
    PrintWarning "Destination prefix folder missing.\n"
    PrintHelp
    exit 1
fi
dest_prefix="$2"

# prepare rsync flags

shift 2
rsync_flags=(
    "$@"
    "--recursive"
    "--verbose"
    "-P"
    "--times"
    "--exclude=.trashed-*"
    "--exclude=.thumbnails/"
)

subfolders=(
    "DCIM"
    "Pictures"
    "Movies"
)

for subdir in "${subfolders[@]}"; do
    echo "=> backuping ${subdir}"

    rsync \
        "${rsync_flags[@]}" \
        "${src_prefix}/${subdir}/" \
        "${dest_prefix}/${subdir}/" \
        || exit "$?"
done
