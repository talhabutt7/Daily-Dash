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



document.addEventListener("turbo:load", () => {
    document.querySelectorAll("form[data-remote=true]").forEach(form => {
        form.addEventListener("ajax:success", event => {
            const [data, status, xhr] = event.detail;
            const blogPostId = form.action.match(/\/blog_posts\/(\d+)/)[1];
            const blogPostElement = document.querySelector(`#blog_post_${blogPostId}`);
            if (blogPostElement) {
                blogPostElement.innerHTML = xhr.responseText;
            }
        });
    });
});