
# install shiny package if not installed
if( "shiny" %in% rownames( installed.packages() ) == FALSE ) {
    
    install.packages( "shiny" )
    
}

library( "shiny" )

shinyUI( pageWithSidebar (
 
    headerPanel( "Developing Data Products : Course Project" ),
    sidebarPanel(
        p( 'This Shiny application is designed to illustrate some aspects of residuals from a least squares linear model, as discussed in the lecture on "Residuals, diagnostics, variation" in the Coursera course "Regression Models".' ),
        p( 'Use the two sliders below to set the x and y coordinates of a new point to be added to a set of randomly-generated points with an existing dependent relationship.' ),
        p( 'The impact of the additional point is illustrated in a number of plots :' ),
        p( ' - a scatter plot with a least squares line of best fit,' ),
        p( ' - a plot of the residuals,' ),
        p( ' - a plot of the values of dfbeta, and' ),
        p( ' - a plot of the hat values' ),
        p(  ),
        h3( "Add an Outlier" ),
        h4( "Select x and y values for an additional point to be added to the data, then press 'Submit'" ),
        sliderInput( 'x', 'x value', value = 5, min = 0, max = 10, step = 0.1 ),
        sliderInput( 'y', 'y value', value = 5, min = 0, max = 10, step = 0.1 ),
        submitButton( 'Submit' )
    ),
    mainPanel(
        h3( 'Impact of an Outlier' ),
        h4( 'Outlier parameters :' ),
        p( 'x' ),
        verbatimTextOutput( "inputX" ),
        p( 'y' ),
        verbatimTextOutput( "inputY" ),
        h4( 'A Scatter plot of the data shows the least squares line of best fit' ),
        plotOutput( "scatterPlot" ),
        h4( 'Residuals are the differences between the points and the line of best fit'),
        plotOutput( "residualPlot" ),
        h4( 'dfbeta is a simple measure of the influence of each point in the data'),
        p( 'Your point is Point Number 1'),
        plotOutput( "dfbetaPlot" ),
        h4( 'hat value is another measure of the influence of each point in the data'),
        plotOutput( "hatvaluePlot" )
    )
 
) )

