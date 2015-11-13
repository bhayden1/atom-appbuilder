Appbuilder = require '../lib/appbuilder'


# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Appbuilder", ->
  [workspaceElement, activationPromise, BufferedProcess] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    BufferedProcess = jasmine.createSpy()
    activationPromise = atom.packages.activatePackage('appbuilder')
    spyOn(Appbuilder, 'commandDelegate')

  describe "when the appbuilder:simulate event is triggered", ->
    it "runs the appbuilder simulater from the command line", ->
      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.commands.dispatch workspaceElement, 'appbuilder:simulate'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(Appbuilder.commandDelegate).toHaveBeenCalledWith('appbuilder', ['simulate'])    
