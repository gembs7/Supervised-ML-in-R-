

windows.options(width = 7, height = 7)
plot(0,type = "n",xlim = c(-5,5), ylim = c(-5,5), axes = FALSE, ann = FALSE)


circle_points <- function(n=1000){
  theta <- 2*pi*seq(0,1,length.out = n+1)
  x1 <- cos(theta)
  x2 <- sin(theta)
  return(list(x1=x1, x2=x2))
}

circ <- circle_points()
x1<- circ$x1
x2<-circ$x2
polygon(x1-2.3,x2+1.15, border = "#0081C8", lwd = 8.5)
polygon(x1-1.15,x2, border = "#FCB131", lwd = 8.5)
polygon(x1,x2+1.15, border = "#000000", lwd = 8.5)
polygon(x1+1.15,x2, border = "#00A651", lwd = 8.5)
polygon(x1+2.3,x2+1.15, border = "#EE334E", lwd = 8.5)


circle_points_top <- function(n=1000){
  theta <- 2*pi*seq(0,1,length.out = n+1)[125:375]
  x1 <- cos(theta)
  x2 <- sin(theta)
  return(list(x1=x1, x2=x2))
}

circle_points_left <- function(n=1000){
  theta <- 2*pi*seq(0,1,length.out = n+1)[c(375:625)]
  x1 <- cos(theta)
  x2 <- sin(theta)
  return(list(x1=x1, x2=x2))
}

circle_points_right <- function(n=1000){
  theta <- 2*pi*seq(0,1,length.out = n+1)[c(1:125,875:1000)]
  x1 <- cos(theta)
  x2 <- sin(theta)
  return(list(x1=x1, x2=x2))
}


circle_points_bottom <- function(n=1000){
  theta <- 2*pi*seq(0,1,length.out = n+1)[c(625:875)]
  x1 <- cos(theta)
  x2 <- sin(theta)
  return(list(x1=x1, x2=x2))
}


circ <- circle_points_top()
x1<- circ$x1
x2<-circ$x2

lines(x1-1.15,x2, col = "#FCB131", lwd = 8.5)

circ <- circle_points_right()
x1<- circ$x1
x2<-circ$x2

lines(x1-2.3,x2+1.15, col = "#0081C8", lwd = 8.5)

circ <- circle_points_bottom()
x1<- circ$x1
x2<-circ$x2

lines(x1-2.3,x2+1.15, col = "#0081C8", lwd = 8.5)



plot(0,type = "n",xlim = c(-5,5), ylim = c(-5,5), axes = FALSE, ann = FALSE)



lines(x1-1.15,x2, col = "#FCB131", lwd = 8.5)
lines(x1,x2+1.15, col = "#000000", lwd = 8.5)
lines(x1+1.15,x2, col = "#00A651", lwd = 8.5)
lines(x1+2.3,x2+1.15, col = "#EE334E", lwd = 8.5)