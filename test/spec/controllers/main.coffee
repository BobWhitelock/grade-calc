'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'gradeCalcApp'

  MainCtrl = {}

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
    MainCtrl = $controller 'MainCtrl', {
      # place here mocked dependencies
    }

  it 'has one grade initially', ->
    expect(MainCtrl.grades.length).toBe 1

  it 'can add a new grade', ->
    MainCtrl.addGrade()
    expect(MainCtrl.grades.length).toBe 2

  it 'can remove a grade', ->
    MainCtrl.grades = testGrades()
    MainCtrl.removeGrade(1)
    expect(MainCtrl.grades).toEqual [
      percentage: 50
      grade: 50
    ,
      percentage: 20
      grade: 40
    ]

  it 'can calculate the overall grade', ->
    MainCtrl.grades = testGrades()
    expect(MainCtrl.overallGrade()).toBe 54

  it 'can switch a grade from a percentage to a mark out of total', ->
    MainCtrl.grades = [
      percentage: 50
      grade: 72
      mark: {}
    ]
    MainCtrl.toMark(0)
    expect(MainCtrl.isMark(0)).toBeTruthy
    expect(MainCtrl.getGrade(0).mark).toEqual {total: null, achieved: null}

  it 'can switch a grade from a mark out of a total to a percentage', ->
    MainCtrl.grades = [
      mark:
        total: 10
        achieved: 6
    ]
    MainCtrl.toPercentage(0)
    expect(MainCtrl.isPercentage(0)).toBeTruthy
    expect(MainCtrl.getGrade(0).grade).toBeNull
