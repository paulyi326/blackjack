class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="winner"><%= winner %></div>
  '



  events:
    "click .hit-button": ->
      @model.get('playerHand').hit()
    "click .stand-button": ->
      @model.get('playerHand').stand()

  initialize: ->
    @a = 'hey'
    @model.on 'winner', (winner) =>
      @render()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template(@model.attributes)
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
