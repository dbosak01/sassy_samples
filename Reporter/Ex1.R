## Ex1: Simple report

library(reporter)

# Get data
dat <- mtcars

# Create table content
tbl <- create_table(dat)  |> 
  titles("Table 1.0", "Car Specifications") |> 
  footnotes("Motor Trend, 1973") 

# Create report and add content
rpt <- create_report("./output/Ex1", output_type = "PDF") |> 
  add_content(tbl)

# Render report
write_report(rpt)



