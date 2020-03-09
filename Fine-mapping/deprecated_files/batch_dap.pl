@files = <dat_files_AFR/*.dat>;
foreach $f (@files){

    $f =~/(ENSG\d+)/;
    print "dap-g -d $f -ld_control 0.25 --no_size_limit -t 4 -p priors/$1.prior --all -o dap_out/$1.fm.out \n";
}
