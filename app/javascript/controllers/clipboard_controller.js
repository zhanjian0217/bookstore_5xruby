import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy(e) {
    const code = (e.target.closest(".couponTr").querySelector(".discountCode").textContent);
    
    navigator.clipboard.writeText(code)
  }
}