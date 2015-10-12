class Application
  module Component
    class Content
      include Application::Component

      ID = "content"
      CLASSES = [
        "container"
      ]
      STYLE = {
        "display" => "flex",
        "-webkit-flex-flow" => "row wrap",
        "justify-content" => "space-around"
      }

      def render
        main(properties, children)
      end

      private def children
        [navigation, resource]
      end

      private def navigation
        Component::Navigation.new
      end

      private def resource
        case nil
          when "/accounts" then Component::Accounts.new
          when "/account" then Component::Account.new
          when "/articles" then Component::Articles.new
          when "/article" then Component::Article.new
          when "/comments" then Component::Comments.new
          when "/comment" then Component::Comment.new
          else Component::Landing.new
        end
      end

    end
  end
end
