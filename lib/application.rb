require "opal"
require "clearwater"

class Application
  attr_accessor :store
  attr_accessor :router
  attr_accessor :component
  attr_accessor :manager
  attr_accessor :after

  def initialize(root:, &configuration)
    # instance_exec(self, &configuration)
    self.store = Application::STORE
    self.router = Application::Router
    self.component = Application::Component::Content
    self.manager = Application::Manager
    self.after = -> do
      store["events"]["render"]["after"].each do |signal|
        $document.trigger(*signal.map(&:to_n))
      end
      store["events"]["render"]["after"] = []
    end
    manager.new(component: component.new, router: router.new, element: root).call(&after)
  end

  require_relative "application/store"
  require_relative "application/router"
  require_relative "application/component"
  require_relative "application/manager"
end

$document.ready do
  Application.new(root: $document.body)
  # do |let|
  #   let.store = Application::STORE
  #   let.router = Application::Router
  #   let.component = Application::Component::Root
  #   let.manager = Application::Manager
  #   let.after = -> do
  #     store["events"]["render"]["after"].each do |signal|
  #       $document.trigger(*signal.map(&:to_n))
  #     end
  #     store["events"]["render"]["after"] = []
  #   end
  # end
end
