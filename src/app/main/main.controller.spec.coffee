
'use strict'

describe 'Controller: MainController', ->

  # load the controller's module
  beforeEach module 'gradeCalc'

  MainController = {}

  scope = {}

  testGrades = ->
    [
      percentage: 50
      grade: 50
    ,
      percentage: 30
      grade: 70
    ,
      percentage: 20
      grade: 40
    ]

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainController = $controller 'MainController', {
      # place here mocked dependencies
    }

  it 'has one grade initially', ->
    expect(MainController.grades.length).toBe 1

  it 'can add a new grade', ->
    MainController.addGrade()
    expect(MainController.grades.length).toBe 2

  it 'can remove a grade', ->
    MainController.grades = testGrades()
    MainController.removeGrade(1)
    expect(MainController.grades).toEqual [
      percentage: 50
      grade: 50
    ,
      percentage: 20
      grade: 40
    ]

  it 'can calculate the overall grade', ->
    MainController.grades = testGrades()
    expect(MainController.overallGrade()).toBe 54

  it 'can switch a grade from a percentage to a mark out of total', ->
    MainController.grades = [
      percentage: 50
      grade: 72
      mark: {}
    ]
    MainController.toMark(0)
    expect(MainController.isMark(0)).toBeTruthy
    expect(MainController.getGrade(0).mark).toEqual {total: null, achieved: null}

  it 'can switch a grade from a mark out of a total to a percentage', ->
    MainController.grades = [
      mark:
        total: 10
        achieved: 6
    ]
    MainController.toPercentage(0)
    expect(MainController.isPercentage(0)).toBeTruthy
    expect(MainController.getGrade(0).grade).toBeNull
