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
    @grades = [
      weighting: 0.4
      grade: 40
      description: 'a grade'
    ,
      weighting: 0.6
      grade: 60
      description: 'a grade'
    ]

    @addGrade = ->
      @grades.push
        weighting: null
        grade: null
        description: null

    @overallGrade = ->
      (_.sum _.map @grades, (grade) -> grade.weighting * grade.grade).toFixed 1


    return
