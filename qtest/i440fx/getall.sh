#!/bin/bash
$ cd build
$ QTEST_QEMU_BINARY=./qemu-system-x86_64 ./tests/qtest/i440fx-test

$ QTEST_QEMU_BINARY=./qemu-system-x86_64 ./tests/qtest/i440fx-test -l
TAP version 13
# random seed: R02S6e5d8bac56ebda95a107cbfb0df06ff6
1..4
# Start of x86_64 tests
# Start of i440fx tests
# /x86_64/i440fx/defaults
# /x86_64/i440fx/pam
# Start of firmware tests
# /x86_64/i440fx/firmware/bios
# /x86_64/i440fx/firmware/pflash
# End of firmware tests
# End of i440fx tests
# End of x86_64 tests

$ QTEST_QEMU_BINARY=./qemu-system-x86_64 ./tests/qtest/i440fx-test -p /x86_64/i440fx/pam
