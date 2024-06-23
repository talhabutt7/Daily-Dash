document.addEventListener("turbo:load", function() {
    // Get reference to the schedule checkbox element
    const scheduleCheckbox = document.getElementById("schedule_checkbox");
    // Get reference to the container for datetime selection
    const datetimeSelectContainer = document.getElementById("datetime_select_container");
    // Get reference to the select input for publishing datetime
    const publishedAtInput = document.querySelector("select#blog_post_published_at_1i");

    // Function to toggle display of datetime selection based on checkbox state
    function toggleDatetimeSelect() {
        if (scheduleCheckbox.checked) {
            // If checkbox is checked, display datetime selection container
            datetimeSelectContainer.style.display = "block";
        } else {
            // If checkbox is not checked, hide datetime selection container
            datetimeSelectContainer.style.display = "none";
            // Clear datetime select inputs when hiding
            publishedAtInput.value = "";
        }
    }

    // Initial call to toggleDatetimeSelect function
    // Ensures correct initial state based on checkbox state on page load
    if (scheduleCheckbox) {
        toggleDatetimeSelect();
        // Event listener for change event on scheduleCheckbox
        scheduleCheckbox.addEventListener("change", toggleDatetimeSelect);
    }
});

// Event listener for turbo:load event, fires when Turbo (Turbo Drive) loads a new page
document.addEventListener("turbo:load", () => {
    // Select all forms with data-remote=true attribute
    document.querySelectorAll("form[data-remote=true]").forEach(form => {
        // Event listener for ajax:success event on each form
        form.addEventListener("ajax:success", event => {
            // Retrieve data from ajax:success event
            const [data, status, xhr] = event.detail;
            // Extract blog post ID from form's action attribute using regex
            const blogPostId = form.action.match(/\/blog_posts\/(\d+)/)[1];
            // Find the blog post element in the DOM using the extracted ID
            const blogPostElement = document.querySelector(`#blog_post_${blogPostId}`);
            // If blog post element is found in the DOM
            if (blogPostElement) {
                // Replace inner HTML of blog post element with response from server
                blogPostElement.innerHTML = xhr.responseText;
            }
        });
    });
});
