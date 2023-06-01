//
//  ApiResponses.swift
//  SportsAllTheTimeTests
//
//  Created by Essam Elden Mohamed on 01/06/2023.
//

import Foundation
class ApiResponses{
    static let mokeLeagueResponse = """
        {
            "success": 1,
            "result": [
            {
                "league_key": 207,
                "league_name": "Serie A",
                "country_key": 5,
                "country_name": "Italy",
                "league_logo": "https:apiv2.allsportsapi.comlogologo_leagues207_serie-a.png",
                "country_logo": "https:apiv2.allsportsapi.comlogologo_country5_italy.png"
            }
            ]
        }
    """
    static let mokeUpComingEventsResponse = """
        {
            "success": 1,
            "result": [
            {
                "event_key": 1059618,
                "event_date": "2023-05-28",
                "event_time": "17:30",
                "event_home_team": "Arsenal",
                "home_team_key": 141,
                "event_away_team": "Wolves",
                "away_team_key": 3077,
                "event_halftime_result": "",
                "event_final_result": "-",
                "event_ft_result": "",
                "event_penalty_result": "",
                "event_status": "",
                "country_name": "England",
                "league_name": "Premier League",
                "league_key": 152,
                "league_round": "Round 38",
                "league_season": "20222023",
                "event_live": "0",
                "event_stadium": "Emirates Stadium, London",
                "event_referee": "Andre Marriner, England",
                "home_team_logo": "https:apiv2.allsportsapi.comlogo141_arsenal.jpg",
                "away_team_logo": "https:apiv2.allsportsapi.comlogo3077_wolverhampton-wanderers.jpg",
                "event_country_key": 44,
                "league_logo": "https:apiv2.allsportsapi.comlogologo_leagues152_premier-league.png",
                "country_logo": "https:apiv2.allsportsapi.comlogologo_country44_england.png",
                "event_home_formation": "",
                "event_away_formation": "",
                "fk_stage_key": 6,
                "stage_name": "Current",
                "league_group": null,
                  }
            ]
        }
    """
    static let mokeTeams = """
{
  "success": 1,
  "result": [
    {
      "team_key": 80,
      "team_name": "Manchester City",
      "team_logo": "https:",
      "players": [
        {
          "player_key": 1226924072,
          "player_name": "S. Ortega",
          "player_number": "18",
          "player_country": null,
          "player_type": "Goalkeepers",
          "player_age": "30",
          "player_match_played": "2",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0",
          "player_image": "https33_s-ortega.jpg"
        }
      ],
      "coaches": [
        {
          "coach_name": "Pep Guardiola",
          "coach_country": null,
          "coach_age": null
        }
      ]
    }
  ]
}
"""
}
