class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game-button">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game-button': -> @newGame()

  initialize: ->
    @model.get('playerHand').on 'stand', ->
      @disableControls()
      @model.get('dealerHand').dealerPlay()
    , @

    @model.get('dealerHand').on 'declareWinner', @showResult, @
    @model.get('playerHand').on 'declareWinner', @showResult, @

    @render()

  newGame: ->
    @model.initialize()
    @initialize()
    @$el.find('.hit-button').attr('disabled', false)
    @$el.find('.stand-button').attr('disabled', false)
    @render()

  showResult: ->
    alert @model.get('declareWinner')()
    @disableControls()

  disableControls: ->
    @$el.find('.hit-button').attr('disabled', true)
    @$el.find('.stand-button').attr('disabled', true)



  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

