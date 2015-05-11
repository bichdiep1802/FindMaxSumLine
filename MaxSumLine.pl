# Bich Diep
# 04.22.2015
#
# This file iterate through a text file to find the sum of all digit strings from each individual line
# as long as the line with maximum sum
# Then print out those info with line number at the begining of each line
#

use strict;
use warnings;


main(@ARGV);

sub main
{
	my $fileName = 'PerlNumbersTest';
	open(my $file, '<', $fileName) || die "Could not read: $!";
	
	my $max_line;	# the line that has max sum
	my $max_sum = 0; 
	my $max_index=0; # index of max-sum line
	my $index = 0; # keep track of line number	
    my @allSum; # an array holds sum of digit strings of each line 
        
    # while there's still line to iterate
    while (my $line = <$file>)
    {	
    	$index++; # increase the line number
    	
    	my $sum = 0; # sum of digit strings of the current line
		
		my @digitArr = $line =~ /(\d+)/g; # an array holds all of the numbers
    	
    	# finding sum of all numbers of the current line
    	foreach my $digit (@digitArr)
    	{		 
				$sum += $digit;
    	}  
    	    
    	# comparing to find max sum and update needed info	
    	if ($sum > $max_sum)
    	{
    		$max_line = $line;
			$max_sum = $sum;
			$max_index = $index;
    	}
    	
    	# store the sum into the array
    	push @allSum, $sum;
    }
    
    close $file;
    
     print "Sum of all digit strings from each line displayed below:\n\n";
   
   # print out line number and sum of numbers associating with that line number
   $index = 0;  
   foreach my $eachSum (@allSum)
   {
   		$index++;
   		print $index, " ", $eachSum, "\n";
   }  
   # print out the content of the line that has max sum
   print "\nLine with max sum is: \n", $max_index, " ", $max_line ,"\n";
   
}
