//
//  FeedServiceTests.swift
//  FeedTests
//
//  Created by Adriano Rezena on 17/01/23.
//

import XCTest
@testable import Feed

final class FeedServiceTests: XCTestCase {

    let serviceSuccessfulResponse: String = "{\"erro\":0,\"lista\":[{\"id\":\"48725\",\"titulo\":\"J\\u00fanior Recalcati: Hemosc a conta gotas\",\"data\":\"2023-01-27 12:26:04\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48725\\/4f66c26a8b7cdb93bce07d3d823d674c.jpg\",\"id_categoria\":\"54\",\"categoria\":\"Oeste Catarinense\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48725\\/junior-recalcati-hemosc-a-conta-gotas\",\"subtitulo\":\"De qualquer forma, estamos ainda longe de uma solu\\u00e7\\u00e3o definitiva e continuaremos mobilizando as autoridades competentes para viabilizarmos a unidade de coleta em nossa cidade\",\"municipio_id\":\"1\",\"municipio_nome\":\"S\\u00e3o Miguel do Oeste - SC\"},{\"id\":\"48724\",\"titulo\":\"Enteada \\u00e9 suspeita de matar padrasto com facada ap\\u00f3s discuss\\u00e3o em Xanxer\\u00ea\",\"data\":\"2023-01-27 10:23:55\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48724\\/ef8068973c4dd8c543daf524ed2372ca.jpg\",\"id_categoria\":\"31\",\"categoria\":\"Seguran\\u00e7a P\\u00fablica\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48724\\/enteada-e-suspeita-de-matar-padrasto-com-facada-apos-discussao-em-xanxere\",\"subtitulo\":\"O caso foi registrado pela Pol\\u00edcia Militar de quinta-feira (27). A suspeita foi detida e encaminhada para a delegacia de Pol\\u00edcia Civil\",\"municipio_id\":\"52\",\"municipio_nome\":\"Xanxer\\u00ea - SC\"},{\"id\":\"48723\",\"titulo\":\"D\\u00edvida dos catarinenses aumenta 12,6% em 2022, diz Serasa\",\"data\":\"2023-01-27 09:19:23\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48723\\/f0d9251cd4d16feae797c31610e241f6.jpg\",\"id_categoria\":\"31\",\"categoria\":\"Seguran\\u00e7a P\\u00fablica\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48723\\/divida-dos-catarinenses-aumenta-12-6-em-2022-diz-serasa\",\"subtitulo\":\"Valor m\\u00e9dio foi de R$ 6.290 em dezembro do ano passado\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48722\",\"titulo\":\"Nos dez anos do inc\\u00eandio da Boate Kiss, senadores cobram puni\\u00e7\\u00e3o dos respons\\u00e1veis\",\"data\":\"2023-01-27 07:00:38\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48722\\/362f0c602a3fb78678cea8334f92a79a.jpeg\",\"id_categoria\":\"52\",\"categoria\":\"Senado Federal\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48722\\/nos-dez-anos-do-incendio-da-boate-kiss-senadores-cobram-punicao-dos-responsaveis\",\"subtitulo\":\"Nesta sexta-feira (27), dia que marca os dez anos do inc\\u00eandio da Boate Kiss em Santa Maria (RS), senadores declararam solidariedade aos familiares ...\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48721\",\"titulo\":\"Veja que senadores tomam posse na quarta-feira; quatro s\\u00e3o ministros\",\"data\":\"2023-01-27 06:17:46\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48721\\/8e109ee075a31b6b5e7975a8ccbe519f.jpeg\",\"id_categoria\":\"52\",\"categoria\":\"Senado Federal\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48721\\/veja-que-senadores-tomam-posse-na-quarta-feira-quatro-sao-ministros\",\"subtitulo\":\"Os 27 senadores eleitos em outubro tomam posse na pr\\u00f3xima quarta-feira (1\\u00ba) no Plen\\u00e1rio da Casa. Os mandatos s\\u00e3o de oito anos e v\\u00e3o at\\u00e9 fevereiro d...\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48720\",\"titulo\":\"Edinaldo Enoque: N\\u00f3s e os Outros\",\"data\":\"2023-01-26 20:00:58\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48720\\/7f16ad9438ad05068ebf62165ae170b1.jpg\",\"id_categoria\":\"1\",\"categoria\":\"Geral\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48720\\/edinaldo-enoque-nos-e-os-outros\",\"subtitulo\":\"Confira a coluna Contraponto de Edinaldo Enoque desta quinta-feira (26\\/01\\/2023)\",\"municipio_id\":\"1\",\"municipio_nome\":\"S\\u00e3o Miguel do Oeste - SC\"},{\"id\":\"48719\",\"titulo\":\"Gasolina fica mais cara nos postos de SC\",\"data\":\"2023-01-26 19:30:54\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48719\\/87af5a5434666a6a20f8b8c156607a1b.jpg\",\"id_categoria\":\"55\",\"categoria\":\"Santa Catarina\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48719\\/gasolina-fica-mais-cara-nos-postos-de-sc\",\"subtitulo\":\"Reajuste no pre\\u00e7o do combust\\u00edvel foi anunciado pela Petrobras na ter\\u00e7a\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48718\",\"titulo\":\"Jorginho vai pedir a Lula abatimento de R$ 465 milh\\u00f5es pagos por Mois\\u00e9s a obras em rodovias federais\",\"data\":\"2023-01-26 18:26:19\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48718\\/78a2e80b07558492105b22a4664de91c.jpg\",\"id_categoria\":\"55\",\"categoria\":\"Santa Catarina\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48718\\/jorginho-vai-pedir-a-lula-abatimento-de-r-465-milhoes-pagos-por-moises-a-obras-em-rodovias-federais\",\"subtitulo\":\"Governador de SC quer que valor pago para acelerar duplica\\u00e7\\u00e3o de estradas federais seja descontado na d\\u00edvida do Estado com a Uni\\u00e3o\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48717\",\"titulo\":\"Governo de SC anuncia diretores de hospitais\",\"data\":\"2023-01-26 17:23:19\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48717\\/db21b8a320af3f480cdd6a481dfbd28d.jpg\",\"id_categoria\":\"55\",\"categoria\":\"Santa Catarina\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48717\\/governo-de-sc-anuncia-diretores-de-hospitais\",\"subtitulo\":\"Entre as unidades que estavam sem lideran\\u00e7a est\\u00e3o o Hospital Governador Celso Ramos e o Hospital Infantil Joana de Gusm\\u00e3o\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48716\",\"titulo\":\"Saiba quais pedidos Jorginho Mello ir\\u00e1 fazer ao presidente Lula em reuni\\u00e3o em Bras\\u00edlia\",\"data\":\"2023-01-26 16:17:05\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48716\\/433af649e2b417bf92bdb8245a998170.jpg\",\"id_categoria\":\"55\",\"categoria\":\"Santa Catarina\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48716\\/saiba-quais-pedidos-jorginho-mello-ira-fazer-ao-presidente-lula-em-reuniao-em-brasilia\",\"subtitulo\":\"Jorginho Mello cumpre agenda em Bras\\u00edlia e se prepara para encontro com Lula e o F\\u00f3rum de Governadores; ele pode apresentar tr\\u00eas demandas priorit\\u00e1rias do Estado\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48715\",\"titulo\":\"10 anos de Boate Kiss: pais e amigos fazem vig\\u00edlia para lembrar data\",\"data\":\"2023-01-26 15:15:14\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48715\\/982a917191fddbf612a355ee68c947b4.jpeg\",\"id_categoria\":\"53\",\"categoria\":\"Direitos Humanos\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48715\\/10-anos-de-boate-kiss-pais-e-amigos-fazem-vigilia-para-lembrar-data\",\"subtitulo\":\"Inten\\u00e7\\u00e3o \\u00e9 n\\u00e3o deixar trag\\u00e9dia ser esquecida ou silenciada\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48714\",\"titulo\":\"INSS regulamenta procedimentos que servir\\u00e3o como prova de vida\",\"data\":\"2023-01-26 14:47:01\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48714\\/28ec7de66707a7abdb71b1d5be87e6db.jpeg\",\"id_categoria\":\"30\",\"categoria\":\"Economia\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48714\\/inss-regulamenta-procedimentos-que-servirao-como-prova-de-vida\",\"subtitulo\":\"A partir deste ano, caber\\u00e1 ao \\u00f3rg\\u00e3o comprovar situa\\u00e7\\u00e3o do benefici\\u00e1rio\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48713\",\"titulo\":\"10 anos da Boate Kiss: pais de v\\u00edtimas fazem homenagens em Santa Maria\",\"data\":\"2023-01-26 13:13:51\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48713\\/1db4a10c26ae8ced129a3f6e557319bf.jpeg\",\"id_categoria\":\"53\",\"categoria\":\"Direitos Humanos\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48713\\/10-anos-da-boate-kiss-pais-de-vitimas-fazem-homenagens-em-santa-maria\",\"subtitulo\":\"Vig\\u00edlia vai ocorrer em frente ao pr\\u00e9dio onde funcionava boate\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48712\",\"titulo\":\"Moraes libera redes sociais do deputado eleito Nikolas Ferreira\",\"data\":\"2023-01-26 12:45:21\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48712\\/3ed7dfd3ef5e5573e8ed50275a873e29.jpeg\",\"id_categoria\":\"45\",\"categoria\":\"Justi\\u00e7a\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48712\\/moraes-libera-redes-sociais-do-deputado-eleito-nikolas-ferreira\",\"subtitulo\":\"Parlamentar dever\\u00e1 se abster de publicar not\\u00edcias falsas\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48711\",\"titulo\":\"J\\u00fanior Recalcati: MSP em S\\u00e3o Miguel do Oeste?\",\"data\":\"2023-01-26 11:09:18\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48711\\/567131833704792cd37bfa11b25ef907.jpg\",\"id_categoria\":\"54\",\"categoria\":\"Oeste Catarinense\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48711\\/junior-recalcati-msp-em-sao-miguel-do-oeste\",\"subtitulo\":\"Dizem que todos s\\u00e3o iguais perante a lei, mas no Executivo Municipal temos uns mais iguais do que os outros\",\"municipio_id\":\"1\",\"municipio_nome\":\"S\\u00e3o Miguel do Oeste - SC\"},{\"id\":\"48710\",\"titulo\":\"D\\u00edvida p\\u00fablica pode alcan\\u00e7ar at\\u00e9 R$ 6,8 trilh\\u00f5es em 2023\",\"data\":\"2023-01-26 10:30:31\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48710\\/74581a0f49bf7463975976f3ef209a1e.jpeg\",\"id_categoria\":\"30\",\"categoria\":\"Economia\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48710\\/divida-publica-pode-alcancar-ate-r-6-8-trilhoes-em-2023\",\"subtitulo\":\"Plano de financiamento foi divulgado pelo Tesouro Nacional\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48709\",\"titulo\":\"Proposta de cria\\u00e7\\u00e3o da Guarda Nacional est\\u00e1 pronta, diz ministro\",\"data\":\"2023-01-26 09:16:14\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48709\\/775ee07e263744c790e4d067f929e796.jpeg\",\"id_categoria\":\"28\",\"categoria\":\"Pol\\u00edtica\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48709\\/proposta-de-criacao-da-guarda-nacional-esta-pronta-diz-ministro\",\"subtitulo\":\"Fl\\u00e1vio Dino explica papel de nova corpora\\u00e7\\u00e3o federal de seguran\\u00e7a\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48708\",\"titulo\":\"Pol\\u00edcia Legislativa pede refor\\u00e7o policial para posse de senadores\",\"data\":\"2023-01-26 08:46:04\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48708\\/eb12c66dd17d91d51a62c9060cbd73cd.jpeg\",\"id_categoria\":\"45\",\"categoria\":\"Justi\\u00e7a\",\"autor\":\"Oeste em Foco\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48708\\/policia-legislativa-pede-reforco-policial-para-posse-de-senadores\",\"subtitulo\":\"Interventor diz que foram detectados riscos para a seguran\\u00e7a do evento\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48707\",\"titulo\":\"Su\\u00e1rez marca de novo e Gr\\u00eamio vence a retranca do Brasil de Pelotas\",\"data\":\"2023-01-25 23:49:00\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48707\\/68c01d4bacb98c574a24c2c3913f698f.jpg\",\"id_categoria\":\"50\",\"categoria\":\"Esportes\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48707\\/suarez-marca-de-novo-e-gremio-vence-a-retranca-do-brasil-de-pelotas\",\"subtitulo\":\"Tricolor jogou toda segunda etapa em vantagem num\\u00e9rica e s\\u00f3 conseguiu superar a defesa xavante aos 45 minutos\",\"municipio_id\":null,\"municipio_nome\":\" - \"},{\"id\":\"48706\",\"titulo\":\"Inter busca empate contra o Avenida e segue sem vencer no Gauch\\u00e3o\",\"data\":\"2023-01-25 22:25:04\",\"foto\":\"https:\\/\\/www.oesteemfoco.com.br\\/images\\/noticias\\/48706\\/e38b47546d93f2b06fd6318843d63f55.jpg\",\"id_categoria\":\"50\",\"categoria\":\"Esportes\",\"autor\":\"J\\u00fanior Recalcati\",\"url\":\"https:\\/\\/www.oesteemfoco.com.br\\/noticia\\/48706\\/inter-busca-empate-contra-o-avenida-e-segue-sem-vencer-no-gauchao\",\"subtitulo\":\"Carlos Henrique abriu o placar para o Periquito, mas De Pena igualou o marcador para o Colorado\",\"municipio_id\":null,\"municipio_nome\":\" - \"}]}"
    
