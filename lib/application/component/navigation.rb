class Application
  module Component
    class Navigation
      include Application::Component

      def render
        header(properties, children)
      end

      private def children
        [
          h1(store["metadata"]["brand"])
        ]
      end
    end
  end
end
