use strict;
use warnings;
my ($pop) = @ARGV;
@files = <$pop_dat_files/*.dat>;
foreach $f (@files){

    $f =~/(ENSG\d+)/;
    print "/home/elyse/dap/version1/dap_greedy_src/dap-g.static -d $f -scan > scan_out/$1.bf\n";
}
