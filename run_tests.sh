#!/bin/sh
failures=0
if ! sh tests/test_in_dir_singleton.sh
then
    failures=$(expr $failures + 1)
fi

if ! sh tests/test_in_dir_files.sh
then
    failures=$(expr $failures + 1)
fi

if ! sh tests/test_nested_singleton.sh
then
    failures=$(expr $failures + 1)
fi

if ! sh tests/test_nested_files.sh
then
    failures=$(expr $failures + 1)
fi

if test $failures -gt 0
then
    echo ""
    echo "Some tests failed (see messages above)"
    exit 1
fi
    echo ""
echo "All tests passed!"
