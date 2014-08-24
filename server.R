
# install shiny package if not installed
if( "shiny" %in% rownames( installed.packages() ) == FALSE ) {
    
    install.packages( "shiny" )
    
}

library( "shiny" )

set.seed( 1234 )
xValues <- rnorm( 100, mean = 5, sd = 1 )
yValues <- xValues + rnorm( 100, mean = 0, sd = 0.5 )

shinyServer(
 
    function( input, output ) {
     
        output$inputX <- renderPrint( { input$x } )
        output$inputY <- renderPrint( { input$y } )
     
        output$scatterPlot <- renderPlot( {
            x <- c( input$x, xValues )
            y <- c( input$y, yValues )
            fit <- lm( y ~ x )
            plot( y ~ x, xlim = c( 0, 10 ), ylim = c( 0, 10 ), pch = 19, col = c( "red", rep( "blue", length( x ) - 1 ) ), main = "Scatter Plot", xlab = "x Values", ylab = "y values" )
            abline( fit, col = "Black", lwd = 2 )
        } )
     
        output$residualPlot <- renderPlot( {
            x <- c( input$x, xValues )
            y <- c( input$y, yValues )
            fit <- lm( y ~ x )
            plot( fit, which = 1, pch = 19, col = c( "red", rep( "blue", length( x ) - 1 ) ) )
        } )
     
        output$dfbetaPlot <- renderPlot( {
            x <- c( input$x, xValues )
            y <- c( input$y, yValues )
            fit <- lm( y ~ x )
            par( mfrow = c( 2, 1 ) )
            plot( dfbeta( fit )[ , 1 ], pch = 19, col = c( "red", rep( "blue", length( x ) - 1 ) ), xlab = "Point Number", ylab = "dfbeta", main = "Influence on Intercept value of line" )
            plot( dfbeta( fit )[ , 2 ], pch = 19, col = c( "red", rep( "blue", length( x ) - 1 ) ), xlab = "Point Number", ylab = "dfbeta", main = "Influence on Slope of line" )
        } )
     
        output$hatvaluePlot <- renderPlot( {
            x <- c( input$x, xValues )
            y <- c( input$y, yValues )
            fit <- lm( y ~ x )
            par( mfrow = c( 1, 1 ) )
            plot( hatvalues( fit ), pch = 19, col = c( "red", rep( "blue", length( x ) - 1 ) ), xlab = "Point Number", ylab = "hat value", main = "Influence on fitted model" )
        } )
     
    }
 
)

