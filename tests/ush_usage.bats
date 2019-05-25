#!/usr/bin/env bats

test -f bin/ush

@test "Invocation without arguments prints usage" {
    run bin/ush
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
}

@test "Successful invocation - basic" {
    run bin/ush -c true
    test "$status" -eq 0
}

@test "Successful invocation - verbose" {
    run bin/ush -c -v true
    test "$status" -eq 0
}

@test "Successful invocation - command name" {
    run bin/ush -c date foo
    test "$status" -eq 0
}

@test "Successful invocation - positional parameters" {
    run bin/ush -c echo echo hi
    test "$status" -eq 0
}

@test "Invalid invocation - command string without initial 'c' option" {
    run bin/ush "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid invocation - wrong initial option (should be 'c')" {
    run bin/ush -w "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid invocation - unknown option" {
    run bin/ush -c -w "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid invocation - verbose option twice" {
    run bin/ush -c -v -v "echo DONOTPRINTME"
    test "$status" -eq 64
}
