#!/bin/sh

# get location of everything
currentdir="$(pwd)"
testdir=""
thisdir="$(dirname "$0")"
if [ "$thisdir" = "." ]
then
    testdir="$(pwd)"
else
    cd "$thisdir"
    testdir="$(pwd)"
fi
basedir="$(dirname "$testdir")"
testfile="$(basename "$0")"
testname="${testfile%.sh}"
testsubdir="${testdir}/${testname}"
scriptname="count-fasta-seqs.sh"
scriptpath="${basedir}/${scriptname}"

inputdir="${testsubdir}/input"
input="gekko-mindorensis.fasta"
tempscriptpath="${inputdir}/${scriptname}"
cp "$scriptpath" "$tempscriptpath"
output="${testsubdir}/output/output.txt"
expected="${testsubdir}/expected-output/expected-output.txt"

total=0
passed=0

# run the script
cd "$inputdir"
echo ""
echo "----------------------------------------------------------------------"
echo "testing: sh ${scriptname} $input"
if sh "${scriptname}" $input > "${output}"
then
    # If it did not exit with an error, compare
    # the output produced to the expected output
    if diff "${output}" "${expected}"
    then
        # diff will succeed if the files are identical
        echo "Passed"
        passed=$(expr $passed + 1)
    else
        echo "FAIL: Did not create the expected output!"
    fi
else
    echo "FAIL: Program failed to exit cleanly"
fi
total=$(expr $total + 1)

echo "Passed $passed out of $total tests"
echo "----------------------------------------------------------------------"

rm "$tempscriptpath"
cd "$currentdir"

if test $passed -eq $total 
then
    exit 0
else
    exit 1
fi
