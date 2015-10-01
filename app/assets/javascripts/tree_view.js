$(function() {
  // var selectorForCheckboxes = 'li.has-children input ~ label + label.check + input[type="checkbox"]';
  // var selectorForCheckboxes = 'input ~ label input[type="checkbox"]';
  var selectorForCheckboxes = 'input[type="checkbox"].treeish';

  var treeViewCheckBoxes = {

    init: function() {
      // Creates an 'onchange' event callback to checkSiblings()
      $(selectorForCheckboxes).change(function(e) {
        var checkState = $(this).prop("checked"),
            container = $(this).parent(),
            siblings = container.siblings();

        container.find(selectorForCheckboxes).prop({
          indeterminate: false,
          checked: checkState
        });

        checkSiblings(container);

        // checkSiblings will look at the relatives of el and check them
        // accordingly
        function checkSiblings(el) {
          var parent = el.parent().parent(),
              allSiblingsAreSameStateAsTarget = true;

          // is parent catching a good parent??
          debugger;
          // check if all the siblings of target element are checked
          el.siblings().each(function() {
            // var allSiblings = $(this).children(selectorForCheckboxes);
            var allSiblings = $(this).find("label label.check input.treeish");

            // is allSiglings catching input boxes?
            debugger;
            allSiblingsAreSameStateAsTarget = (allSiblings.prop("checked") === checkState);
            return allSiblingsAreSameStateAsTarget;
          });

          // if target and all of it's siblings are checked
          if (allSiblingsAreSameStateAsTarget && checkState) {
            // go to the parent checkbox, and ensure it's not indeterminate, and also checked
            parent.children(selectorForCheckboxes).prop({
              indeterminate: false,
              checked: checkState
            });

            // perform same check on the parent tier
            checkSiblings(parent);  // RECURSION

          }
          // if target and all of it's siblings are unchecked
          else if (allSiblingsAreSameStateAsTarget && !checkState) {
            // set the parent checkbox to unchecked and indeterminate
            parent.children(selectorForCheckboxes).prop("checked", checkState);
            parent.children(selectorForCheckboxes).prop("indeterminate", (parent.find(selectorForCheckboxes + ':checked').length > 0));

            checkSiblings(parent);  // RECURSION
          }
          //
          else { // a child node is unselected and thus mark all parent nodes indeterminate
            console.log('hit');
            // debugger;
            // el.parents("li")
            // el.parents("li").children('label').children().children('input.treeish')
            //
            el.parents("li").children('label').children().children('input.treeish').prop({
              indeterminate: true,
              checked: false
            });
          }
        }


      });
    }

  };

  window.treeViewCheckBoxes = treeViewCheckBoxes;
});