    let serviceErrorResponse: String = "{\"erro\":1,\"msg\":\"Chave inv\\u00e1lida ou faltando!\"}"
    
    func test_lastNews_pathIsCorrect() {
        XCTAssertEqual(FeedService.FeedAPI.lastNews.path, "https://oesteemfoco.com.br/api/noticias?chave=c2d8b8a4631b413001e9d927568eb310d476596d")
    }
    
    func test_lastNewsByType_pathIsCorrect() {
        let type: Int = 1
        XCTAssertEqual(FeedService.FeedAPI.lastNewsByType(type).path, "https://oesteemfoco.com.br/api/noticias?chave=c2d8b8a4631b413001e9d927568eb310d476596d&editoria=\(type)")
    }
    
    // MARK: - lastNews
    func test_getLastNews_shouldThrowWithInvalidURL() async throws {
        let client: URLSessionHTTPClient = makeClient()
        URLProtocolStub.stub(data: nil, response: nil, error: anyNSError())
        
        let sut: FeedService = FeedService(client: client)

        do {
            // XCTAssertThrowsError is not accepting async code yet
            _ = try await sut.getLastNews()
            XCTFail("Expected fail, but succeeded")
        } catch {
            XCTAssertEqual(anyNSError().localizedDescription, error.localizedDescription)
        }
    }
    
//    func test_getLastNews_successfullyReturnsLastNews_() async throws {
//        let sut: FeedService = FeedService(client: URLSessionHTTPClient(session: URLSession(configuration: .ephemeral)))
//        let result = try await sut.getLastNews()
//        switch result {
//        case let .success(dataResponse):
//            XCTAssertEqual(dataResponse.count, 20)
//
//        case let .failure(error):
//            debugPrint(error.localizedDescription)
//        }
//    }
    
