document.addEventListener('DOMContentLoaded', function() {
  var checkboxes = document.getElementsByClassName('task-checkbox');

  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener('change', function() {
      var taskId = this.id.replace('checkbox-', '');
      var titleElement = document.getElementById('task-title-' + taskId);

      if (this.checked) {
        titleElement.style.textDecoration = 'line-through';
      } else {
        titleElement.style.textDecoration = 'none';
      }
    });
  }
});
