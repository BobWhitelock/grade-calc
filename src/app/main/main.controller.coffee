
angular.module "gradeCalc"
  .controller "MainController", () ->
    @grades = []

    @addGrade = ->
      @grades.push
        percentage: null
        grade: null
        description: null
        mark:
          total: null
          achieved: null
        asPercentage: true

    # Add one row initially.
    @addGrade()

    @removeGrade = (position) ->
      _.pullAt(@grades, position)

    @getGrade = (position) ->
      @grades[position]

    @overallGrade = ->
      _.sum _.map @grades, (grade) -> (grade.percentage / 100) * grade.grade

    @isPercentage = (position) ->
      @getGrade(position).asPercentage

    @isMark = (position) ->
      !@isPercentage(position)

    @toMark = (position) ->
      grade = @getGrade(position)
      grade.asPercentage = false
      grade.mark.total = grade.mark.achieved = null

    @toPercentage = (position) ->
      grade = @getGrade(position)
      grade.asPercentage = true
      grade.grade = null


    return
