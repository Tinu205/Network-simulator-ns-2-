set ns [new Simulator]

#setting trace file
set tracefile [open tract.tr w]
$ns trace-all $tracefile

#setting nam file
set namfile [open namfile.nam w ]
$ns namtrace-all $namfile

#finish procedure to execute nam and exit
proc finish{}{
    global ns tracefile namfile
    $ns flush-trace
    close tracefile
    close namfile
    exec nam namfile.nam &
    exit 0
}