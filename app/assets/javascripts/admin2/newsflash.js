$(function() {
    // Get the modal
    var modal = document.getElementById("newsflash-hero-picker-modal");

    // Get the button that opens the modal
    var launcherButton = document.getElementById("hero-image-picker-launcher");

    // Get the <span> element that closes the modal
    var closeSpan = document.getElementsByClassName("close-modal")[0];

    // When the user clicks on the button, open the modal
    launcherButton.onclick = function(event) {
        event.preventDefault();
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    closeSpan.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // The Done button should call the action as ajax,
    // on success: close the modal and set the image ID in the main form along with filename and image thumbnail
    // on failure: show an error
    // This does not work because files cannot be posted through ajax calls. Need to do something with jq.fileupload
    var doneButtonExecuter = function() {
        $.ajax({
            type:'POST',
            url: '/en/admin/emails/newsflash/create_hero_image',

        });
    }
});


