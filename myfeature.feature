Feature: US_001 Entraîner un Pokémon avec un Coach IA

En tant que CoachIA
Je veux pouvoir entraîner un Pokémon
Afin d’améliorer ses caractéristiques automatiquement selon une stratégie définie

Scenario Outline: entraînement simple du Pokémon
Given un CoachIA avec une stratégie <strategie> et un niveau <niveau>
And un Pokémon nommé <nom> avec une force de <force>
When le Coach entraîne le Pokémon
Then <forceAttendue> vaut <force> + 10 points

Examples:
| strategie | niveau | nom      | force | forceAttendue |
| attaque   | 1      | Pikachu  | 50    | 60            |
| vitesse   | 2      | Bulbizarre | 30    | 40            |

Scenario Outline: refus d'entraînement sans Pokémon
Given un CoachIA avec une stratégie <strategie> sans Pokémon assigné
When il tente d’entraîner
Then le système affiche le message <messageErreur>

Examples:
| strategie | messageErreur         |
| attaque   | Aucun Pokémon assigné |


Feature: US_002 Entraînement avancé conditionné par le niveau du CoachIA

En tant que CoachIA expérimenté
Je veux que seuls les CoachIA d’un niveau suffisant puissent entraîner certains Pokémon rares
Afin de préserver un niveau d’entraînement équilibré

Scenario Outline: entraînement refusé si niveau insuffisant
Given un CoachIA de niveau <niveau> avec la stratégie <strategie>
And un Pokémon rare nommé <nom> avec une force initiale de <force>
When le Coach tente d’entraîner ce Pokémon
Then le système bloque l’entraînement avec le message <messageErreur>

Examples:
| niveau | strategie | nom           | force | messageErreur                     |
| 1      | attaque   | Dracaufeu     | 70    | Niveau insuffisant pour ce Pokémon |
| 2      | défense   | Mewtwo        | 80    | Niveau insuffisant pour ce Pokémon |

Scenario Outline: entraînement autorisé si niveau suffisant
Given un CoachIA de niveau <niveau> avec la stratégie <strategie>
And un Pokémon rare nommé <nom> avec une force initiale de <force>
When le Coach entraîne ce Pokémon
Then la <forceAttendue> vaut <force> + 15 points

Examples:
| niveau | strategie | nom       | force | forceAttendue |
| 3      | attaque   | Dracaufeu | 70    | 85            |
| 4      | vitesse   | Mewtwo    | 80    | 95            |
