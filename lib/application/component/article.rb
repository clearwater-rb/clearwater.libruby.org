class Application
  module Component
    class Article
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