    func test_getLastNews_successfullyReturnsLastNews() async throws {
        let client: URLSessionHTTPClient = makeClient()
        let data: Data = Data(serviceSuccessfulResponse.utf8)
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: successResponse, error: nil)
        
        let sut: FeedService = FeedService(client: client)
        let result = try await sut.getLastNews()
        
        switch result {
        case let .success(dataResponse):
            XCTAssertEqual(dataResponse.count, 20)
            
        default:
            XCTFail("Expected success, got \(result) instead")
        }
    }

    func test_getLastNews_shouldThrowWhenReturningErrorResponse() async throws {
        let client: URLSessionHTTPClient = makeClient()
        let data: Data = Data(serviceErrorResponse.utf8)
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: successResponse, error: nil)
        
        let sut: FeedService = FeedService(client: client)
        
        do {
            // XCTAssertThrowsError is not accepting async code yet
            _ = try await sut.getLastNews()
            XCTFail("Expected fail, but succeeded")
        } catch NewsMapper.Error.failedResponse(let errorMessage) {
            XCTAssertEqual(errorMessage.code, 1)
            XCTAssertEqual(errorMessage.message, "Chave inválida ou faltando!")
        } catch {
            XCTFail("Expected NewsMapper.Error.failedResponse")
        }
    }
    
    // MARK: - lastNewsByType
    func test_getLastNewsByType_successfullyReturnsLastNews() async throws {
        let client: URLSessionHTTPClient = makeClient()
        let data: Data = Data(serviceSuccessfulResponse.utf8)
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: successResponse, error: nil)

        let sut: FeedService = FeedService(client: client)
        let result = try await sut.getLastNewsByType(1)

        switch result {
        case let .success(dataResponse):
            XCTAssertEqual(dataResponse.count, 20)

        default:
            XCTFail("Expected success, got \(result) instead")
        }
    }
    
    func test_getLastNewsByType_shouldThrowWhenReturningErrorResponse() async throws {
        let client: URLSessionHTTPClient = makeClient()
        let data: Data = Data(serviceErrorResponse.utf8)
        let successResponse: HTTPURLResponse = HTTPURLResponse(url: anyURL(), statusCode: 200, httpVersion: nil, headerFields: nil)!
        URLProtocolStub.stub(data: data, response: successResponse, error: nil)

        let sut: FeedService = FeedService(client: client)

        do {
            // XCTAssertThrowsError is not accepting async code yet
            _ = try await sut.getLastNewsByType(1)
            XCTFail("Expected fail, but succeeded")
        } catch NewsMapper.Error.failedResponse(let errorMessage) {
            XCTAssertEqual(errorMessage.code, 1)
            XCTAssertEqual(errorMessage.message, "Chave inválida ou faltando!")
        } catch {
            XCTFail("Expected NewsMapper.Error.failedResponse")
        }
    }
    
    private func makeClient() -> URLSessionHTTPClient {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolStub.self]
        let session = URLSession(configuration: configuration)
        let client: URLSessionHTTPClient = URLSessionHTTPClient(session: session)
        return client
    }
    
}
