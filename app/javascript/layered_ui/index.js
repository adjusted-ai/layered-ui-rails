import { application } from "controllers/application"
import ThemeController from "layered_ui/controllers/theme_controller"
import MobileMenuController from "layered_ui/controllers/mobile_menu_controller"
import TeamSwitcherController from "layered_ui/controllers/team_switcher_controller"

application.register("theme", ThemeController)
application.register("mobile-menu", MobileMenuController)
application.register("team-switcher", TeamSwitcherController)
