
    document.addEventListener("DOMContentLoaded", function () {
    let currentIndex = 0;
    const images = document.querySelectorAll('.dcard-image');
    const counter = document.getElementById('imageCounter');

    function updateSlider(index) {
    images.forEach((img, i) => {
    img.classList.toggle('active', i === index);
});
    if (counter) {
    counter.textContent = (index + 1) + " / " + images.length;
}
}

    window.prevImage = function () {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    updateSlider(currentIndex);
};

    window.nextImage = function () {
    currentIndex = (currentIndex + 1) % images.length;
    updateSlider(currentIndex);
};

    updateSlider(currentIndex);
});
