root = exports ? this

root.lists = new Meteor.Collection 'Lists'

if Meteor.isClient
  #Template.hello.greeting = ->
    #'my list.'

  #Template.hello.events
    #'click input': ->
      ## template data, if any, is available in 'this'
      #console?.log 'You pressed the button'

  Template.categories.lists = ->
    lists.find {},
      sort:
        Category: 1
  #We are declaring the 'adding_category' flag
  Session.set('adding_category', false)

  #This returns true if adding_category has been assigned a value of true
  Template.categories.new_cat = ->
    Session.equals('adding_category',true)

  Template.categories.events
    'click #btnNewCat': (e, t) ->
      Session.set('adding_category', true)
      Meteor.flush()
      t.find('#add-category').focus()
      #focusText(t.find("#add-category"))

  #Generic Helper Functions
  focusText = (i) ->
    i.focus()
    i.select()

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
