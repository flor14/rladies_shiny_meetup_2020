library("shiny")
library("tidyverse")
library("ggplot2")
library("shinythemes")

#Siempre guardar el archivo como app.R con encoding UTF8
ui<- fluidPage(theme = shinytheme("lumen"), h1(strong("Rladies Buenos Aires")),
               h4(em("Taller de Ciencia de Datos")),
              sidebarLayout(
                sidebarPanel(radioButtons(inputId = "Vx",
                                          label = "Eje X",
                                          selected = "displ",
                                          inline = FALSE,
                                          width = NULL ,
                                          choices= c("Millas de autopista por galón" = "hwy",
                                                     "Millas de ciudad por galón" = "cty",
                                                     "Cilindrada del motor (L)" = "displ")),
                             radioButtons("Vy",
                                          "Eje Y",
                                          selected = "hwy",
                                          inline = FALSE,
                                          width = NULL,
                                          choices= c("Millas de autopista por galón"= "hwy",
                                                     "Millas de ciudad por galón" = "cty",
                                                     "Cilindrada del motor (L)" = "displ")),
                             radioButtons("class",
                                          "Clase",
                                          inline = FALSE,
                                          width = NULL,
                                          choices= c("Tipo de auto" = "class",
                                                     "Número de cilindros" = "cyl",
                                                     "Modelo" = "model",
                                                     "Marca" = "manufacturer")),
                img(src='nametag_7x5.png', width= 200, align = "topright")),
                mainPanel(plotOutput("coolplot")) #mainPanel
                ) #sidebarLayout
) #fluidPage


#h1 o Titlepanel() especial de Shiny para titulo
#img() para imagen
#a() hiperlink
#br() linebreak
#em()  italics
#strong() negrita

#Todos los objetos que se agregan en input siempre tienen dos parts
#"InputID" y "Label"


#output<-renderPlot(plot(tapply(bcl$TMAX,month(bcl$Date),mean,na.rm=TRUE)))
server <- function(input, output) {
  
  output$coolplot <- renderPlot({ print(ggplot(data = mpg) + 
                                          geom_point(mapping = aes_string(x = input$Vx,
                                                                          y = input$Vy,
                                                                          color = input$class)))
    })}
                                                  

shinyApp(ui = ui, server = server) #ultima linea en el cÃ³digo si uso el archivo como app.R
#todo el output que veo cuando corro el programa como codigo
#no como app, es HTML


