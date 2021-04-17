// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("./application.scss");
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import { focusErrorField } from "../scripts/focus_error_field"

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", () => {
  focusErrorField()
})
