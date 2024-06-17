document.addEventListener("turbo:load", function() {
    const scheduleCheckbox = document.getElementById("schedule_checkbox");
    const datetimeSelectContainer = document.getElementById("datetime_select_container");
    const publishedAtInput = document.querySelector("select#blog_post_published_at_1i");

    function toggleDatetimeSelect() {
        if (scheduleCheckbox.checked) {
            datetimeSelectContainer.style.display = "block";
        } else {
            datetimeSelectContainer.style.display = "none";
            publishedAtInput.value = ""; // Clear datetime select inputs
        }
    }

    if (scheduleCheckbox) {
        toggleDatetimeSelect();
        scheduleCheckbox.addEventListener("change", toggleDatetimeSelect);
    }
});