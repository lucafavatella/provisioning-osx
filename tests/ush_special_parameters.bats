#!/usr/bin/env bats

test -f bin/ush

@test "Set command name (\$0)" {
    run bin/ush -c "echo \$0" foo
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^foo$")
}

@test "Set command name (\$0) - question mark (\?)" {
    run bin/ush -c "echo \$0" "?"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^\?$")
}

@test "Set command name (\$0) - colon (:)" {
    run bin/ush -c "echo \$0" ":"
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^:$")
}

@test "Set positional parameter 1" {
    run bin/ush -c "echo \$1" foo bar
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^bar$")
}

@test "Set positional parameter 2" {
    run bin/ush -c "echo \$2" foo bar baz
    test "$status" -eq 0
    test $(echo "${lines[0]}" | head -n 1 | grep "^baz$")
}
