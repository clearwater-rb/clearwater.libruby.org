class Application
  module Component
    class Account
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
