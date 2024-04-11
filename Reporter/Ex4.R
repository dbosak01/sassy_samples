## Ex3: Combined Contents

library(reporter)
library(ggplot2)

# Get data
dat <- mtcars

# Create table content
tbl <- create_table(dat)  |> 
  titles("Table 1.0", "Car Specifications", bold = TRUE) |> 
  footnotes("Motor Trend, 1973")

# Create plot
p <- ggplot(dat, aes(x=disp, y=mpg)) + geom_point()

# Create table content
plt <- create_plot(p, height = 4, width = 6)  |> 
  titles("Figure 1.0", "Car Specifications", bold = TRUE) |> 
  footnotes("Motor Trend, 1973")


# Define text
t <- paste0("Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
            "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in ", 
            "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla ",
            "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa ",
            "qui officia deserunt mollit anim id est laborum.")

# Create table content
txt <- create_text(t, width = 6)

# Create report and add content
rpt <- create_report("./output/Ex4", output_type = "RTF",
                     font = "Arial") |> 
  add_content(tbl, page_break = TRUE) |> 
  add_content(plt, page_break = FALSE) |> 
  add_content(txt, page_break = TRUE)

# Render report
write_report(rpt)


