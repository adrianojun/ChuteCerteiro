import Foundation

struct Football: Decodable {
    let countryId: String
    let countryName: String
    let leagueId: String
    let leagueName: String
    let temporadaLiga: String
    let leagueLogo: String
    let countryLogo: String

    enum CodingKeys: String, CodingKey {
        case countryId = "country_id"
        case countryName = "country_name"
        case leagueId = "league_id"
        case leagueName = "league_name"
        case temporadaLiga = "temporada_liga"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}



