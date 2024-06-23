
// JavaScript for uploading profile image
document.getElementById("user_avatar").addEventListener("change", function () {
    const reader = new FileReader();
    reader.onload = function (e) {
        document.getElementById("profile-image").src = e.target.result;
    };
    reader.readAsDataURL(this.files[0]);
});
