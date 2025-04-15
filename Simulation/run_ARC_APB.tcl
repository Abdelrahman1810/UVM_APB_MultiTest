vlib work
vlog -f src_files.list -mfcu +acc

set test_reports ""
set ucdb_files ""

foreach test {test1 test2 test3 test4} {
    puts "Running test: $test"
    
    # Capture start time
    set start_time [clock milliseconds]

    vsim -coverage -vopt +UVM_VERBOSITY=UVM_LOW work.top +UVM_TESTNAME=$test -c -do "
        add wave *;
        run -all
        coverage save -onexit -directive -codeAll cover_${test}.ucdb;
    "
    
    set end_time [clock milliseconds]

    # Compute elapsed time
    set elapsed_time [expr {($end_time - $start_time) / 1000.0}]
    if {$test eq "base_test"} {
        coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report_Base_test.txt}
        coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_APB_Slave_Base_test.txt} {}
        quit -sim
        vcover report cover_${test}.ucdb -details -all -annotate -output {Reports/code_coverage_APB_Slave_base_test.txt}
    } elseif {$test eq "test1"} {
        coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report_test1.txt}
        coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_APB_Slave_test1.txt} {}
        quit -sim
        vcover report cover_${test}.ucdb -details -all -annotate -output {Reports/code_coverage_APB_Slave_test1.txt}
    } elseif {$test eq "test2"} {
        coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report_test2.txt}
        coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_APB_Slave_test2.txt} {}
        quit -sim
        vcover report cover_${test}.ucdb -details -all -annotate -output {Reports/code_coverage_APB_Slave_test2.txt}
    } elseif {$test eq "test3"} {
        coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report_test3.txt}
        coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_APB_Slave_test3.txt} {}
        quit -sim
        vcover report cover_${test}.ucdb -details -all -annotate -output {Reports/code_coverage_APB_Slave_test3.txt}
    } elseif {$test eq "test4"} {
        coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report_test4.txt}
        coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_APB_Slave_test4.txt} {}
        quit -sim
        vcover report cover_${test}.ucdb -details -all -annotate -output {Reports/code_coverage_APB_Slave_test4.txt}
    }
    
    quit -sim

    # Store test report in the list
    append test_reports "Test: $test | Execution Time: ${elapsed_time} seconds\n"

    # Append UCDB file for merging
    append ucdb_files "cover_${test}.ucdb "
}

# Merge UCDB files
set merged_ucdb "Coverage_report_merged.ucdb"
vcover merge $merged_ucdb {*}$ucdb_files
puts "Merged UCDB file created: $merged_ucdb"

# Print Final Test Execution Summary
puts "\n======== TEST EXECUTION SUMMARY ========"
puts $test_reports
puts "========================================"

# Open merged UCDB in QuestaSim Coverage Viewer
vsim -viewcov $merged_ucdb
puts "Opened merged UCDB in QuestaSim Coverage Viewer"



################################################

# # Generate text coverage report
# set txt_report "merged_coverage_report.txt"
# vcover report $merged_ucdb -details > $txt_report
# puts "Text coverage report generated: $txt_report"

# # Generate HTML coverage report
# set html_report_dir "merged_coverage_html"
# vcover report $merged_ucdb -html $html_report_dir
# puts "HTML coverage report generated in directory: $html_report_dir"

# # Generate CSV coverage report
# set csv_report "merged_coverage_report.csv"
# vcover report $merged_ucdb -csv $csv_report
# puts "CSV coverage report generated: $csv_report"

# # Generate directive-only coverage report
# set directive_report "directive_coverage_report.txt"
# vcover report Coverage_report_merged.ucdb -directive > $directive_report
# puts "Directive-only coverage report generated: $directive_report"

# # Generate functional coverage report (covergroups)
# set functional_report "functional_coverage_report.txt"
# vcover report Coverage_report_merged.ucdb -covergroup > $functional_report
# puts "Functional coverage report generated: $functional_report"

# # Generate full code coverage report
# set code_report "code_coverage_report.txt"
# vcover report Coverage_report_merged.ucdb -codeAll > $code_report
# puts "Full code coverage report generated: $code_report"

###################################################