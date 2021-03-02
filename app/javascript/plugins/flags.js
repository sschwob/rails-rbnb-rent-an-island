const searchFlagImg = () => {
  const countries = document.querySelectorAll('.country');

  countries.forEach((country) => {
    const countryName = country.innerText
    fetch(`https://www.countryflags.io/${countryName}/shiny/32.png`)
      .then((data) => {
        country.firstElementChild.insertAdjacentHTML('afterbegin', `<img src="${data.url}">`);
      });
  });
};

export { searchFlagImg };