// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"


const button = document.querySelector('#btn');

button.addEventListener('click', (e) => {
  e.target.classList.add('disabled');
  e.target.classList.add('btn-gradient2');
  e.target.classList.remove('btn-gradient');
  e.target.innerText = 'Validated by the director';
});
