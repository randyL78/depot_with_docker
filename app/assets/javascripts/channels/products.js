(function() {
  App.products = App.cable.subscriptions.create("ProductsChannel", {
    connected: function() {},
    // Called when the subscription is ready for use on the server
    disconnected: function() {},
    // Called when the subscription has been terminated by the server
    received: function(data) {
      return document.getElementsByTagName("main")[0].innerHTML = data.html;
    }
  });

}).call(this);


//# sourceMappingURL=products.js.map
//# sourceURL=coffeescript