// app/assets/javascripts/search.js

export function performSearch() {
  document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search-query');
    const searchResults = document.getElementById('search-results');

    searchInput.addEventListener('input', function () {
      const query = searchInput.value;

      if (query.length >= 3) {
        searchResults.innerHTML = ''; // Clear previous results

        fetch('/search?query=' + query)
          .then((response) => response.json())
          .then((users) => {
            users.forEach((user) => {
              const userElement = document.createElement('p');
              userElement.textContent = user.name;
              searchResults.appendChild(userElement);
            });
          });
      } else {
        searchResults.innerHTML = ''; // Clear results if query length is less than 3
      }
    });
  });
}
