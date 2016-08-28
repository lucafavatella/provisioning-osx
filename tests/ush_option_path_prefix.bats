#!/usr/bin/env bats

test -f bin/ush

@test "Option path prefix prefixes path" {
    run bin/ush -c -p "foo:" 'echo $PATH'
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^foo:")
}

@test "Invalid path prefix - length zero" {
    run bin/ush -c -p "" "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid path prefix - length one, case ':'" {
    run bin/ush -c -p ":" "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid path prefix - length one, case not ':'" {
    run bin/ush -c -p "x" "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid path prefix - at least two chars but first is ':'" {
    run bin/ush -c -p "::" "echo DONOTPRINTME"
    test "$status" -eq 64
}

@test "Invalid path prefix - at least two chars but last is not ':'" {
    run bin/ush -c -p "xx" "echo DONOTPRINTME"
    test "$status" -eq 64
}
