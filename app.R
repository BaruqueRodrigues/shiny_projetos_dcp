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
    "Projeto de Pesquisa",
    "Artigo",
    "Artigo",
    "Artigo",
    "Artigo",
    "Livro",
    "Tese",
    "Relatório Técnico",
    "Capítulo de Livro",
    "Projeto de Pesquisa"
  ),
  stringsAsFactors = FALSE
)

# Descrições para teste
descricoes <- list(
  "Projeto Alta Vista" = "Aderente à área de concentração de Democracia e Instituições Políticas com ênfase na linha de pesquisa de Instituições Políticas do PPGCP-UFPE. \n \n O Projeto Alta Vista é um produto científico de caráter inovador que ganhou atenção mundial ao revelar fraude nas eleições presidenciais da Venezuela em 2024 (https://osf.io/5tmjg/). \n \n Seguindo as melhores práticas metodológicas, o relatório “Estimating vote counts under restricted electoral integrity” foi pré-registrado na plataforma do Open Science Framework antes do acesso aos dados < https://storage.googleapis.com/project-pvt-2.appspot.com/public/Alta_Vista_PPA.pdf>. \n \n O relatório da pesquisa está disponível em português, inglês e espanhol. \n \n A equipe técnica contou com Raphael Nishimura (Universidade de Michigan), um dos principais amostristas da atualidade, e Walter Mebane, renomado especialista em election forensics e professor dos Departamentos de Ciência Política e Estatística da Universidade de Michigan. \n \n Utilizando dados desagregados das eleições venezuelanas de 2013 a 2021, os autores categorizaram as seções eleitorais em uma escala ideológica de sete pontos, variando das mais favoráveis à oposição às mais favoráveis ao governo. \n \n Em seguida, descrevem os procedimentos de seleção da amostra e de estimativa para obter taxas de participação e estimativas de votação para as eleições presidenciais de 2024. \n \n O potencial de impacto social, econômico e em políticas públicas do Projeto Alta Vista é evidente. \n \n As evidências produzidas pela pesquisa foram utilizadas para contestar os números divulgados pelo Conselho Nacional Eleitoral da Venezuela. \n \n O estudo teve repercussão internacional, com cobertura em veículos como The New York Times e The Guardian, e nacional, sendo destaque na Folha de São Paulo, G1 e CNN Brasil, além de uma reportagem de destaque no programa Fantástico, da TV Globo. \n \n O projeto, que tem como lema 'ciência a serviço da democracia', contribuiu para a identificação de uma das principais ameaças ao bom funcionamento das democracias: a fraude eleitoral. \n \n Além disso, oferece metodologias que podem ser replicadas para a detecção rigorosa desse importante problema em contextos de baixa integridade eleitoral. \n \n Em geral, o projeto contribui para a adoção de práticas de transparência e integridade em processos eleitorais ao redor do mundo, ajudando a promover eleições livres e justas. \n \n O projeto é um excelente exemplo de como a Ciência Política pode estar a serviço do bom funcionamento da democracia. \n \n Os dados e resultados foram disponibilizados publicamente por meio de um painel interativo de fácil acesso, promovendo a transparência e o controle social: <https://supervisiondev2.metabaseapp.com/public/dashboard/6b2f7b3b-16ec-4af6-84c7-69c39ee2139d?tab=16-english>. \n \n A reportagem do New York Times está disponível aqui: [https://www.nytimes.com/2024/07/31/world/americas/venezuela-maduro-election-results.html]. \n \n A matéria do Fantástico está disponível em <https://globoplay.globo.com/v/12804046/>.",
  "Fake News Fact Checking and Partisanship" = "Aderente à área de concentração Democracia e Instituições com ênfase na linha de pesquisa de Instituições do PPGCP-UFPE. \n \n O estudo se baseia em experimentos conduzidos durante as eleições de 2018 no Brasil para investigar a eficácia das correções de checagem de fatos no combate à desinformação. \n \n Os resultados mostraram que as correções de checagem de fatos não foram eficazes em mudar crenças em informações falsas, diferentemente do observado em democracias desenvolvidas. \n \n Além disso, tanto petistas quanto antipetistas tenderam a acreditar mais em rumores que confirmavam suas inclinações políticas, evidenciando o impacto do raciocínio motivado pelas identidades políticas. \n \n O paper foi publicado no  Journal of Politics, um dos periódicos mais prestigiados da Ciência Política, com fator de impacto de 4,48, SJR de 3,048, e Qualis A1. \n \n O paper inova ao apresentar o primeiro estudo experimental sobre desinformação no Brasil e um dos primeiros no Sul Global. \n \n Essa inovação é importante porque até então a esmagadora maioria dos estudos sobre desinformação havia sido conduzida nos Estados Unidos ou em democracias avançadas, onde a dimensão e impacto do problema tendem a ser mais reduzidos e o combate à desinformação menos desafiador. \n \n A pesquisa possui claro impacto social ao contribuir para o entendimento de um fenômeno que pode ameaçar o bom funcionamento de democracias em desenvolvimento. \n \n Além disso, contribui diretamente para a formulação de políticas públicas de combate à desinformação. \n \n Especificamente, os achados da pesquisa destacam a necessidade de estratégias inovadoras que reconheçam o papel das emoções e das identidades políticas na propagação de fake news, indo além de simples esforços para desmentir informações falsas. \n \n Nesse sentido, a pesquisa embasou as contribuições dadas pela Professora Nara Pavão a um relatório técnico do TSE voltado ao combate à desinformação no Brasil. \n \n Além disso, os resultados da pesquisa foram amplamente divulgados na mídia, a exemplo das entrevistas na Folha de São Paulo, para o Podcast Politiquês, do jornal Nexo, e matéria no jornal O Globo. \n \n Destaca-se, ainda, que esse artigo é fruto de uma rede internacional de colaboração que inclui Frederico Batista (University of North Carolina at Charlotte) e Natália Bueno (Emory University). \n \n De acordo com estimativas do Google Scholar (março de 2025), o trabalho já conta com 32 citações apesar de ter sido publicado em 2022, o que pode ser interpretado como um enorme impacto científico. \n \n O trabalho foi apresentado em várias conferências nacionais e internacionais, como o Congresso da Associação Americana de Ciência Política (APSA).",
  "Beyond Roll-Call Voting" = "Aderente à área de concentração Relações Internacionais na linha de pesquisa de Política Internacional do PPGCP-UFPE. \n \n O artigo 'Beyond Roll-Call Voting: Sponsorship Dynamics at the UN General Assembly', publicado na prestigiosa International Studies Quarterly (FI = 2,4) apresenta a comunidade científica internacional a maior base de dados já montada sobre as votações da Assembleia Geral das Nações Unidas (UNGA). \n \n O produto foi elaborado em parceria com Pedro Seabra do Center for International Studies (CEI-Iscte), Portugal. \n \n O caráter inovador do trabalho reside na criação do UN General Assembly Sponsorship Dataset, que compila dados inéditos sobre o comportamento de patrocínio de todos os membros da UNGA entre 2009 e 2019. \n \n Este conjunto de dados possibilitou o desenvolvimento de dois índices originais — prioridade e propriedade — que quantificam a relevância e o grau de envolvimento dos Estados em cada proposta de resolução. \n \n Esses índices permitem novas interpretações sobre as dinâmicas de influência, cooptação e formação de coalizões dentro da UNGA, abrindo novas possibilidades de pesquisas sobre as interações diplomáticas globais. \n \n O potencial de impacto social e político da pesquisa é significativo. \n \n A metodologia proposta amplia as possibilidades de análise de políticas multilaterais e contribui para a transparência dos processos decisórios nas Nações Unidas. \n \n A relevância acadêmica do trabalho também se destaca pela sua aplicação interdisciplinar, dialogando com estudos de Ciência Política, Relações Internacionais, Bibliometria e Análise de redes. \n \n A publicação em uma revista de alto impacto e o reconhecimento da comunidade científica evidenciam a qualidade da pesquisa. \n \n Em termos de contribuição para políticas públicas, o estudo fornece informações úteis sobre os mecanismos informais que moldam decisões multilaterais. \n \n Importante ressaltar que todos os dados foram disponibilizados em uma plataforma aberta < https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/MPQUE2>. \n \n O arquivo já conta com mais de 1.000 downloads. \n \n O acesso público ao banco de dados promove ainda mais a transparência e incentiva novas pesquisas sobre governança global. \n \n Portanto, o artigo combina inovação metodológica, relevância acadêmica e impacto político-social, consolidando-se como uma contribuição significativa para o campo das relações internacionais e análise política institucional. \n \n Conforme estimativas do Google Scholar, apesar de ter sido publicado em 2022, o artigo já conta com mais de 1.100 visualizações, cerca de 400 downloads e impressionantes 20 citações, o que demonstra excelente repercussão entre a comunidade científica [ver https://scholar.google.com/citations?user=g2VumKkAAAAJ&hl=pt-BR].",
  "Be careful what you wish for" = "Aderente à área de concentração de Instituições Políticas com ênfase na linha de pesquisa de Instituições Políticas do PPGCP-UFPE. \n \n O estudo foi publicado em co-autoria com Timothy Power e César Zucco na Party Politics, revista com Fator de Impacto 2,4 e Qualis A1. \n \n Este estudo foi escolhido por diversas razões. \n \n Primeiro, por seu caráter inovador, ao investigar um aspecto negligenciado da política de coalizões em sistemas presidenciais: suas implicações eleitorais. \n \n Ao analisar o impacto da participação em gabinetes presidenciais sobre o desempenho eleitoral dos partidos no Brasil ao longo de 24 anos, a pesquisa preenche uma lacuna na literatura ao demonstrar que os efeitos eleitorais da coalizão dependem de fatores como popularidade presidencial e o grau de envolvimento dos partidos no governo. \n \n A relevância do estudo se justifica também pela criação e aplicação de um indicador inédito – o Salience-Weighted Portfolio Share (SWPS) – que mede o grau de envolvimento dos partidos no governo. \n \n Esse novo indicador foi construído a partir de survey original com deputados em exercício. \n \n A métrica permite um exame mais detalhado da relação entre coalizões e desempenho eleitoral, oferecendo uma ferramenta valiosa para futuras pesquisas sobre presidencialismo multipartidário e estratégias partidárias. \n \n O estudo tem um potencial impacto social e político: ao jogar luz sobre as dinâmicas da responsabilização política em sistemas presidenciais multipartidários, fornece insumos para o desenho de reformas que fortaleçam o papel do eleitor na fiscalização das coalizões e incentivem maior coerência nas alianças políticas. \n \n Por fim, o estudo foi indicado por ser fruto de colaboração internacional de longa data do PPGCP/UFPE com o Latin American Centre da Universidade de Oxford e com os pesquisadores Timothy Power (Oxford) e César Zucco (FGV). \n \n O trabalho foi desenvolvido durante o período como pesquisadora visitante na Universidade de Oxford com bolsa do projeto Capes-Print e foi apresentado no evento do Brazilian Studies Programme. \n \n O estudo também recebeu atenção da mídia, com reportagem de capa na revista Veja (https://veja.abril.com.br/brasil/poder-e-verbas-bilionarias-por-que-os-ministerios-sao-tao-cobicados/).",
  "‘Congruent We Govern’" = "Aderente à área de concentração de Instituições Políticas com ênfase na linha de pesquisa de Instituições Políticas do PPGCP-UFPE. \n \n O artigo, escrito em parceria com Carlos Pereira e Frederico Bertholini, foi publicado na revista Government and Opposition (fator de impacto 2,9). \n \n O produto foi indicado para representar o PPGCP por ser uma produção de excelência e que possui desdobramentos importantes para o entendimento e a formulação de políticas públicas em regimes presidencialistas multipartidários, como o brasileiro. \n \n Este estudo também foi escolhido por seu caráter inovador, pois introduz uma nova perspectiva na análise da governança em sistemas presidenciais multipartidários, enfatizando a importância da congruência ideológica entre a coalizão governista e o Congresso. \n \n Ao desafiar abordagens tradicionais que priorizam o tamanho da coalizão ou os poderes institucionais do presidente, a pesquisa avança nosso entendimento sobre os custos da governança e os desafios da formulação de políticas em regimes multipartidários. \n \n A relevância do produto reside na demonstração empírica de que o alinhamento ideológico entre governo e parlamento—fator frequentemente negligenciado pelos estudos da área—é determinante para o sucesso legislativo, independentemente do número de cadeiras da coalizão. \n \n Essa descoberta esclarece fenômenos políticos aparentemente contraditórios, como presidentes com grandes coalizões que enfrentam dificuldades para aprovar leis e presidentes com pequenas coalizões que conseguem legislar com eficiência. \n \n O estudo tem um potencial impacto social e político, pois pode contribuir para o fortalecimento da governabilidade democrática ao evidenciar a necessidade de maior alinhamento programático entre o Executivo e o Legislativo. \n \n Ao ressaltar a influência da composição ideológica do Congresso na formulação de políticas, a pesquisa oferece subsídios para a sociedade compreender melhor os desafios do presidencialismo multipartidário e a importância de coalizões coerentes e eficazes. \n \n No âmbito econômico e das políticas públicas, a pesquisa pode ter implicações relevantes para a previsibilidade política e a estabilidade institucional. \n \n A governança eficaz influencia diretamente a capacidade do governo de implementar políticas públicas e reformas estruturais, afetando o ambiente de negócios e o crescimento econômico. \n \n O estudo apresenta também um potencial de informar reformas institucionais voltadas para aprimorar o funcionamento das coalizões governamentais. \n \n Ao demonstrar que não basta apenas construir maiorias legislativas formais, mas sim garantir a convergência programática, o estudo aponta caminhos para o fortalecimento da governança democrática e da eficiência legislativa. \n \n Seguindo as melhores práticas científicas, materiais de replicação, incluindo dados originais e scripts computacionais, foram publicamente compartilhadas em uma plataforma de acesso aberto <https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/IEK5UG>.",
  "Prosecutors, Voters and Corruption" = "Aderente à área de concentração de Democracia e Instituições Políticas com ênfase na linha de pesquisa de Instituições Políticas do PPGCP-UFPE. \n \n O livro “Prosecutors, Voters and The Criminalization of Corruption in Latin America: The Case of Lava Jato” é fruto de uma colaboração internacional que conta com a participação da professora Nara Pavão (PPGCP/UFPE), Ezequiel A. \n \n Gonzalez-Ocantos (Universidade de Oxford), Paula Muñoz Chirinos (Universidad del Pacífico) e Viviana Baraybar Hidalgo (Universidade de Oxford). \n \n Publicado pela prestigiosa Cambridge University Press, a obra examina a Operação Lava Jato, um caso de corrupção transnacional originado no Brasil e que se alastrou pela América Latina, sacudiu eleições e derrubou governos. \n \n O estudo investiga as reformas que fortaleceram a capacidade dos procuradores de combater o crime de colarinho branco e analisa o impacto da prestação de contas por meio da criminalização, dissecando os impulsionadores e dilemas de esforços resolutos em prol da transparência. \n \n A pesquisa recebeu dois prêmios importantes. \n \n O primeiro deles, o Charles Levine Memorial Book Prize, é concedido anualmente pela Associação Internacional de Ciência Política (IPSA) a um livro que oferece uma contribuição de considerável relevância teórica ou prática para a formulação de políticas públicas e administração. \n \n O segundo prêmio, menção honrosa do Donna Lee Van Cott Best Book Award, é concedido pela seção de Instituições Políticas da Associação de Estudos Latino-Americanos (LASA), reconhecendo livros que fazem contribuições significativas na área de instituições políticas. \n \n A obra também repercutiu bastante na imprensa e debate público no Brasil, sendo objeto de reportagens da Folha de São Paulo, do Estadão, da BBC e Valor Econômico. \n \n Por fim, o livro também teve impacto social ao fundamentar discussões técnicas sobre o combate à corrupção no Brasil, durante o seminário “Repensando o Esforço Anticorrupção no Brasil”, realizado em Brasília e organizado pela CGU, ENAP e American University. \n \n De acordo com estimativas do Google Scholar, a obra já conta com 43 citações, mesmo tendo sido publicada em 2023, o que significa elevado impacto científico quando a métrica utilizada é o número de citações.",
  "The family connection" = "O produto é aderente à área de concentração de Democracia e Instituições Políticas na linha de pesquisa de Políticas Públicas. \n \n Defendida por Virginia Rocha da Silva sob orientação da professora Mariana Batista, a tese “The Family Connection: Political Dynasties and Government Transparency in Brazilian Municipalities” investiga como dinastias políticas afetam o cumprimento da Lei de Acesso à Informação (LAI). \n \n Utilizando dados observacionais e métodos estatísticos avançados, como o modelo de regressão binomial negativa inflacionada de zeros, a pesquisa propõe uma métrica automatizada para identificar políticos dinásticos, o que representa um importante avanço metodológico no campo da Ciência Política. \n \n Todos os materiais de replicação estão publicamente disponíveis <https://osf.io/8qswd/?view_only=f300bf07f4824e9baddd1aaa0dda5c63>. \n \n O trabalho recebeu o prêmio de melhor tese de doutorado pela Associação Brasileira de Ciência Política (ABCP) em 2024 <https://cienciapolitica.org.br/web/resultado-do-premio-de-melhor-tese-edicao-2024/>. \n \n Como parte do prêmio, a ABCP oferece apoio para viabilizar a publicação da tese em formato de e-Book. \n \n Um artigo decorrente da tese também está em fase de finalização para submissão em Revista Internacional. \n \n A originalidade do trabalho reside na combinação de técnicas de aprendizado de máquina (machine learning), como o uso de API de busca personalizada do Google e a biblioteca Beautiful Soup, com análise estatística para testar hipóteses sobre a influência das dinastias políticas na transparência governamental. \n \n Essa abordagem oferece uma nova perspectiva sobre como o poder informal pode afetar a governança pública. \n \n Em termos de relevância, a pesquisa aborda um tema central para a democracia brasileira: a transparência pública. \n \n A baixa regulamentação da LAI compromete o acesso à informação e, consequentemente, a prestação de contas dos gestores públicos. \n \n Ao revelar que prefeitos dinásticos, quando alinhados com o presidente ou governador, podem reduzir a probabilidade de regulamentação da LAI, o trabalho contribui para a compreensão dos desafios estruturais e políticos que impedem a efetividade dessa lei. \n \n O potencial de impacto social e econômico do estudo é significativo, pois fornece subsídios para o desenvolvimento de políticas públicas que visem melhorar a transparência governamental e combater práticas que limitam o acesso à informação. \n \n Por sua vez, a proposta metodológica de identificação automatizada de políticos dinásticos pode ser incorporada em outras iniciativas de monitoramento e avaliação da integridade pública, promovendo maior accountability em diferentes esferas governamentais. \n \n Por fim, a contribuição para políticas públicas é direta, uma vez que os resultados podem informar recomendações específicas para fortalecer a regulamentação da LAI nos municípios brasileiros. \n \n A inclusão de uma nova variável política — as dinastias políticas — no debate sobre transparência local é um passo relevante para a formulação de estratégias que enfrentem desigualdades regionais e promovam maior adesão à transparência ativa e passiva. \n \n Para garantir o acesso dos avaliadores da CAPES à tese, mesmo em caso de falhas no sistema Sucupira, o PPG/UFPE disponibilizou o material em um repositório aberto <https://osf.io/wmrxc/>. \n \n Para tanto, basta entrar na pasta Anexo A - Teses e Dissertações e fazer download do arquivo.",
  "Varieties of Electoral Integrity Risk" = "O produto é aderente à área de concentração em Democracia e Instituições na linha de pesquisa de Instituições Políticas. \n \n O relatório técnico 'Varieties of Electoral Integrity Risk: Protecting Elections in Brazil', de Gabriela Tarouco, analisa riscos à integridade eleitoral no Brasil e o papel da Justiça Eleitoral na mitigação dessas ameaças. \n \n O estudo integra o projeto internacional Protecting Elections Project, patrocinado pelo governo do Canadá, e foi encomendado pelo International Institute for Democracy and Electoral Assistance (IDEA), organização intergovernamental dedicada ao fortalecimento de instituições democráticas e processos eleitorais. \n \n O produto foi selecionado para representar o PPGCP por possuir excelência acadêmica, caráter internacional e relevância social e política. \n \n O estudo examina desafios como fraudes eleitorais, campanhas de desinformação, desigualdade de gênero na política e ameaças institucionais ao Tribunal Superior Eleitoral (TSE). \n \n O projeto inova ao adotar a abordagem de gestão de riscos, que considera tanto ameaças diretas ao processo eleitoral quanto riscos institucionais que comprometem a autonomia da Justiça Eleitoral. \n \n O impacto social do estudo se dá ao fortalecer a confiança no processo eleitoral e contribuir para a legitimidade democrática. \n \n Politicamente, oferece subsídios para aprimorar o desenho institucional da Justiça Eleitoral, aumentando a transparência e a eficácia na gestão e fiscalização das eleições. \n \n Em termos de políticas públicas, orienta estratégias para mitigar riscos eleitorais, aperfeiçoando protocolos de gestão de crises e comunicação institucional para preservar a estabilidade democrática. \n \n Além de servir como referência para outros países, a análise do modelo brasileiro de governança eleitoral contribui para debates acadêmicos e institucionais sobre o papel das cortes eleitorais na proteção da democracia. \n \n O relatório integra um projeto internacional que contou com o apoio do TSE, incluindo entrevistas e sua inclusão na Biblioteca Digital da Justiça Eleitoral (https://bibliotecadigital.tse.jus.br/xmlui/handle/bdtse/11857). \n \n Escrito em inglês e disponível em formato aberto, o relatório já foi utilizado em disciplinas eletivas do PPGCP e, mais recentemente, será aproveitado pelo Dr. \n \n Ian Rebouças, egresso do programa e atualmente funcionário do Carter Center. \n \n Acesse o relatório completo: [https://www.idea.int/sites/default/files/2023-09/varieties-of-electoral-integrity-risk-protecting-elections-in-brazil-en.pdf]",
  "Civil society: NGOs and public opinion" = "O produto é aderente à área de concentração de Relações Internacionais na linha de pesquisa de Política Internacional. \n \n O estudo foi publicado como capítulo do Routledge Handbook of Marine Governance and Global Environmental Change, parte da série de manuais da prestigiada editora Routledge sobre meio ambiente e sustentabilidade. \n \n Representa o PPGCP por seu alto impacto acadêmico e social, sendo publicado em inglês por uma editora de renome, com ampla rede internacional de pesquisadores. \n \n O livro tem sido 2,82 vezes mais citado que outros textos similares, conforme a ferramenta de inteligência artificial <www.dimensions.ai>. \n \n Escrito em parceria com Elia Elisa Cia Alves (UFPB) e Luís Paulo Santana (SEMAS/PE), o capítulo investiga o papel da sociedade civil na política de governança ambiental desde a década de 1970. \n \n Diante das crescentes mudanças ambientais globais, torna-se essencial reavaliar os modelos de gestão dos mares. \n \n O estudo se destaca por sua abordagem inovadora, ao deslocar o foco da governança centrada nos Estados para um modelo que reconhece os oceanos como bens comuns globais. \n \n Essa perspectiva enfatiza a participação da sociedade civil na formulação e implementação de políticas marítimas sustentáveis. \n \n A pesquisa amplia o conhecimento sobre os desafios e contribuições da sociedade civil para a governança oceânica. \n \n Mapeia dificuldades, como restrições financeiras e barreiras regulatórias, ao mesmo tempo em que destaca experiências bem-sucedidas. \n \n Essa sistematização favorece o desenvolvimento de estratégias eficazes para fortalecer a participação da sociedade civil na proteção dos oceanos. \n \n O impacto social do estudo se dá ao reforçar o papel de indivíduos, redes informais e ONGs na governança oceânica. \n \n Ao evidenciar a relevância dessas iniciativas, incentiva a mobilização social e a conscientização pública, promovendo o empoderamento de comunidades costeiras e grupos tradicionalmente marginalizados. \n \n No âmbito econômico, a pesquisa contribui para identificar soluções que conciliem desenvolvimento e sustentabilidade. \n \n A governança eficiente dos oceanos é crucial para setores como pesca, turismo, transporte marítimo e energia, garantindo que essas atividades ocorram de forma responsável e equitativa. \n \n O estudo documenta experiências de sucesso e oferece diretrizes para aprimorar modelos de gestão que minimizem impactos ambientais e maximizem benefícios socioeconômicos. \n \n Além disso, a pesquisa fortalece políticas públicas, fornecendo subsídios para aprimorar marcos regulatórios e institucionais voltados à governança oceânica. \n \n Ao demonstrar a importância da colaboração entre Estados, sociedade civil e setor privado, contribui para estratégias alinhadas aos Objetivos de Desenvolvimento Sustentável (ODS), especialmente o ODS 14, sobre conservação e uso sustentável dos oceanos. \n \n O estudo oferece insights valiosos para uma gestão mais participativa e eficaz da governança oceânica em um cenário de mudanças ambientais globais.",
  "Gênero e promoção da integridade" = "O produto é aderente à área de concentração de Democracia e Instituições Políticas na linha de pesquisa de Políticas Públicas. \n \n A pesquisa 'Gênero e promoção da integridade: evidências dos governos locais' foi desenvolvida no âmbito do Programa Cátedras da Escola Nacional de Administração Pública (ENAP). \n \n A pesquisa foi selecionada por meio de seleção pública bastante competitiva (https://enap.gov.br/pt/?option=com_content&view=article&id=4797), o que atesta sua qualidade e relevância. \n \n O estudo busca analisar a relação entre representatividade de gênero e integridade na administração pública municipal no Brasil. \n \n Examina como a presença de mulheres em cargos de liderança impacta práticas de governança, transparência e equidade. \n \n Além disso, desenvolve indicadores para mapear políticas de promoção da integridade no nível local. \n \n O produto foi indicado pelo PPGCP por combinar excelência acadêmica e contribuição prática para a administração pública. \n \n A análise da relação entre gênero e integridade contribui para reforçar a importância da diversidade de gênero nas esferas decisórias, fomentando políticas públicas que reduzam desigualdades estruturais. \n \n O estudo fornece evidências sobre a relação entre representatividade de gênero e integridade na administração pública, destacando como uma maior inclusão de mulheres em cargos de liderança pode fortalecer a governança local. \n \n Os indicadores desenvolvidos sobre integridade pública e diversidade de gênero podem orientar políticas públicas voltadas para a equidade na ocupação de cargos, transparência administrativa e combate à corrupção. \n \n Os achados podem embasar programas de capacitação, medidas de equidade salarial e ações para prevenir assédio moral e sexual no setor público. \n \n Além disso, ao focar nos governos locais, a pesquisa permite entender variações na implementação de políticas de integridade entre municípios, possibilitando adaptações e recomendações específicas para diferentes contextos regionais. \n \n Por fim, a pesquisa pode fundamentar propostas legislativas e iniciativas do governo federal para aprimorar mecanismos de controle interno, transparência e diversidade nos órgãos públicos. \n \n Os resultados da pesquisa foram apresentados no âmbito da ENAP e o impacto social pode ser observado na apresentação pública e também diálogo institucional para formulação de políticas públicas no âmbito da Controladoria Geral da União (https://suap.enap.gov.br/vitrine/curso/2788/). \n \n O evento contou com uma etapa de debate público sobre os achados da pesquisa e também uma etapa de discussão interna com especialistas da CGU para comunicação das evidências do estudo e facilitação da incorporação no âmbito das políticas públicas sobre integridade desenvolvidas no governo federal brasileiro. \n \n Essa pesquisa mostra a conexão entre a academia e a gestão pública no que se busca como um movimento de política pública baseada em evidência."
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
