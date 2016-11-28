describe("sliding timeslider", function() {
  it("should make an AJAX request to the correct URL", function() {
    var doneCallback = {
      done: function() {}
    };
    var failCallback = {
      fail: function() {}
    };
    spyOn($, "ajax").and.returnValue(doneCallback);
    spyOn(doneCallback, 'done').and.returnValue(failCallback);
    request_for_metrics(-1);
    expect($.ajax.calls.mostRecent().args[0]["url"]).toEqual("projects/metrics_on_date");
  });
});