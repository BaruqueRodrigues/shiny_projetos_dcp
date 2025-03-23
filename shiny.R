# Carregar pacotes
library(shiny)
library(DT)
library(bslib)

# Base de produtos
dados_produtos <- data.frame(
  ID = 1:10,
  Titulo = c(
    "Projeto Alta Vista",
    "Fake News Fact Checking and Partisanship",
    "Beyond Roll-Call Voting",
    "Be careful what you wish for",
    "‘Congruent We Govern’",
    "Prosecutors, Voters and Corruption",
    "The family connection",
    "Varieties of Electoral Integrity Risk",
    "Civil society: NGOs and public opinion",
    "Gênero e promoção da integridade"
  ),
  Tipo = c(
    "Projeto de Pesquisa", "Artigo", "Artigo", "Artigo", "Artigo",
    "Livro", "Tese", "Relatório Técnico", "Capítulo de Livro", "Projeto de Pesquisa"
  ),
  stringsAsFactors = FALSE
)

# Descrições para teste
descricoes <- list(
  "Projeto Alta Vista" = "Descrição detalhada sobre o Projeto Alta Vista.",
  "Fake News Fact Checking and Partisanship" = "Descrição sobre o artigo de Fake News e Partisanship.",
  "Beyond Roll-Call Voting" = "Descrição do estudo sobre votações na ONU.",
  "Be careful what you wish for" = "Descrição sobre alocação de recursos e popularidade presidencial.",
  "‘Congruent We Govern’" = "Descrição sobre governança em sistemas multipartidários.",
  "Prosecutors, Voters and Corruption" = "Livro sobre criminalização da corrupção na América Latina.",
  "The family connection" = "Tese sobre dinastias políticas e transparência no Brasil.",
  "Varieties of Electoral Integrity Risk" = "Relatório sobre riscos à integridade eleitoral no Brasil.",
  "Civil society: NGOs and public opinion" = "Capítulo de livro sobre ONGs e opinião pública.",
  "Gênero e promoção da integridade" = "Projeto sobre gênero e integridade nos governos locais."
)

# Interface do usuário com bslib e custom CSS
ui <- fluidPage(
  theme = bs_theme(bootswatch = "flatly"),
  
  # Custom CSS para cabeçalho e footer
  tags$head(
    tags$style(HTML("
      .title-panel {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
      }
      .title-panel img {
        margin-right: 15px;
      }
      .footer {
        margin-top: 30px;
        text-align: center;
        font-size: 0.9em;
        color: #777;
      }
    "))
  ),
  
  # Cabeçalho com logo e título
  div(class = "title-panel",
      img(src = "https://scontent.fmcz13-1.fna.fbcdn.net/v/t39.30808-6/307699010_820467645711666_8180364398391582334_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFc-FSil9QXvF8NgZWODTJb1Tudfq2SXxHVO51-rZJfEb585Iv1WSTG6I0fd8bSv3Jv3qIoLuQJKr1lcWTgS0tq&_nc_ohc=282dkk3oO14Q7kNvgGFquSv&_nc_oc=AdnufnVlanOVKm2xTbxxZDw_AigLooSgcgV7xcscz4cy4L4nl6drJ3yuFw4yMnIQ-yRUiWOSzQi4R0RCBeVtVjGb&_nc_zt=23&_nc_ht=scontent.fmcz13-1.fna&_nc_gid=f3d-tvLE-85WaYEbVIQEmg&oh=00_AYFxPyCBpdc-NHxZo9pZnG1ikDxQlEl5-kasBt6OCTMfyA&oe=67E633F2",
          height = "60px"),
      h2("Produção de Destaque do PPGCP-UFPE")
  ),
  
  # Conteúdo principal (sem sidebar)
  div(
    # Input de filtragem de produtos
    selectInput(
      inputId = "tipo_produto",
      label = "Filtrar por tipo de produto",
      choices = c("Todos", unique(dados_produtos$Tipo)),
      selected = "Todos"
    ),
    br(),
    
    # Tabset para Tabela e Detalhes
    tabsetPanel(
      id = "abas_principais",
      
      # Aba de Tabela com DT
      tabPanel(
        title = "Tabela de Produtos",
        DTOutput("tabela_produtos")
      ),
      
      # Aba de Detalhes
      tabPanel(
        title = "Detalhes do Produto",
        h3(textOutput("titulo_produto")),
        p(textOutput("descricao_produto")),
        actionButton("voltar", "Voltar para a Tabela", icon = icon("arrow-left"))
      )
    )
  ),
  
  # Footer com créditos e links para os perfis no Twitter
  div(class = "footer",
      HTML('Desenvolvido por <a href="https://x.com/baruqrodrigues" target="_blank">Baruque Rodrigues</a> 
            e <a href="https://x.com/DalsonFigueired" target="_blank">Dalson Figueiredo</a>.')
  )
)

# Lógica do servidor
server <- function(input, output, session) {
  
  # Estado reativo para armazenar o ID do produto selecionado
  produto_selecionado <- reactiveVal(NULL)
  
  # Dados filtrados por tipo
  dados_filtrados <- reactive({
    if (input$tipo_produto == "Todos") {
      dados_produtos
    } else {
      subset(dados_produtos, Tipo == input$tipo_produto)
    }
  })
  
  # Renderização da Tabela com o botão "Ver mais"
  output$tabela_produtos <- renderDT({
    df <- dados_filtrados()
    
    # Cria o botão "Ver mais" com chamada a Shiny.onInputChange via onclick
    df$`Mais informações` <- paste0(
      '<button type="button" class="btn btn-primary" ',
      'onclick="Shiny.onInputChange(\'ver_mais\', ', df$ID, ', {priority: \'event\'});">',
      'Ver mais</button>'
    )
    
    datatable(
      df[, c("ID", "Titulo", "Tipo", "Mais informações")],
      escape = FALSE,
      selection = "none",
      rownames = FALSE,
      options = list(pageLength = 10, autoWidth = TRUE)
    )
  })
  
  # Observer para clique do botão "Ver mais"
  observeEvent(input$ver_mais, {
    produto_selecionado(input$ver_mais)
    updateTabsetPanel(session, inputId = "abas_principais", selected = "Detalhes do Produto")
  })
  
  # Atualiza o conteúdo da aba de Detalhes
  output$titulo_produto <- renderText({
    id <- produto_selecionado()
    if (is.null(id)) return("Nenhum produto selecionado.")
    dados_produtos$Titulo[dados_produtos$ID == id]
  })
  
  output$descricao_produto <- renderText({
    id <- produto_selecionado()
    if (is.null(id)) return("Nenhuma descrição disponível.")
    titulo <- dados_produtos$Titulo[dados_produtos$ID == id]
    descricoes[[titulo]]
  })
  
  # Botão para voltar à aba de Tabela
  observeEvent(input$voltar, {
    updateTabsetPanel(session, inputId = "abas_principais", selected = "Tabela de Produtos")
  })
}

# Rodar o aplicativo
shinyApp(ui = ui, server = server)
