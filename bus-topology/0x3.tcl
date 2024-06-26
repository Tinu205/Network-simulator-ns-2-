set ns [new Simulator]
set Bandwidth "0.5Mb"
set packetsize 700
set intval 0.004

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
$n0 color "navy"
$n1 color "salmon"
$n2 color "seagreen"
$n3 color "deepskyblue"
$n4 color "steel blue"
$n5 color "steel blue"
$n6 color "steel blue"
$ns at 0.0 "$n0 label Sender"
$ns at 0.0 "$n1 label Receiver"
$ns at 0.0 "$n2 label Receiver"
$ns at 0.0 "$n3 label Receiver"

set nf [open tokenbus.nam w]
$ns namtrace-all $nf
set f [open tokenbus.tr w]
$ns trace-all $f

$ns duplex-link $n0 $n5 $Bandwidth 30ms DropTail
$ns duplex-link $n5 $n2 $Bandwidth 30ms DropTail
$ns duplex-link $n4 $n1 $Bandwidth 30ms DropTail
$ns duplex-link $n4 $n5 $Bandwidth 30ms DropTail
$ns duplex-link $n5 $n6 $Bandwidth 30ms DropTail
$ns duplex-link $n6 $n3 $Bandwidth 30ms DropTail

$ns duplex-link-op $n0 $n5 orient down
$ns duplex-link-op $n5 $n2 orient down
$ns duplex-link-op $n4 $n1 orient down
$ns duplex-link-op $n4 $n5 orient right
$ns duplex-link-op $n5 $n6 orient right
$ns duplex-link-op $n6 $n3 orient down
$ns queue-limit $n4 $n5 10

set tcp1 [new Agent/TCP]
$ns attach-agent $n0 $tcp1
$tcp1 set fid_ 1;
set tcp2 [new Agent/TCP]
$ns attach-agent $n1 $tcp2
$tcp2 set fid_ 1;
set tcp3 [new Agent/TCP]
$ns attach-agent $n2 $tcp3
$tcp3 set fid_ 1;
set tcp4 [new Agent/TCP]
$ns attach-agent $n3 $tcp4
$tcp4 set fid_ 1;
set tcp5 [new Agent/TCP]
$ns attach-agent $n0 $tcp5
$tcp5 set fid_ 1;
set tcp6 [new Agent/TCP]
$ns attach-agent $n1 $tcp6
$tcp6 set fid_ 1;
set tcp7 [new Agent/TCP]
$ns attach-agent $n2 $tcp7
$tcp7 set fid_ 1;
set tcp8 [new Agent/TCP]
$ns attach-agent $n3 $tcp8
$tcp8 set fid_ 1;
set tcp9 [new Agent/TCP]
$ns attach-agent $n0 $tcp9
$tcp9 set fid_ 1;
set tcp10 [new Agent/TCP]
$ns attach-agent $n1 $tcp10
$tcp10 set fid_ 1;
set tcp11 [new Agent/TCP]
$ns attach-agent $n2 $tcp11
$tcp11 set fid_ 1;
set tcp12 [new Agent/TCP]
$ns attach-agent $n3 $tcp12
$tcp12 set fid_ 1;

set sink1 [new Agent/TCPSink]
$ns attach-agent $n1 $sink1
set sink2 [new Agent/TCPSink]
$ns attach-agent $n2 $sink2
set sink3 [new Agent/TCPSink]
$ns attach-agent $n3 $sink3
set sink4 [new Agent/TCPSink]
$ns attach-agent $n4 $sink4
set sink5 [new Agent/TCPSink]
$ns attach-agent $n5 $sink5
set sink6 [new Agent/TCPSink]
$ns attach-agent $n6 $sink6
set sink7 [new Agent/TCPSink]
$ns attach-agent $n7 $sink7
set sink8 [new Agent/TCPSink]
$ns attach-agent $n8 $sink8
set sink9 [new Agent/TCPSink]
$ns attach-agent $n9 $sink9
set sink10 [new Agent/TCPSink]
$ns attach-agent $n10 $sink10
set sink11 [new Agent/TCPSink]
$ns attach-agent $n11 $sink11
set sink12 [new Agent/TCPSink]
$ns attach-agent $n12 $sink12

