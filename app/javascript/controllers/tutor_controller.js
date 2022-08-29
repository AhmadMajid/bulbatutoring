import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  readDescription(e) {
    e.preventDefault();

    document.getElementById('tutor-description-trigger').click();
  }
}
