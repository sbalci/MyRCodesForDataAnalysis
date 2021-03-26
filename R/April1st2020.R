controloutcome=c(1,0,0,1,NA,1)

controloutcome=c("1","0","0","1",NA,"1")

myoutcome2 <- jmvcore::toNumeric(na.omit(controloutcome))

!is.numeric(myoutcome2) || !any(myoutcome2 %in% c(0,1), na.rm = TRUE)




controloutcome=c(1,0,0,1,NA,2)



jmvcore::naOmit(controloutcome)




controloutcome=c(3, 33, 1, NA, 0,1,NA,2)

controloutcome=c(3, 33, 44, NA,NA,2)

any((controloutcome != 0 & controloutcome != 1), na.rm = TRUE)

jmvcore::toNumeric(controloutcome)


as.numeric(as.character(controloutcome))

controloutcome=c(1,0,0,1,NA,2)


controloutcome=c(3, 33, 1, NA, 0,1,NA,2)

controloutcome=c(3, 33, 44, NA,NA,2)



any((controloutcome != 0 & controloutcome != 1), na.rm = TRUE)




utimes <- "12,36,60"

utimes <- eval(utimes)

quote(utimes)

utimes <- strsplit(utimes, ",")

utimes <- purrr::reduce(utimes, as.vector)

utimes <- as.numeric(utimes)

b <- c(12, 36, 60)
b




library(networkD3)
nodes = data.frame("name" = 
                     c("Node A", # Node 0
                       "Node B", # Node 1
                       "Node C", # Node 2
                       "Node D"))# Node 3
links = as.data.frame(matrix(c(
  0, 1, 10, # Each row represents a link. The first number
  0, 2, 20, # represents the node being conntected from. 
  1, 3, 30, # the second number represents the node connected to.
  2, 3, 40),# The third number is the value of the node
  byrow = TRUE, ncol = 3))
names(links) = c("source", "target", "value")

plot <- sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize= 12, nodeWidth = 30)



my.rmc <- rmcorr::rmcorr(participant = Subject, measure1 = PacO2, measure2 = pH, dataset = rmcorr::bland1995)

plot(my.rmc, overall = TRUE)

ggplot2::ggplot(rmcorr::bland1995,
                ggplot2::aes(x = PacO2,
                             y = pH,
                             group = factor(Subject),
                             color = factor(Subject)
                             )
                ) +
  ggplot2::geom_point(ggplot2::aes(colour = factor(Subject))) +
  ggplot2::geom_line(ggplot2::aes(y = my.rmc$model$fitted.values), linetype = 1)
