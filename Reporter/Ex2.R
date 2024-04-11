## Ex2: Fonts

library(reporter)

# Get data
dat <- mtcars

# Create table content
tbl <- create_table(dat)  |> 
  titles("Table 1.0", "Car Specifications", bold = TRUE) |> 
  footnotes("Motor Trend, 1973")

# Create report and add content
rpt <- create_report("./output/Ex2", output_type = "RTF",
                     font = "Courier") |> 
  add_content(tbl)

# Render report
write_report(rpt)


