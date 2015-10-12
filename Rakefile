#!/usr/bin/env rake
require "pry"
require "opal"
require "clearwater"
require "rspec/core/rake_task"

desc "Run all the tests in spec"
RSpec::Core::RakeTask.new(:spec)

desc "Transpile source"
task :build do
  Opal::Processor.source_map_enabled = true
  Opal.append_path("lib")
  source = Opal::Builder.build("application")
  File.write(File.join("transpile", "application.js"), source.to_s)
  File.write(File.join("transpile", "application.js.map"), source.source_map)
end

desc "Default: run tests"
task default: :spec
