# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'declareWinner', @declareWinner

  declareWinner: =>
    playerScore = @get('playerHand').score()
    dealerScore = @get('dealerHand').score()
    result = if playerScore > dealerScore
      'WIN'
    else if playerScore < dealerScore
      'LOSE'
    else
      'PUSH'

