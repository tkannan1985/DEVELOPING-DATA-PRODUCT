# The user-interface definition of the Shiny web app.
library(shiny)

shinyUI(
  navbarPage("Data Visualizer",
             tabPanel("Basic Search",
                      sidebarPanel(
                        textInput(inputId="text1", label = "Input Text1"),
                        textInput(inputId="text2", label = "Input Text2"),
                        actionButton("goButton", "Go!")
                      ),
                      mainPanel(
                        p('Output text1'),
                        textOutput('text1'),
                        p('Output text2'),
                        textOutput('text2'),
                        p('Output text3'),
                        textOutput('text3')
                      )
             ), # end of "Basic Search" tab panel
             tabPanel("Explore & Visualize",
                      sidebarPanel(
                        sliderInput("timeline",
                                    "Timeline:",
                                    min = 1950,
                                    max = 2014,
                                    value = c(1996, 2014),
                                    format = "####"),
                        uiOutput("themesControl"), # the id
                        actionButton(inputId = "clearAll",
                                     label = "Clear selection",
                                     icon = icon("square-o")),
                        actionButton(inputId = "selectAll",
                                     label = "Select all",
                                     icon = icon("check-square-o"))

                      ),
                      mainPanel(
                        tabsetPanel(
                          # Data
                          tabPanel(p(icon("table"), "Dataset"),
                                   dataTableOutput(outputId="dTable")
                          )
                        )

                      )
             ), # # end of "Visualize & Explore" tab panel

             tabPanel("About",
                      mainPanel(
                        includeMarkdown("about.Rmd")
                      )
             ) # end of "About" tab panel
  )

)
