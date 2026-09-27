#!/bin/bash

set -e

error_exit() {
	echo "${1}"
	exit 1
}

run_test() {
	local -r file_test='test'

	set +e

	./${file_test}
	exit_status="${?}"
	if [ '0' != "${exit_status}" ] ; then
		error_exit "Test failed. Exit status: ${exit_status}"
	fi

	set -e
}

run_demonstration() {
	local -r file_demonstration='demonstration'

	set +e

	./${file_demonstration}
	exit_status="${?}"
	if [ '0' != "${exit_status}" ] ; then
		error_exit "Demonstration failed. Exit status: ${exit_status}"
	fi

	set -e
}

verify_variant_release() {
	verify_variant 'release'
}

verify_variant_debug() {
	verify_variant 'debug'
}

verify_variant() {
	local -r variant="${1}"

	echo ""
	echo " Verifying variant: '${variant}' ."
	echo ""

	make clean

	TEXTCANVAS_VARIANT="${variant}" make test
	run_test

	TEXTCANVAS_VARIANT="${variant}" make demonstration
	run_demonstration

	echo ""
	echo " Verification of variant '${variant}' is successful."
	echo ""
}

main() {
	local exit_status=''

	verify_variant_debug

	verify_variant_release

	echo ""
	echo " Verification successful! "
	echo ""
}

main "${@}"
