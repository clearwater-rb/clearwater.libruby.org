class Application
  module Component
    class Landing
      include Application::Component

      def render
        div(properties, "Hello!")
      end
    end
  end
end
