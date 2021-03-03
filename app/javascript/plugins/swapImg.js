const swapImg = () => {
  const bigImg = document.getElementById('big-img');
  const imgsSmall = document.querySelectorAll('.small-img')
  imgsSmall.forEach((img) => {
    img.addEventListener('click', (event) => {
      const imgBig = bigImg.firstElementChild.src;
      const imgSmall = event.currentTarget.firstElementChild.src;
      bigImg.firstElementChild.src = imgSmall;
      event.currentTarget.firstElementChild.src = imgBig;
    });
  });
};

export { swapImg };
