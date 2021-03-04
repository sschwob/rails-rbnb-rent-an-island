
const zoomIn = () => {
  if (!document.getElementById('big-img')) {
    return;
  };
  const bigImg = document.getElementById('big-img');
  const smallsImg = document.getElementById('show-island-images-small')
  const imgContainer = document.getElementById('show-island-images');
    bigImg.addEventListener('click', (event) => {
      if (event.currentTarget.dataset.state == 0) {
        smallsImg.style.display = "none";
        imgContainer.style.gridTemplateColumns = "1fr";
        event.currentTarget.dataset.state = 1;
      } else {
        smallsImg.style.display = null;
        imgContainer.style.gridTemplateColumns = "1fr 1fr";
        event.currentTarget.dataset.state = 0;
      };
    });
};

export { zoomIn };