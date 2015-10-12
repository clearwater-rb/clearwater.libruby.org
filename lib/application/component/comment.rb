class Application
  module Component
    class Comment
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
