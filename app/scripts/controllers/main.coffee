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
        weighting: null
        grade: null
        description: null

    # Add one row initially.
    @addGrade()

    @overallGrade = ->
      _.sum _.map @grades, (grade) -> (grade.weighting / 100) * grade.grade


    return
