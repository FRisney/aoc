#!/bin/sh

test_day(){
    dart test "day_$1/test.dart"
}

run_day(){
    echo "Day $1:"
    echo -n '\t'
    dart "day_$1/main.dart"
}

case $1 in
    test_day) test_day $2;;
    run_day) run_day $2;;
    *) echo 'invalid option';;
esac
