'use strict';

describe('The main view', function () {
  var page;

  beforeEach(function () {
    browser.get('/');
    page = require('./main.po');
  });

  it('should be able to add a new grade', function() {
    expect(page.gradeRows.count()).toBe(1);
    page.addGradeButton.click();
    expect(page.gradeRows.count()).toBe(2);
  });

  it('should be able to delete a grade', function() {
    expect(page.gradeRows.count()).toBe(1);
    page.initialGrade.element(by.css('.delete-grade-button')).click();
    expect(page.gradeRows.count()).toBe(0);
  });

});
