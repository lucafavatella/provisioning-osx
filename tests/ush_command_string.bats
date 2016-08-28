#!/usr/bin/env bats

test -f bin/ush

@test "Run command with zero exit status" {
    run bin/ush -c true
    test "$status" -eq 0
}

@test "Run command with non-zero exit status" {
    run bin/ush -c false
    test "$status" -ne 0
}

@test "Run command with specific non-zero exit status" {
    run bin/ush -c "exit 46"
    test "$status" -eq 46
}

@test "Run command using standard output" {
    run bin/ush -c "echo foo"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^foo$")
}

@test "Run command using standard error" {
    run bin/ush -c "echo foo >&2"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^foo$")
}
