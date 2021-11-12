import { Controller } from 'stimulus'

export default class extends Controller {
  connect() {
    console.log(this.element);
    this.element.scrollTo(0, this.element.scrollHeight);
  }
}
