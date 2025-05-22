from behave import given, when, then
from coach_ia import CoachIA
from pokemon import Pokemon

@given('un CoachIA avec une stratégie {strategie} et un niveau {niveau}')
def initialiser_coach_avec_niveau(context, strategie, niveau):
    context.coach = CoachIA(strategie, int(niveau))

@given('un Pokémon nommé {nom} avec une force de {force}')
def ajouter_pokemon_au_coach(context, nom, force):
    context.pokemon = Pokemon(nom, int(force))
    context.force_initiale = int(force)
    context.coach.assigner_pokemon(context.pokemon)

@when('le Coach entraîne le Pokémon')
def entrainer_le_pokemon(context):
    context.coach.entrainer_pokemon()

@then('la force du Pokémon doit être {forceAttendue}')
def verifier_force_du_pokemon(context, forceAttendue):
    assert context.pokemon.force == int(forceAttendue)

@given('un CoachIA avec une stratégie {strategie} sans Pokémon assigné')
def initialiser_coach_sans_pokemon(context, strategie):
    context.coach = CoachIA(strategie, 1) 

@when("il tente d’entraîner")
def tentative_entrainement_sans_pokemon(context):
    context.message = context.coach.entrainer_pokemon()

@then('le système affiche le message {messageErreur}')
def verifier_message_erreur(context, messageErreur):
    assert context.message == messageErreur



