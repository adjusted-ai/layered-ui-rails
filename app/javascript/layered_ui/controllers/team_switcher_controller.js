import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  switch(event) {
    const teamId = event.target.value

    if (teamId === 'manage') {
      window.location.href = '/teams'
      return
    }

    const form = document.createElement('form')
    form.method = 'POST'
    form.action = `/teams/${teamId}/switch`

    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    const csrfInput = document.createElement('input')
    csrfInput.type = 'hidden'
    csrfInput.name = 'authenticity_token'
    csrfInput.value = csrfToken

    form.appendChild(csrfInput)
    document.body.appendChild(form)
    form.submit()
  }
}
