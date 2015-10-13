require "opal"
require "clearwater"

class Application
  attr_accessor :store
  attr_accessor :router
  attr_accessor :component
  attr_accessor :manager
  attr_accessor :after
  attr_accessor :root

  def initialize(&configuration)
    instance_exec(self, &configuration)
    manager.new(component: component.new, router: router.new, element: root).call(&after)
  end

  require_relative "application/store"
  require_relative "application/router"
  require_relative "application/component"
  require_relative "application/manager"
end

$document.ready do
  Application.new do |let|
    let.root = $document.body
    let.store = Application::STORE
    let.router = Application::Router
    let.component = Application::Component::Content
    let.manager = Application::Manager
    let.after = -> do
      store["events"]["render"]["after"].each do |signal|
        $document.trigger(*signal.map(&:to_n))
      end.clear
    end
  end
end
