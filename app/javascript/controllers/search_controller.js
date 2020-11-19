// import { Controller } from 'stimulus';export default class extends Controller {
//   connect() {
//     console.log("hello from stimulus")
//   }


// }
// import Rails form "@rails/ujs"
// export default class extends Controller {
//  static targets = ["query", "users"] 

//  submit() {
//     const value = this.queryTarget.value
//     fetch(`/?query=${value}`, {
//       headers: { accept: 'application/json'}
//     }).then((response) => response.text())
//     .then(data => console.log(data))
//   }
// }

// submit() {
//     const value = this.queryTarget.value
//     Rails.ajax({
//       type: "GET",
//       url: `/?query=${value}&day=${day}`,
//       success: (_data, _status, xhr) => {
//         this.element.outerHTML = xhr.response
//       }
//     })
// }userTemplate(user) {
//     return `<div>
//     <h4>${user.name} <small>${user.age}</small></h4>
//     <p>${user.subject}</p>
//     </div> `
// }