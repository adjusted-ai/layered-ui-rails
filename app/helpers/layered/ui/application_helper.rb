module Layered
  module Ui
    module ApplicationHelper
      # Helper to check if the assistant should be shown
      # Host app can override this method or provide current_conversation
      def show_assistant?
        respond_to?(:current_conversation) && current_conversation.present?
      end
    end
  end
end
