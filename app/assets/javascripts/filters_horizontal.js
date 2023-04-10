$(function() {

  var filterButtons = [];
  var filterPopouts = [];

  // Get the menu that a button activates
  var getTargetPopoutId = function(element) {
    return element.getAttribute('aria-controls');
  };

  var getTargetPopout = function(element) {
    var id = getTargetPopoutId(element);
    return document.querySelectorAll('#'+id)[0];
  };

  // Close a menu
  function closePopout(button) {
    var symbol = button.getElementsByClassName("expand-symbol")[0];
    var targetPopout = getTargetPopout(button);
    targetPopout.classList.add("hidden");
    button.classList.remove("expanded");
    symbol.textContent = "▶";
  }

  // Open a menu
  function openPopout(button) {
    var symbol = button.getElementsByClassName("expand-symbol")[0];
    var targetPopout = getTargetPopout(button);
    targetPopout.classList.remove("hidden");
    button.classList.add("expanded");
    symbol.textContent = "✕";
  }

  // Hide all the popout menus
  function closeAllPopouts() {
    filterButtons.forEach(function(filterButton) {
      closePopout(filterButton);
    });
  }


  // Setup
  var filterButtonsSelector = ".filter-button";

  var filterButtonsList = document.querySelectorAll(filterButtonsSelector);
  var filterButtonsArray = [...filterButtonsList];
  filterButtons = filterButtonsArray;

  filterButtonsArray.forEach(filterButton => {

    filterButton.onclick = function(event) {

      var expanded = this.classList.contains("expanded");
      var symbol = this.getElementsByClassName("expand-symbol")[0];

      closeAllPopouts();

      if (expanded) {
        // hide the menu
        closePopout(this);
      } else {
        // show the menu
        openPopout(this);
      }

      event.stopPropagation();
    }

    // Don't propagate the click when using a menu or the document onclick will close the menu
    var popout = getTargetPopout(filterButton);
    popout.onclick = function(event) {
      event.stopPropagation();
    }
  });


  // Close all the dropdowns when clicking outside dropdown area
  $(document).click( function(){
    closeAllPopouts();
  });
  
});
