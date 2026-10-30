#include <stdio.h>
#include <textcanvas.h>

/*
 * Return value of all unit_test_* functions: did the test pass?
 */

bool
unit_test_return_value()
{
	if (123 == test_return()) {
		return true;
	}

	printf("Unit test '%s' failed.\n", __func__);
	return false;
}

/*
 * Return value: did all of the tests pass?
 */
bool
run_unit_tests()
{
	if (false == unit_test_return_value()) {
		return false;
	}

	return true;
}

int
main(void)
{
	bool unit_tests_passed = false;

	printf("Running unit tests.\n");

	unit_tests_passed = run_unit_tests();
	if (false == unit_tests_passed) {
		printf("Unit tests failed.\n");
		goto fail;
	}

	printf("All tests passed!\n");

	return 0;

fail:
	return 1;
}
