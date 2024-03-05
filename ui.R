

## OVERVIEW TAB INFO
          
overview_tab <- tabPanel("Crime Rate vs. Minimum Wage: Introduction",
   h1("Overview of Data Analysis"),
   p("This group project for INFO 201 is conducted by Kevin Lee, 
     Maikanh Tran, and Nicholas Chou"),
   p("Minimum Wage in states throughout the United States in 1973: 
      Do they have any correlation?
      We believe that crime exists whether people are being kept alive or not. The government
      has long been in denial that the minimum wage should have any influence on crime, and 
      maybe that assumption is not off-base.")
)
cleandata <- read.csv("/Users/nicholaschou/Downloads/INFO201FinalProject/cleandata.csv")

## VIZ 1 TAB INFO


# searches the loaded csv file for minimum wage of the input(state)
viz_1_main_panel <- mainPanel(
  h4("Minimum Wage in 1973:"),
  DTOutput("Search_result")
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_1_tab <- tabPanel("Minimum Wage in States",
                      sidebarPanel(
                        tags$h3("Input:"),
                        textInput("search_input", "State", ""),
                        actionButton("search_button", "Search")
                        ),
                      mainPanel(
                        verbatimTextOutput("results"),
                        plotlyOutput(outputId = "state_graph")
                      ) # sidebarPanel
)


## VIZ 2 TAB INFO
# Maikanh Tran
viz_2_sidebar <- sidebarPanel(
  h2("Interactive Map"),
  #TODO: Put inputs for modifying graph here
)

viz_2_main_panel <- mainPanel(
  h2("Vizualization 2 Title")
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Viz 2 tab title",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO
# Nicholas Chou
viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
selectInput("stateSelect", "Select State:",
              choices = unique(cleandata$State),
              selected = NULL)
)

viz_3_main_panel <- mainPanel(
  h2("Assault Rates vs. Minimum Wage by Selected State"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
          plotlyOutput("crimeWagePlot")
)

viz_3_tab <- tabPanel("Minimum Wage by Selected Year",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
 h1("Conclusion"),
 p("In our analysis, the state minimum wage has no bearing on the rate of crime
   in the same state. The key to finding out if minimum wage has any bearing on 
   crime requires a more comprehensive dataset. Our project has concluded that within 
   a single year crime has relatively little correlation to minimum wage.")
)



ui <- navbarPage("INFO 201 - Crime Rates vs. Minimum Wage 1972",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)