$ns connect $tep1 $sink1
$ns connect $tep2 $sink2
$ns connect $tep3 $sink3
$ns connect $tep4 $sink4
$ns connect $tep5 $sink5
$ns connect $tep6 $sink6
$ns connect $tep7 $sink7
$ns connect $tep8 $sink8
$ns connect $tep9 $sink9
$ns connect $tep10 $sink10
$ns connect $tep11 $sink11
$ns connect $tep12 $sink12

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tep1
set ftp2 [new Application/FTP]
$ftp2 attach-agent $tep2
set ftp3 [new Application/FTP]
$ftp3 attach-agent $tep3
set ftp4 [new Application/FTP]
$ftp4 attach-agent $tep4
set ftp5 [new Application/FTP]
$ftp5 attach-agent $tep5
set ftp6 [new Application/FTP]
$ftp6 attach-agent $tep6
set ftp7 [new Application/FTP]
$ftp7 attach-agent $tep7
set ftp8 [new Application/FTP]
$ftp8 attach-agent $tep8
set ftp9 [new Application/FTP]
$ftp9 attach-agent $tep9
set ftp10 [new Application/FTP]
$ftp10 attach-agent $tep10
set ftp11 [new Application/FTP]
$ftp11 attach-agent $tep11
set ftp12 [new Application/FTP]
$ftp12 attach-agent $tep12

set udp0 [new Agent/UDP]
$ns attach-agent $n1 $udp0
$udp0 set fid_ 2;
$tep7 set fid_ 4;
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp0
set null0 [new Agent/Null]
$ns attach-agent $n3 $null0
$ns connect $udp0 $null0
$cbr0 set packetSize_$packetsize
$cbr0 set interval_$intval

set udp1 [new Agent/UDP]
$ns attach-agent $n3 $udp1
$udp1 set fid_ 2;
$tcp7 set fid_ 4;
set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1
set null1 [new Agent/Null]
$ns attach-agent $n0 $null1
$ns connect $udp1 $null1
$cbr1 set packetSize_$packetsize
$cbr1 set interval_$intval

set udp2 [new Agent/UDP]
$ns attach-agent $n3 $udp2
$udp2 set fid_ 3;
$tcp12 set fid_ 4;
set cbr2 [new Application/Traffic/CBR]
$cbr2 attach-agent $udp2
set null2 [new Agent/Null]
$ns attach-agent $n0 $null2
$ns connect $udp2 $null2
$cbr2 set packetSize_$packetsize
$cbr2 set interval_$intval

$ns at 0.05 "$ftp1 start"
$ns at 0.13 "$ns detach-agent $n0 $tcp1;$ns detach-agent $n1 $sink1"
$ns at 3.0 "finish"
$ns at 0.14 "$ftp2 start"
$ns at 0.20 "$ns detach-agent $n1 $tcp2;$ns detach-agent $n2 $sink2"
$ns at 3.0 "finish"
$ns at 023 "$ftp3 start"
$ns at 0.30 "$ns detach-agent $n2 $tcp3;$ns detach-agent $n3 $sink3"
$ns at 3.0 "finish"
$ns at 0.33 "$ftp4 start"
$ns at 0.40 "$ns detach-agent $n3 $tcp1;$n4 detach-agent $n0 $sink4"
$ns at 3.0 "finish"
$ns at 0.42 "$ftp5 start"
$ns at 0.50 "$ns detach-agent $n0 $tcp5;$ns detach-agent $n1 $sink5"
$ns at 3.0 "finish"
$ns at 0.51 "$ftp6 start"
$ns at 0.60 "$ns detach-agent $n1 $tcp6;$ns detach-agent $n2 $sink6"
$ns at 3.0 "finish"
$ns at 0.62 "$ftp7 start"
$ns at 0.69 "$ns detach-agent $n2 $tcp7;$ns detach-agent $n3 $sink7"
$ns at 3.0 "finish"
$ns at 0.725 "$ftp8 start"
$ns at 0.78 "$ns detach-agent $n3 $tcp8;$ns detach-agent $n0 $sink8"
$ns at 3.0 "finish"
$ns at 0.83 "$ftp9 start"
$ns at 0.90 "$ns detach-agent $n0 $tcp9;$ns detach-agent $n1 $sink9"
$ns at 3.0 "finish"
$ns at 0.93 "$ftp10 start"
$ns at 1.0 "$ns detach-agent $n1 $tcp10;$ns detach-agent $n2 $sink10"
$ns at 3.0 "finish"
$ns at 01.03 "$ftp11 start"
$ns at 1.1 "$ns detach-agent $n2 $tcp11;$ns detach-agent $n3 $sink11"
$ns at 3.0 "finish"
$ns at 1.13 "$ftp12 start"
$ns at 1.2 "$ns detach-agent $n3 $tcp12;$ns detach-agent $n0 $sink12"
$ns at 3.0 "finish"
$ns at 0.621 "$cbr0 start"
$ns at 0.69 "$cbr0 stop"
$ns at 0.726 "$cbr1 start"
$ns at 0.78 "$cbr1 stop"
$ns at 1.131 "$cbr2 start"
$ns at 1.2 "$cbr2 stop"

proc finish{} {
global ns nf
$ns flush-trace
close $nf
exec nam tokenbus.nam &
exit 0
}
$ns run
