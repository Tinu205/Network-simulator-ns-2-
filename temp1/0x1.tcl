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

for{set i 0} {$i < 6} {incr i}{
    set n($i) [$ns node]
}

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n1 $n2 1Mb 10ms DropTail
$ns simplex-link $n2 $n3 0.3Mb 100ms DropTail

#we want to run a ftp application over tcp protocol so first we establish tcp connection between n0 and n1
set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp 
set sink [new Agent/TCPSink]
$ns attach-agent $ns1 $sink
$ns connect $tcp $sink
$tcp set fid_ 1
$tcp set packetSize_ 552

#setting ftp over tcp
set ftp [new Application/TCP]
$ftp attach-agent $tcp

$ns at 1.0 "$ftp start"
$ns at 124 "$ftp stop"

