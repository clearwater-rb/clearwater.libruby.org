require 'pp'
class Application
  module Component
    include Clearwater::Component

    ID = nil
    CLASSES = nil
    STYLE = {}
    DATA = {}
    ARIA = {}
    KEYS = ["id", "style", "classes", "data", "aria"]

    def properties
      keys.inject({}) do |structure, key|
        # Dynamically hashify all the keys and their method values
        structure.merge(key => send(key))
      end.delete_if do |_, value|
        # Chuck away keys with no value
        value.nil?
      end.inject({}) do |structure, (key, value)|
        # Turn the values into DOM ready values
        structure.merge(key => property_serialize(key, value))
      end
    end
    private :properties

    private def children
      []
    end

    private def keys
      @keys || self.class.const_get("KEYS")
    end

    private def id
      @id || self.class.const_get("ID")
    end

    private def classes
      @classes || self.class.const_get("CLASSES")
    end

    private def style
      @style || self.class.const_get("STYLE")
    end

    private def data
      @data || self.class.const_get("DATA")
    end

    private def aria
      @aria || self.class.const_get("ARIA")
    end

    private def property_serialize(key, value)
      case key
        when "id" then value
        when "classes" then value.join(", ")
        else value
      end
    end

    private def store
      Application::STORE
    end

    require_relative "component/account"
    require_relative "component/accounts"
    require_relative "component/article"
    require_relative "component/articles"
    require_relative "component/comment"
    require_relative "component/comments"
    require_relative "component/content"
    require_relative "component/landing"
    require_relative "component/navigation"
  end
end
