$ = require('jquery')

class MainMenu
  activate: ->
    template = [
      label: 'File'
      submenu: [
        label: 'New Window'
        accelerator: 'Ctrl+Shift+N'
        action: 'Core: New Window'
      ,
        label: 'Close Window'
        accelerator: 'Ctrl+Shift+W'
        action: 'Core: Close Window'
      ,
        type: 'separator'
      ,
        label: 'Quit'
        accelerator: 'Ctrl+Q'
        action: 'Core: Quit'
      ]
    ,
      label: 'Session'
      submenu: [
        label: 'New Session'
        accelerator: 'Ctrl+N'
        action: 'Core: New Session'
      ,
        type: 'separator'
      ,
        label: 'Start'
        action: 'Core: Start Sessions'
      ,
        label: 'Stop'
        action: 'Core: Stop Sessions'
      ]
    ,
      label: 'Theme'
    ,
      label: 'Developer'
      submenu: [
        label: 'Toggle DevTools'
        accelerator: 'Ctrl+Shift+I'
        action: 'Core: Toggle DevTools'
      ]
    ]

    for t in template
      dripcap.menu.add [], t

    dripcap.menu.get(['Session', 'Start']).enabled = false
    dripcap.menu.get(['Session', 'Stop']).enabled = false

    selectedScheme = 'default'
    dripcap.theme.sub 'updateRegistory', ->
      dripcap.menu.remove(['Theme'])
      for k, v of dripcap.theme.registory
        do (k = k, v = v) ->
          dripcap.menu.add ['Theme'],
            label: v.name
            type: 'radio'
            checked: selectedScheme == k
            click: ->
              selectedScheme = k
              dripcap.theme.scheme = v

  deactivate: ->

module.exports = MainMenu