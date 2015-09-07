assert = chai.assert

describe 'AppView', ->
  appView = null

  beforeEach ->
    appView = new AppView(model: new App())


  describe 'Controls', ->
    describe 'Hit button', ->

    describe 'Stand button', ->
      it 'should disable player controls when player stands', ->
        # trigger click event on stand button
        appView.$el.find('.stand-button').click();
        # check to see if the buttons are disabled
        assert.strictEqual appView.$el.find('.hit-button').attr('disabled'), 'disabled'
        assert.strictEqual appView.$el.find('.stand-button').attr('disabled'), 'disabled'

    describe 'New game button', ->


    describe 'End of game', ->
      it 'should disable player controls when winner is declared', ->
        # trigger 'declareWinner' event
        appView.$el.find('.stand-button').click();
        # check to see if the buttons are disabled
        assert.strictEqual appView.$el.find('.hit-button').attr('disabled'), 'disabled'
        assert.strictEqual appView.$el.find('.stand-button').attr('disabled'), 'disabled'