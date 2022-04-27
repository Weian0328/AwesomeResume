import { Controller } from "stimulus"
import dropin from "braintree-web-drop-in"

export default class extends Controller {
  connect() {
    const token = this.element.dataset.token

    dropin
      .create({
        authorization: token,
        container: this.element,
      })
      .then((dropinInstance) => {
        console.log("ok!")
      })
      .catch((error) => {
        console.log(err)
      })
  }
}
