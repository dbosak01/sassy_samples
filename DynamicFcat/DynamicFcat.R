
# Converting between format catalog and data frames ------------------

library(fmtr) 

# Create user-define format
fmt <- value(condition(x == "A", "Group A"),
             condition(x == "B", "Group B"),
             condition(x == "C", "Group C"))

# Add format to catalog
tmp <- fcat(GRP = fmt)

# Convert to data frame
dtmp <- as.data.frame(tmp)

# View data frame
dtmp

# Convert to format catalog
ftmp <- as.fcat(dtmp)

# View format catalog
ftmp


# Create format catalog from data -----------------------------------------

library(readxl) # read from spreadsheet
library(libr)   # datastep

# Read in sheet
sheet <- read_excel("./work/CODELISTS.xlsx",
                    sheet = "CODELISTS")

# View sheet
print(sheet, n = 100)

# Datastep to prepare data
datastep(sheet, 
         keep = v(Name, Type, Expression, Label, Order),
         {
           
           Name <- CODELISTNAME
           Type <- "U"
           
           if (TYPE %eq% "number") 
             Expression <- "x == " %p% CODEDVALUE
           else 
             Expression <- "x == '" %p% CODEDVALUE %p% "'" 
           
           Label <- TRANSLATED
           Order <- as.integer(ORDER)
           
         }) -> fdat

# Create format catalog 
fc <- as.fcat(fdat)

# View catalog
fc

# View format
fc$LBTESTCD


# Use format catalog ------------------------------------------------------

# Sample data
dat <- read.table(header = TRUE, text = '
  USUBJID  VISITN     ARMCD  LBTESTCD  
  A001          1   "ARM A"       ALB
  A002          2   "ARM B"       HGB
  A003          3   "ARM A"      GLUC
')

# View data
dat

# Sample usage
datastep(dat, 
         {
           VISIT <- fapply(VISITN, fc$VISITN)
           ARM <- fapply(ARMCD, fc$ARMCD)
           LBTEST <- fapply(LBTESTCD, fc$LBTESTCD)
         }) -> dat





