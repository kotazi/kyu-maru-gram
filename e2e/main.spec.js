'use strict';

describe('The main view', function () {
  var page;

  beforeEach(function () {
    browser.get('http://localhost:3000/index.html?proctor=true');
    page = require('./main.po');
  });

  it('should include jumbotron with correct data', function() {
    expect(page.h1El.getText()).toBe('きゅ〜まるグラム！');
    expect(page.imgEl.getAttribute('src')).toMatch(/assets\/images\/90.jpg$/);
    expect(page.imgEl.getAttribute('alt')).toBe('I\'m Yeoman');
  });

});
