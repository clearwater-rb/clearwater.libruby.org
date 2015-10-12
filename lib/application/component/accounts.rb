class Application
  module Component
    class Accounts
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
