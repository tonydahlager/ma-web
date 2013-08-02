@VarkekAdmin = do (Backbone, Marionette) ->

  AppAdmin = new Marionette.Application
   
  AppAdmin.on 'initialize:before', (options) ->
    console.log 'initialize:before'
    
  AppAdmin.addRegions
    regionHeader: '#region-header'
    regionFoot:   '#region-footer'
    regionMain:   '#region-main'
    
  
  AppAdmin.addInitializer ->
    console.log 'addInitializer'
    # App.module("HeaderApp").start()
    # App.module("FooterApp").start()
  
  AppAdmin.on 'initialize:after', (options) ->
    if Backbone.history
      Backbone.history.start()
      # AppAdmin.trigger('topics:list')
  
  AppAdmin
  
    
