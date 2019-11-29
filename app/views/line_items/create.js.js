(function() {
  var cart, notice;

  cart = document.getElementById("cart");

  cart.innerHTML = "<%= j render(@cart) %>";

  notice = document.getElementById("notice");

  if (notice) {
    notice.style.display = "none";
  }

}).call(this);


//# sourceMappingURL=create.js.js.map
//# sourceURL=coffeescript