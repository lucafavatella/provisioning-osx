#!/usr/bin/env bats

test -f bin/ush

@test "Run command with zero exit status" {
    run bin/ush true
    test "$status" -eq 0
}

@test "Run command with non-zero exit status" {
    run bin/ush false
    test "$status" -ne 0
}

@test "Run command with specific non-zero exit status" {
    run bin/ush "exit 46"
    test "$status" -eq 46
}
