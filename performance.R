dev.new(bg = 'blue')
dev.list()
dev.off()
windows.options(xpos = 500, ypos = 50)
plot(1:10,1:10)
circ <- circle_points()
x1<- circ$x1
x2<-circ$x2

hot <- read.csv("C:/Users/Nick/Downloads/Hot_100.csv")


# Method 10, tapply
method10 <- function(hot){
  
  hot$weekid_date <- as.Date( hot$chart_date )
  ord <- order( hot$weekid_date )
  hot_ord <- hot[ord,]
  first_url <- tapply( hot_ord$chart_url, hot_ord$song_id, function(x) x[1] )
  
  return(first_url)
  
}

method10(hot = hot)

library("profvis")
profvis({
  source("performance_funs.R")
  result1 <- method1( hot1e4 )
})

hot$weekid_date <- as.Date( hot$chart_date )
ord <- order( hot$weekid_date )
hot_ord <- hot[ord,]
