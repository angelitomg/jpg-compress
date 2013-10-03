#!/bin/bash

#############################
# Compress jpg files
#
# Angelito M. Goulart
# www.angelitomg.com 
#
#############################

#############################
# Help
#############################
if ([ -z "$1" ] || [ -z "$2" ]) || [ "$1" == "--help" ]
then
	echo -e "Usage: jpg-compress.sh /path 80

Where path is the path of image or folder (for current directory use .)
and 80 is quality of image after compression.

WARNING: this script overwrites the original file!"
	exit 0
fi

#############################
# Function to compress jpg
#############################
function compress_jpg {
	local orig_size="$(ls -l $1 | cut -d " " -f5)"
	convert $1 -quality $2 $1
	local new_size="$(ls -l $1 | cut -d " " -f5)"
	total="$((total + (orig_size - new_size)))"
	echo "$1 compressed $((orig_size / 2**10))K to $((new_size / 2**10))K"
}

#############################
# Configs
#############################
total=0
quality=$2
path=$1


##############################
# Validate 'quality' parameter
##############################
re="^[0-9]+$"
if ! [[ $quality =~ $re ]]
then
	echo "Quality must be a number"
	exit 1
fi

######################
# Convert single file
######################
if [ -f $path ]
then
	compress_jpg $path $quality
else

	#############################
	# Convert all files of a dir
	#############################
	count="$(ls -1 $path/*.jpg 2> /dev/null | wc -l)"
	if [ $count -lt 1 ]
	then
		echo "Directory $path has no jpg files."
		exit 1
	fi
	for f in $path/*.jpg
	do
		compress_jpg $f $quality
	done

fi

# Results
echo "$(($total / 2**10))K saved"
