'use strict'

###*
 # @ngdoc function
 # @name gradeCalcApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the gradeCalcApp
###
angular.module 'gradeCalcApp'
  .controller 'MainCtrl', ->
    @grades = []

    @addGrade = ->
      @grades.push
        percentage: null
        grade: null
        description: null

    # Add one row initially.
    @addGrade()

    @removeGrade = (position) ->
      _.pullAt(@grades, position)


    @overallGrade = ->
      _.sum _.map @grades, (grade) -> (grade.percentage / 100) * grade.grade


    return
