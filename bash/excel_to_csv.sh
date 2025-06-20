#!/bin/bash
# convert_excel_to_csv.sh
for file in *.xlsx; do
  csv_file="${file%.xlsx}.csv"
  libreoffice --headless --convert-to csv "$file" --outdir .
  echo "Converted $file to $csv_file"
done
