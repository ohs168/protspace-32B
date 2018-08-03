function image_prev() {
  var $fileList = $('#js-image-preview');
  $fileList
  .on('change.inputFile', '.js-inputFile', function(evt) {
    var $input = $(this),
        $parents = $input.closest('.js-file')
    if(evt.target.files.length) {
      $.each(evt.target.files, function(i, elm) {
        var file = this,
            fileName = file.name,
            reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onloadend = function(evt) {
          var fileReader = this;
          if(fileReader.result) {
            var thumb = '<img src="' + fileReader.result + '"class="img-preview" width="100%" height="100%">';
            $parents.find('.img-preview').remove();
            $parents.find('.js-inputFile').after(thumb);
          }
          return this;
        };
      });
    }
    return this;
  });
};
$(document).ready(image_prev)
$(document).on('page:load', image_prev)
