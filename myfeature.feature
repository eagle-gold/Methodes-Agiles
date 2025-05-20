Feature: US_001 Entraîner un Pokémon avec un Coach IA

En tant que CoachIA
Je veux pouvoir entraîner un Pokémon
Afin d’améliorer ses caractéristiques automatiquement selon une stratégie définie

Scenario Outline: entraînement simple du Pokémon
Given un CoachIA avec une stratégie <strategie> et un niveau <niveau>
And un Pokémon nommé <nom> avec une force de <force>
When le Coach entraîne le Pokémon
Then la force du Pokémon est augmentée de 10 points

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
