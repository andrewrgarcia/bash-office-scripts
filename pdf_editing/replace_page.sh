#!/bin/bash

######################################################################################
# Script: replace_page.sh                                                       
# Description: This script is designed to replace a page in a PDF file with a       
#              separate page from another PDF file. It allows you to specify the   
#              page number in the larger PDF where the replacement should occur.   
#              The resulting PDF with the replacement is saved as 'RESULT.pdf'.    
# Author: Andrew Garcia                                                           
# Date: Sep 13 2023                                                   
#                                                                                 
# Usage:                                                                          
#   ./replace_page.sh <book.pdf> <page.pdf> <page_number>
#                                                                             
######################################################################################

# Check for the correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <book.pdf> <page.pdf> <page_number>"
    exit 1
fi

# Assign input parameters to variables
book_pdf="$1"
page_pdf="$2"
page_number="$3"

# Check if the book.pdf file exists
if [ ! -f "$book_pdf" ]; then
    echo "File not found: $book_pdf"
    exit 1
fi

# Check if the page.pdf file exists
if [ ! -f "$page_pdf" ]; then
    echo "File not found: $page_pdf"
    exit 1
fi

# Define the names of intermediate PDFs
output_pdf="RESULT.pdf"
front_pdf="__TEMP__FRONT.pdf"
frontagg_pdf="__TEMP__FRONTAGG.pdf"
back_pdf="__TEMP__BACK.pdf"

if [ "$page_number" -eq 0 ]; then
    # If replacing the first page, simply concatenate page.pdf with the rest of book.pdf
    qpdf "$book_pdf" --pages "$page_pdf" 1-z "$book_pdf" 1-z -- "$output_pdf"
    
elif [ "$page_number" -eq 1 ]; then
    # If replacing the first page, simply concatenate page.pdf with the rest of book.pdf
    qpdf "$page_pdf" --pages . "$book_pdf" 2-z -- "$output_pdf"

else
    # Extract pages from the beginning of book.pdf up to (page_number - 1)
    qpdf "$book_pdf" --pages . 1-$((page_number - 1)) -- "$front_pdf"

    # Concatenate extracted pages with page.pdf
    qpdf "$front_pdf" --pages "$front_pdf" 1-$((page_number - 1)) "$page_pdf" 1-z -- "$frontagg_pdf"

    if ! [ "$page_number" -eq "$(qpdf "$book_pdf" --show-npages)" ]; then
        # Extract pages from (page_number + 1) to the end of book.pdf
        qpdf "$book_pdf" --pages . $((page_number + 1))-z -- "$back_pdf"

        # Concatenate frontagg_pdf and back_pdf to create the final output PDF
        qpdf "$frontagg_pdf" --pages "$frontagg_pdf" 1-z "$back_pdf" 1-z -- "$output_pdf"
    else
        cp "$frontagg_pdf" "$output_pdf"
        touch "$back_pdf"
    fi

    # Clean up intermediate files
    rm "$front_pdf"
    rm "$frontagg_pdf"
    rm "$back_pdf"
fi

echo "Page $page_number of $book_pdf has been replaced with $page_pdf in $output_pdf."
