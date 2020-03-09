@files = <dat_files_AFR/*.dat>;
foreach $f (@files){

    $f =~/(ENSG\d+)/;
    print "/home/egeoffroy/dap/version1/dap_greedy_src/dap-g.static -d $f -scan > scan_out/$1.bf\n";
}
