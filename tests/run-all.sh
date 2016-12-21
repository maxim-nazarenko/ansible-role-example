#!/bin/bash -ae

SCRIPT_FILE=$(readlink -e "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_FILE")

SLAPD_DOMAIN_NAME="$(echo $SLAPD_DOMAIN| sed -e 's/^\([^\.]*\)\..*$/\1/g')"
SLAPD_DOMAIN_DC_FORMAT="dc=$(echo $SLAPD_DOMAIN| sed -e 's/\./,dc=/g')"
SLAPD_PASSWORD_HASH=$(slappasswd -n -s "$SLAPD_PASSWORD")

TEST_USER="user_$(date +'%s')"
TEST_USER_PASSWORD="test_pass"
TEST_USER_PASSWORD_HASH=$(slappasswd -n -s "$TEST_USER_PASSWORD")

run-parts $SCRIPT_DIR/parts.d/
