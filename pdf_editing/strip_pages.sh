#!/bin/bash

################################################################################
# Script Description:
#   This Bash script automates the process of extracting specific page ranges 
#   from a PDF file using the qpdf utility. It provides a simple interface for 
#   users to specify the input PDF and the desired page ranges for extraction.
#   The output PDF file is generated with a name based on the input filename.
#
# Usage:
#   ./strip_pages.sh input.pdf page_ranges
#
# Example:
#   To extract pages 1 and 3 from "input.pdf" and save the result as "input_stripped.pdf":
#   ./strip_pages.sh input.pdf 1,3,10-12
#
################################################################################

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input.pdf page_ranges"
  echo "Example: $0 input.pdf 1,3"
  exit 1
fi

# Assign arguments to variables
input_pdf="$1"
page_ranges="$2"
output_pdf="${input_pdf%.*}_stripped.pdf"

# Use qpdf to extract the specified page ranges
qpdf "$input_pdf" --pages . $page_ranges -- "$output_pdf"

# Check if qpdf was successful
if [ $? -eq 0 ]; then
  echo "New PDF generated successfully: $output_pdf"
else
  echo "Error generating PDF. Please check your input and try again."
  exit 1
fi

