import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "source" ]
  copy(e) {
    const code = (e.target.closest(".couponTr").querySelector(".discountCode").textContent);
    e.target.closest(".couponTr").querySelector(".message").textContent = "複製成功！" 
    navigator.clipboard.writeText(code);
  }
}