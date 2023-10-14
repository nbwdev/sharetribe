$(function () {
    // Get the modal
    var modal = document.getElementById("newsflash-hero-picker-modal");

    // Get the button that opens the modal
    var launcherButton = document.getElementById("hero-image-picker-launcher");

    // Get the <span> element that closes the modal
    var closeSpan = document.getElementsByClassName("close-modal")[0];

    // When the user clicks on the button, open the modal
    launcherButton.onclick = function (event) {
        event.preventDefault();
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    closeSpan.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    // Attach fileuploader to the file input field
    // and on its done method update the filename in the help text
    var uploadInput =
        $('#newsflash_hero_image_hero_image')

    uploadInput.fileupload({
        dataType: 'json',
        paramName: "newsflash_hero_image[hero_image]",
        url: "/en/admin/emails/newsflash/create_hero_image",
        done: function (e, data) {
            var filename = data.result.image_file_name;
            var fileId = data.result.id;

            // update the filename in the modal in case it is reopened
            var fileStatusSpan = $("#hero-image-upload-status");
            fileStatusSpan.text("Uploaded: " + filename + ". To upload another file, hit 'Choose File' again and pick another 800x533 file");

            // update the file ID and file info in the main page
            var fileIdField = $("#hero-image-id");
            var filenameText = $("#hero-image-picker-launcher");
            fileIdField.val(fileId);
            filenameText.text("You uploaded " + filename + ". Click here to choose a different image.");

            var modal = document.getElementById("newsflash-hero-picker-modal");
            modal.style.display = "none";
        }
    });

    // Hijack the "send test email" button to send an ajax email
    // Disable & replace by a loading icon
    // Show a success message and reenable with the original text
    var sendTestEmailButton = document.getElementById("send-test-email");

    // When the user clicks on the button, open the modal
    sendTestEmailButton.onclick = function (event) {
        console.log("Clicked the send test email button");
        event.preventDefault();
        var form = $('#newsflash_form');
        var test_email = $('#test_email');
        test_email.val('1');

        var url = $(this).attr('href');

        var data = $(this);
        $.ajax({
            type: data.attr('method'),
            url: data.attr('action'),
            data: data.serialize(),
            success: function (data) {
                console.log("Sent a test email");
                $('#send-test-email').text('Sent a test email');
            }
        });



        // form.submit();
        //
        // form.ajaxForm({
        //     dataType: 'json',
        //     beforeSubmit: function() {
        //         console.log("beforeSubmit");
        //         return true;
        //         //   $(form_id).validate({
        //         //     rules: rules
        //         //   });
        //         //   if ($(form_id).valid() == true) {
        //         //     disable_submit_button(form_id, locale);
        //         //   }
        //         //   return $(form_id).valid();
        //     },
        //     success: function(data, textStatus, jqXHR, form) {
        //         console.log("Sent a test email");
        //         $('#send-test-email').text('Sent a test email');
        //     }
        //   });

        // This turns the submit button into an ajax call which is good but not what I want
        form.submit(function (event) {
            event.preventDefault();
            var data = $(this);
            $.ajax({
                type: data.attr('method'),
                url: data.attr('action'),
                data: data.serialize(),
                success: function (data) {
                    console.log("Sent a test email");
                    $('#send-test-email').text('Sent a test email');
                }
            });
            
          });

        return false;
    }
});
