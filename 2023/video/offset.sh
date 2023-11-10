#!/bin/bash

set -euo pipefail

function msg {
    echo "${@}" >&2
}

function die {
    msg "${@}"
    exit 1
}

if [[ $# -ne 3 ]]; then
    die "usage: ${0} <input> <output> <offset>"
fi

input="${1}"
output="${2}"
offset="${3}"

if [[ ! -f "${input}" ]]; then
    die "input file ${input} does not exist"
fi

if [[ -e "${output}" ]]; then
    die "output file ${output} already exists"
fi

ffmpeg -i "${input}" -itsoffset "${offset}" -i "${input}" -map 1:v -map 0:a -c copy "${output}"
