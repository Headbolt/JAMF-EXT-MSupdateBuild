#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	JAMF-EXT-MSupdateBuild.sh
#	https://github.com/Headbolt/JAMF-EXT-MSupdateBuild
#
#   This Script is designed for use in JAMF as an Extension Attribute
#		with a type set of "Integer"
#
#   - This script will ...
#       Search for the MS Update App and pull out the version number.
#		Then Split the number down to get the Build Number.
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.1 - 15/01/2020
#
#   - 06/01/2018 - V1.0 - Created by Headbolt
#   - 15/01/2020 - V1.1 - Updated by Headbolt
#							Split down to get Build Number
#
###############################################################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
MAUPath=$(find /Library/Application\ Support/Microsoft/ -iname "Microsoft AutoUpdate.app") # Find AutoUpdate App
#
MAUVers=$(defaults read "${MAUPath}"/Contents/Info CFBundleVersion) # Extracts the MAU Version from the APP
#
IFS='.' # Internal Field Seperator Delimiter is set to Pipe (.)
MAUbuildNumber=$(echo $MAUVers | awk '{ print $3 }') # Splits down the Version Number to extracts the Build Number
unset IFS # Internal Field Seperator Delimiter re-disabled
#
/bin/echo "<result>$MAUbuildNumber</result>" # Return Result
