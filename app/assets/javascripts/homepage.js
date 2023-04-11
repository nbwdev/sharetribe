$(function() {
  // Selectors
  var showFiltersButtonSelector = "#home-toolbar-show-filters";
  var filtersContainerSelector = "#home-toolbar-filters";

  // Elements
  var $showFiltersButton = $(showFiltersButtonSelector);
  var $filtersContainer = $(filtersContainerSelector);

  $showFiltersButton.click(function() {
    $showFiltersButton.toggleClass("selected");
    $filtersContainer.toggleClass("home-toolbar-filters-mobile-hidden");

    if ($showFiltersButton.hasClass("selected")) {
      $showFiltersButton.text("Hide filters");
    } else {
      $showFiltersButton.text("Filter");
    }
  });

  // Relocate filters
  if ($("#filters").length && $("#desktop-filters").length) {
    relocate(768, $("#filters"), $("#desktop-filters").get(0));
  }

  relocate(768, $("#header-menu-mobile-anchor"), $("#header-menu-desktop-anchor").get(0));
  relocate(768, $("#header-user-mobile-anchor"), $("#header-user-desktop-anchor").get(0));

  // Add callbacks for when the filters are relocated so only one set is enabled at a time
  var enableTabletFilters = function() {
    // enable the original tablet filters, disable the popout ones
    $("#filters :input").attr("disabled", false);
    $("#filters-horizontal :input").attr("disabled", true);
  }

  var enableDesktopFilters = function() {
    $("#desktop-filters :input").attr("disabled", true);
    $("#filters-horizontal :input").attr("disabled", false);
  }

  minwidth(768, enableDesktopFilters, enableTabletFilters);
});
