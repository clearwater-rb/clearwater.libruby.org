class Application
  module Component
    class Articles
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
