class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    dealtCard = @deck.pop()
    @add(dealtCard)
    @trigger 'declareWinner', @ if @minScore() > 21
    console.log 'score:', @score()
    dealtCard

  stand: ->
    @trigger 'stand', @

  newGame: ->
    @trigger 'newGame', @

  dealerPlay: ->
    @first().flip()
    @hit() while @score() < 17
    @trigger 'declareWinner', @ if @score() < 22
    console.log 'test'

  numAces: -> @reduce (count, card) ->
    if card.get('value') is 1 then count + 1 else count
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  score: ->
    for num in [@numAces()..0]
      if (bestScore = @minScore() + 10 * num) < 21
        break
    bestScore


