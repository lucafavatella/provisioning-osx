#!/usr/bin/env bats

test -f bin/ush

@test "Option verbose is verbose" {
    run bin/ush -c -v true
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^true$")
}

@test "Option verbose outputs before command using standard output" {
    run bin/ush -c -v "echo foo"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^echo foo$")
    test $(echo "${lines[1]}" | head -n 1 | grep "^foo$")
}

@test "Option verbose outputs before command using standard error" {
    run bin/ush -c -v "echo foo >&2"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^echo foo >&2$")
    test $(echo "${lines[1]}" | head -n 1 | grep "^foo$")
}
