#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)


# Define server logic required to draw the ggplot
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        mtcarsfiltered <- mtcars[mtcars$cyl == input$cylinders,]
        mpg <- mpg[mpg$cyl == input$cylinders,] 
        title <- paste("Engine Displacement vs Miles per gallon. Cylinders =",
                       input$cylinders)
        
        ggplot(mpg, aes(mpg$displ, mpg$hwy, 
                                       colour = class)) + 
            geom_point() +
            scale_size_area() + 
            xlab("engine displacement, in litres") +
            ylab("highway miles per gallon") +
            ggtitle(title)
        

        
        
        
        

    })

})
