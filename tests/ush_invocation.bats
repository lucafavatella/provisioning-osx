#!/usr/bin/env bats

test -f bin/ush

@test "Invocation without arguments prints usage" {
    run bin/ush
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
}

@test "Successful invocation - basic" {
    run bin/ush true
    test "$status" -eq 0
}

@test "Successful invocation - verbose" {
    run bin/ush -v true
    test "$status" -eq 0
}

@test "Successful invocation - path prefix" {
    run bin/ush -p "x:" true
    test "$status" -eq 0
}

@test "Successful invocation - verbose and path prefix" {
    run bin/ush -v -p "x:" true
    test "$status" -eq 0
}

@test "Successful invocation - path prefix and verbose" {
    run bin/ush -p "x:" -v true
    test "$status" -eq 0
}

@test "Invalid invocation - path prefix *without option-argument* and verbose" {
    run bin/ush -p -v "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid invocation - verbose option twice" {
    run bin/ush -v -v true
    test "$status" -eq 64
}

@test "Invalid invocation - path prefix option twice" {
    run bin/ush -p "x:" -p "x:" true
    test "$status" -eq 64
}

@test "Invalid invocation - too many arguments" {
    run bin/ush "echo DONOTPRINTME" "superfluous argument"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - length zero" {
    run bin/ush -p "" "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - length one, case ':'" {
    run bin/ush -p ":" "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - length one, case not ':'" {
    run bin/ush -p "x" "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - at least two chars but first is ':'" {
    run bin/ush -p "::" "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - at least two chars but last is not ':'" {
    run bin/ush -p "xx" "echo DONOTPRINTME"
    test "$status" -eq 64
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}
