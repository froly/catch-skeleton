#ifdef CATCH_TEST
	#define CATCH_CONFIG_MAIN
	#include <Catch/single_include/catch.hpp>
#endif
#include "test.hpp"

#ifdef CATCH_TEST

TEST_CASE("TEST") {
	REQUIRE(1);
}

#else

int main() {
	return 0;
}

#endif

