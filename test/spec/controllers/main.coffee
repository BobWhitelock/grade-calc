'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'gradeCalcApp'

  MainCtrl = {}

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      # place here mocked dependencies
    }

  it 'has one grade initially', ->
    expect(MainCtrl.grades.length).toBe 1

  it 'can add a new grade', ->
    MainCtrl.addGrade()
    expect(MainCtrl.grades.length).toBe 2

  it 'has new grades have three properties', ->
    MainCtrl.addGrade()
    expect((_.keys _.last MainCtrl.grades).sort())
    .toEqual ['description', 'grade', 'percentage']

  it 'has new grades empty', ->
    MainCtrl.addGrade()
    expect(_.values _.last MainCtrl.grades)
    .toEqual [null, null, null]

  it 'can calculate the overall grade', ->
    MainCtrl.grades = [
      percentage: 50
      grade: 50
    ,
      percentage: 30
      grade: 70
    ,
      percentage: 20
      grade: 40
    ]
    expect(MainCtrl.overallGrade()).toBe 54
