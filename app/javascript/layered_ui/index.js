import { application } from "controllers/application"
import ThemeController from "layered_ui/controllers/theme_controller"
import MobileMenuController from "layered_ui/controllers/mobile_menu_controller"

application.register("theme", ThemeController)
application.register("mobile-menu", MobileMenuController)
