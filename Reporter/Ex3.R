## Ex3: Figures and Text

library(reporter)
library(ggplot2)

# Get data
dat <- mtcars


# Figure ------------------------------------------------------------------


# Create plot
p <- ggplot(dat, aes(x=disp, y=mpg)) + geom_point()


# Create table content
plt <- create_plot(p, height = 4, width = 6)  |> 
  titles("Figure 1.0", "Car Specifications", bold = TRUE) |> 
  footnotes("Motor Trend, 1973")

# Create report and add content
rpt <- create_report("./output/Ex3a", output_type = "RTF",
                     font = "Arial") |> 
  add_content(plt)

# Render report
write_report(rpt)



# Text ------------------------------------------------------------------


# Define text
t <- paste0("Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ",
            "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in ", 
            "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla ",
            "pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa ",
            "qui officia deserunt mollit anim id est laborum.")

# Create table content
txt <- create_text(t, width = 6)  |> 
  titles("Text 1.0", "Car Specifications", bold = TRUE) |> 
  footnotes("Motor Trend, 1973")

# Create report and add content
rpt <- create_report("./output/Ex3b", output_type = "RTF",
                     font = "Arial") |> 
  add_content(txt)

# Render report
write_report(rpt)



