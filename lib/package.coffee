PackageView = require './package-view'
{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: (state) ->
    #@packageView = new PackageView(state.packageViewState)
    #@modalPanel = atom.workspace.addModalPanel(item: @packageView.getElement(), visible: false)
    console.log('activating appbuilder')
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'appbuilder:simulate': => @simulate()

  deactivate: ->
    @subscriptions.dispose()

  simulate: ->
    debugger;
    console.log 'simulate!'
    div = document.createElement('div')
    div.textContent = 'Hello world!'
    atom.workspace.addBottomPanel({item: div})
