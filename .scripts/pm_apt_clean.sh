#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

pm_apt_clean() {
    info "Removing unused packages."
    apt-get -y autoremove > /dev/null 2>&1 || fatal "Failed to remove unused packages from apt.\nFailing command: ${F[C]}apt-get -y autoremove"
    info "Cleaning up package cache."
    apt-get -y autoclean > /dev/null 2>&1 || fatal "Failed to cleanup cache from apt.\nFailing command: ${F[C]}apt-get -y autoclean"
}

test_pm_apt_clean() {
    run_script 'pm_apt_clean'
}
