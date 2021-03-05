const userBookingsSearch = () => {
  if (!document.getElementById('user-bookings-state')) {
    return;
  };
  const userBookingsState = document.getElementById('user-bookings-state');
  const allUserBookings = document.querySelectorAll('.user-booking');
  userBookingsState.onchange = () => {
    allUserBookings.forEach(booking => booking.style.display = null);
    const search = userBookingsState.value;
    if (!(search == "all")) {
      allUserBookings.forEach((booking) => {
        if (!(search == booking.dataset.state)) {
          booking.style.display = "none";
        }
      });
    };
  };
};

const islandBookingsSearch = () => {
  if (!document.getElementById('island-bookings-state')) {
    return;
  };
  const islandBookingsState = document.getElementById('island-bookings-state');
  const allIslandBookings = document.querySelectorAll('.island-booking');
  islandBookingsState.onchange = () => {
    allIslandBookings.forEach(booking => booking.style.display = null);
    const search = islandBookingsState.value;
    if (!(search == "all")) {
      allIslandBookings.forEach((booking) => {
        if (!(search == booking.dataset.state)) {
          booking.style.display = "none";
        }
      });
    };
  };
};

const islandNameSearch = () => {
  if (!document.getElementById('island-selector')) {
    return;
  };
  const islandName = document.getElementById('island-selector');
  const allIslandName = document.querySelectorAll('.island-name');
  islandName.onchange = () => {
    allIslandName.forEach(island => island.style.display = null);
    const search = islandName.value.toLowerCase();
    if (!(search == "all")) {
      allIslandName.forEach((island) => {
        if (!(search == island.dataset.name)) {
          island.style.display = "none";
        }
      });
    };
  };
};

export { userBookingsSearch, islandBookingsSearch, islandNameSearch };