library(shiny)
library(ggplot2)
library(dplyr)
library(maps)

data<-read.csv("incomedata.csv")%>%
  group_by(YEAR,STATE,Highest.Education.Level)%>%
  summarise_at(vars("Income"),mean)

Education <- unique(data$Highest.Education.Level)

mdat <- map_data("state")


# Define UI for application that draws a histogram
ui<-fluidPage(
  
  titlePanel(h1("Shiny application to explore US average income data",
                style='background-color:blue;color:white;
                     padding-left: 50px')), 
  
  sidebarLayout(
    sidebarPanel(
      selectInput("selectedEducation", 
                  label = "Choose an Education level to display",
                  choices = Education, 
                  selected = Education[1]),
      
      sliderInput("myYears",
                  label = "Survey Year",
                  min = 2000,
                  max = 2010,
                  value = 2002),
    ),
    
    # Show the US map
      plotOutput("myMap",height = "500px", width="900px")
   )
)


# Define the server logic 
server<-function(input, output) {
  # setting the reactive environment 
  dataInput <- reactive({
    subset(data,
           YEAR==input$myYears & 
             Highest.Education.Level==input$selectedEducation)
  })
  
  # Plotting the usa map
  output$myMap <- renderPlot({ 
 
  # Merging the data, mdat is the base file (left join)     
   combdat <- left_join(mdat,dataInput(), by=c("region"="STATE"))
  
    ggplot(combdat, aes(x=long, y=lat,group=group)) +
    geom_polygon(aes(fill=Income), colour = alpha("white", 0.2)) + 
    theme_bw() + scale_fill_continuous(low="blue", high="red") +
    theme(
        legend.position = "right",
        line = element_blank()) 
    
  })
  
}

shinyApp(ui=ui, server=server)




