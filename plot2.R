# Coursera-04 - Exploratory Data Analysis, Course Project 1 (part 2)
# Stanislav Gerasymenko



# Clean up the working environment to guarantee intended execution of the code:
rm(list = ls())


# Store the path to main working directory for convenience:
wd <- paste("C:/!SG/OneDrive/Projects/SCIENCE/Coursera/", 
            "Coursera_04_Exploratory_Data_Analysis/CourseProject1/", 
            sep = "")


# Read the data into R:
setwd(paste(wd, "Data/exdata-data-household_power_consumption/", 
            sep = ""))
Data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, 
                 na.strings = "?", 
                 sep = ";")
# head(Data)


# Create a DateTime column:
Data$Date <- as.Date(Data$Date, 
                     format = "%d/%m/%Y")
Data$DateTime <- as.POSIXct(paste(Data$Date, Data$Time), 
                            format = "%Y-%m-%d %H:%M:%S")
# head(Data)


# Wrap a plot into a function:
plot2 <- function() {
        x <- Data$DateTime[Data$Date >= "2007-02-01" & 
                                   Data$Date <= "2007-02-02"]
        y <- Data$Global_active_power[Data$Date >= "2007-02-01" & 
                                              Data$Date <= "2007-02-02"]
        par(mfrow = c(1, 1))
        plot(x, y, xlab = "", ylab = "Global Active Power (kilowatts)", 
             type = "l", col = "black")
}


# Plot in screen graphics device:
plot2()


# Plot to git catalog of the Course Project in png format:
setwd(paste(wd, "ExData_Plotting1/", sep = ""))
png(filename = "plot2.png", bg = "white")
plot2()
dev.off()
setwd(wd)


# Clean up the working environment:
rm(list = ls())