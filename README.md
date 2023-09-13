# bash-office-scripts
practical and document-editing scripts to have and use



## images2pdf.tex

This is a LaTeX script I developed which collates several images to a single pdf file. A great tool to have if you want to save memory without the need for any fancy compression software by exporting notebook pages as images and then compiling them all into pdf . 

This is especially useful for some of the current latest versions of [GoodNotes for iOS](https://www.goodnotes.com/) (version 5.6.39 at the time), where I was able to save memory, going from 9.2 MB to 3 MB by using this algorithm instead of GoodNotes' "Export ALL / PDF Flattented"

[GoodNotes Github](https://github.com/GoodNotes)

## extract & compress tar files

Like WinZip (but for tar files and better)

Usage: 

```ruby
bash compress.sh [folder_to_compress]         #compress file
bash extract.sh [compressed_folder]           #extract compressed file
```

## rename files

**rename_prefix.sh** renames with a prefix

## select specific pages from a pdf to form a new pdf
```ruby
qpdf input.pdf --pages . 1,3 -- output.pdf   #makes new pdf with pages 1 and 3 from input.pdf file
qpdf input.pdf --pages . 50-57,90 -- output.pdf   #makes new pdf with pages 50 through 57 and page 90 from input.pdf file
```
