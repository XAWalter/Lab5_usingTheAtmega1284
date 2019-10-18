# Test file for Lab4_stateMachines


# commands.gdb provides the following functions for ease:
#   test "<message>"
#       Where <message> is the message to print. Must call this at the beginning of every test
#       Example: test "PINA: 0x00 => expect PORTC: 0x01"
#   checkResult
#       Verify if the test passed or failed. Prints "passed." or "failed." accordingly, 
#       Must call this at the end of every test.
#   expectPORTx <val>
#       With x as the port (A,B,C,D)
#       The value the port is epected to have. If not it will print the erroneous actual value
#   setPINx <val>
#       With x as the port or pin (A,B,C,D)
#       The value to set the pin to (can be decimal or hexidecimal
#       Example: setPINA 0x01
#   printPORTx f OR printPINx f 
#       With x as the port or pin (A,B,C,D)
#       With f as a format option which can be: [d] decimal, [x] hexadecmial (default), [t] binary 
#       Example: printPORTC d
#   printDDRx
#       With x as the DDR (A,B,C,D)
#       Example: printDDRB

echo ======================================================\n
echo Running all tests..."\n\n

# Add tests below

test "PINA: 0x00, 0x01, 0x00, 0x02 PINC: 0x07"
set state = init
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
setPINA 0x02
continue 2
setPINA 0x00
continue 2
expectPORTC 0x07
checkResult 

test "cnt = 9 PINA: 0x00, 0x01, 0x00 PINC: 0x09"
set CountTick::cnt = 9
set state = releasedWait
setPINA 0x00
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTC 0x09
expect state releasedWait
checkResult 

test "cnt = 0 PINA: 0x00, 0x02, 0x00 PINC: 0x00"
set CountTick::cnt = 0
set state = releasedWait
setPINA 0x00
continue 2
setPINA 0x02
continue 2
setPINA 0x00
continue 2
expectPORTC 0x00
expect state releasedWait
checkResult 

test "cnt = 5 PINA: 0x00, 0x03, 0x00 PINC: 0x00"
set CountTick::cnt = 5
set state = releasedWait
setPINA 0x00
continue 2
setPINA 0x03
continue 2
setPINA 0x00
continue 2
expectPORTC 0x00
expect state releasedWait
checkResult

test "cnt = 5 PINA: 0x00, 0x02, 0x03, 0x00 PINC: 0x00"
set CountTick::cnt = 5
set state = releasedWait
setPINA 0x00
continue 2
setPINA 0x02
continue 2
setPINA 0x03
continue 2
setPINA 0x01
continue 2
setPINA 0x00
continue 2
expectPORTC 0x00
expect state releasedWait
checkResult

# Report on how many tests passed/tests ran
set $passed=$tests-$failed
eval "shell echo Passed %d/%d tests.\n",$passed,$tests
echo ======================================================\n