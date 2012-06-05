require('lib/setup')

Spine = require('spine')
Example = require('models/example')

class App extends Spine.Controller
  constructor: ->
    super

    @routes
      '/': ->
        @render
    Spine.Route.setup()

    Example.bind 'refresh change', @render

    localStorage = [ id: 'c-1', name: 'blue' ]
    newItems = Example.refresh localStorage
    for item in newItems
      item.save()

    $('button').click @create

  render: =>
    @items = Example.all()
    @html require('views/example')(@items)

  create: ->
    Example.create name: 'green'

module.exports = App
    