import { Controller } from '@hotwired/stimulus'
import axios from 'axios';

export default class extends Controller {
  HEADERS = { 'ACCEPT': 'application/json' };

  favorite() {
    if (this.element.dataset.userLoggedIn === 'false') {
      return document.querySelector('[data-header-target="userAuthLink"]').click();
    }

    if (this.element.dataset.favorited === 'true') {
      this.unfavoriteTutor();
    } else {
      this.favoriteTutor();
    }
  }

  getFavoritePath() {
    return '/api/favorites';
  }

  getUnfavoritePath(favoriteId) {
    return `/api/favorites/${favoriteId}`
  }

  favoriteTutor(e) {
    e.preventDefault();
    axios.post(this.getFavoritePath(), {
      user_id: this.element.dataset.userId,
      tutor_id: this.element.dataset.tutorId
    }, {
      headers: this.HEADERS
    })
    .then((response) => {
      this.element.dataset.favorited = 'true'
      this.element.dataset.favoriteId = response.data.id;
      this.element.setAttribute('fill', this.element.dataset.favoritedColor);
    });
  }

  unfavoriteTutor() {
    e.preventDefault();
    axios.delete(this.getUnfavoritePath(this.element.dataset.favoriteId), {
      headers: this.HEADERS
    }).then((response) => {
      this.element.dataset.favorited = 'false'
      this.element.dataset.favoriteId = '';
      this.element.setAttribute('fill', this.element.dataset.unfavoritedColor);
    });
  }
}
