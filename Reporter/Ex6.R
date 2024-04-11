## Ex6: Listing and Preview

library(sassy)

# Get data
libname(adam, "./data", "csv")

# Create table content
tbl <- create_table(adam$ADVS)  |> 
  titles("Listing 1.0", "ADaM Vital Signs Dataset", bold = TRUE) |> 
  define(USUBJID, id_var = TRUE)

# Create report and add content
rpt <- create_report("./output/Ex6", output_type = "RTF", 
                     font = "Arial") |> 
  page_header(c("Sponsor: My Company", "Compound: My Drug"), 
              c("Protocol: My Protocol",
                "Data: 04/02/2024")) |> 
  add_content(tbl, align = "left") |> 
  page_footer("Date: " %p% fapply(Sys.Date(), "%b"), "Confidential", 
              "Page [pg] of [tpg]")
  

# Render report
write_report(rpt)

