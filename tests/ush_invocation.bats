#!/usr/bin/env bats

test -f bin/ush

@test "Invocation without arguments prints usage" {
    run bin/ush
    test "$status" -eq 1
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

@test "Invalid options order - path prefix and verbose" {
    ## Let us claim it is a feature rather than a bug...
    run bin/ush -p "x:" -v true
    test "$status" -eq 1
}

@test "Invalid path prefix - length zero" {
    run bin/ush -p "" "echo DONOTPRINTME"
    test "$status" -eq 1
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - length one, case ':'" {
    run bin/ush -p ":" "echo DONOTPRINTME"
    test "$status" -eq 1
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - length one, case not ':'" {
    run bin/ush -p "x" "echo DONOTPRINTME"
    test "$status" -eq 1
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - at least two chars but first is ':'" {
    run bin/ush -p "::" "echo DONOTPRINTME"
    test "$status" -eq 1
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}

@test "Invalid path prefix - at least two chars but last is not ':'" {
    run bin/ush -p "xx" "echo DONOTPRINTME"
    test "$status" -eq 1
    test $(echo "${lines[0]}" | head -n 1 | grep "^usage: ush ")
    test $(echo "$output" | { grep -c DONOTPRINTME || true; }) -eq 0
}
