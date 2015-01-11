# Coursera-04 - Exploratory Data Analysis, Course Project 1 (part 3)
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
plot3 <- function() {
        x <- Data$DateTime[Data$Date >= "2007-02-01" & 
                                   Data$Date <= "2007-02-02"]
        y1 <- Data$Sub_metering_1[Data$Date >= "2007-02-01" & 
                                          Data$Date <= "2007-02-02"]
        y2 <- Data$Sub_metering_2[Data$Date >= "2007-02-01" & 
                                          Data$Date <= "2007-02-02"]
        y3 <- Data$Sub_metering_3[Data$Date >= "2007-02-01" & 
                                          Data$Date <= "2007-02-02"]
        par(mfrow = c(1, 1))
        with(Data, plot(x, y1, xlab = "", ylab = "Energy Sub Metering", 
                        type = "n"))
        with(Data, points(x, y1, type = "l", col = "black"))
        with(Data, points(x, y2, type = "l", col = "red"))
        with(Data, points(x, y3, type = "l", col = "blue"))
        legend("topright", lwd = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}


# Plot in screen graphics device:
plot3()


# Plot to git catalog of the Course Project in png format:
setwd(paste(wd, "ExData_Plotting1/", sep = ""))
png(filename = "plot3.png", bg = "white")
plot3()
dev.off()
setwd(wd)


# Clean up the working environment:
rm(list = ls())