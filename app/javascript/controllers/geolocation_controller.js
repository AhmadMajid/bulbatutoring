import { Controller } from '@hotwired/stimulus'
import { getDistance, convertDistance } from 'geolib';
import { isEmpty } from 'lodash-es';

export default class extends Controller {
  static targets = ['tutor'];

  connect() {
    if (isEmpty(this.element.dataset.latitude) && isEmpty(this.element.dataset.longitude)) {
      window.navigator.geolocation.getCurrentPosition((position) => {
        this.element.dataset.latitude = position.coords.latitude;
        this.element.dataset.longitude = position.coords.longitude;

        this.tutorTargets.forEach((tutorTarget) => {
          let distanceFrom = getDistance(
            { latitude: position.coords.latitude, longitude: position.coords.longitude },
            { latitude: tutorTarget.dataset.latitude, longitude: tutorTarget.dataset.longitude },
          );

          tutorTarget.querySelector('[data-distance-away]').innerHTML = `${Math.round(convertDistance(distanceFrom, 'km'))} kilometers away`;
        });
      });
    } else {
      this.tutorTargets.forEach((tutorTarget) => {
        let distanceFrom = getDistance(
          { latitude: this.element.dataset.latitude, longitude: this.element.dataset.longitude },
          { latitude: tutorTarget.dataset.latitude, longitude: tutorTarget.dataset.longitude },
        );

        tutorTarget.querySelector('[data-distance-away]').innerHTML = `${Math.round(convertDistance(distanceFrom, 'km'))} kilometers away`;
      });
    }
  }
}
