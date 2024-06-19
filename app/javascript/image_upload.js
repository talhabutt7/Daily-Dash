// app/javascript/packs/application.js
document.addEventListener("DOMContentLoaded", () => {
    const profileImageInput = document.getElementById('profile_image_input');
    const profileImage = document.getElementById('profile-image');
    const hoverOverlay = document.querySelector('.hover-overlay');

    profileImageInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = (e) => {
                profileImage.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    profileImageInput.parentElement.addEventListener('mouseover', () => {
        hoverOverlay.classList.remove('hidden');
    });

    profileImageInput.parentElement.addEventListener('mouseout', () => {
        hoverOverlay.classList.add('hidden');
    });
});