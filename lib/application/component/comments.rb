class Application
  module Component
    class Comments
      include Application::Component

      def render
        div(properties, children)
      end
    end
  end
end
