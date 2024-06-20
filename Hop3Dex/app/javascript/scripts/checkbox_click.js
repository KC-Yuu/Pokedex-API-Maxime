document.addEventListener('DOMContentLoaded', function() {
  function stopPropagationForCheckboxes() {
    document.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {
      checkbox.addEventListener('click', function(event) {
        event.stopPropagation();
      });
    });
  }

  stopPropagationForCheckboxes();

  document.addEventListener('ajaxComplete', stopPropagationForCheckboxes);
});
