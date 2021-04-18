library(readxl)
library(stringr)

folderPath <<- "Assignment3Assets"

#functions

importSheets <- function(filePath){
  ending <- substr(filePath, nchar(filePath) - 3, nchar(filePath))
  
  if(ending == ".xls" || ending == "xlsx"){
    sheetNames <- excel_sheets(filePath)
    returnValue <- list()
    
    if (ending == ".xls"){
      for (sheets in sheetNames) {
        file <- paste(paste(folderPath, sheets, sep="/"), "csv", sep = ".") 
        write.csv(read_xls(filePath, sheets), file = file)
        returnValue[[str_replace_all(sheets, "[^[:alnum:]]", "")]] <- read_xls(filePath, sheets)
      }
    }else if(ending == "xlsx"){
      for (sheets in sheetNames) {
        file <- paste(paste(folderPath, sheets, sep="/"), "csv", sep = ".") 
        write.csv(read_xlsx(filePath, sheets), file = file)
        returnValue[[str_replace_all(sheets, "[^[:alnum:]]", "")]] <- read_xlsx(filePath, sheets)
      }
    }
    return(returnValue)
  }else{
    return("Error with the file type.")
  }
}

#code

list <- list.files(folderPath) 

fileName <- "SportsDatabase.xlsx"
path <- paste(folderPath, fileName, sep="/")
imported <- importSheets(path)

for(items in imported){
  print(head(items, 3))
}