{CompositeDisposable} = require 'atom'
{BufferedProcess} = require 'atom'
module.exports =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'appbuilder:simulate': => @simulate()

  deactivate: ->
    @subscriptions.dispose()

  simulate: ->
    command ='appbuilder'
    args = ['simulate']
    @commandDelegate(command, args);

  commandDelegate: (command, args) ->
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log(code)
    stderr = (error) -> console.log(error);
    process = new BufferedProcess({command, args, stdout, exit, stderr})
