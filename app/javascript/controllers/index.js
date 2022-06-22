import { Application } from '@hotwired/stimulus'
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";
import Notification from 'stimulus-notification'

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.register('notification', Notification)
application.load(definitionsFromContext(context))
