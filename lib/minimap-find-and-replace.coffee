MinimapFindAndReplaceBinding = require './minimap-find-and-replace-binding'

module.exports =
  binding: null
  activate: (state) ->
    findPackage = atom.packages.getLoadedPackage('find-and-replace')
    minimapPackage = atom.packages.getLoadedPackage('minimap')

    return @deactivate() unless findPackage? and minimapPackage?

    minimap = require(minimapPackage.path)
    return @deactivate() unless minimap.versionMatch('3.x')

    @binding = new MinimapFindAndReplaceBinding findPackage, minimapPackage

  deactivate: ->
    @binding?.deactivate()
    @minimapPackage = null
    @findPackage = null
    @binding = null
