# -*- encoding: utf-8 -*-
# stub: swagger_ui_engine 1.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "swagger_ui_engine".freeze
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["zuzannast".freeze]
  s.date = "2018-07-17"
  s.description = "Mount Swagger UI web console as Rails engine, configure it as you want and write your API documentation in simple YAML files.".freeze
  s.email = ["zuzannast@gmail.com".freeze]
  s.homepage = "https://github.com/zuzannast/swagger_ui_engine".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.3".freeze
  s.summary = "Mountable Rails engine that serves Swagger UI for your API documentation written in YAML files.".freeze

  s.installed_by_version = "3.3.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_runtime_dependency(%q<sass-rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.2"])
    s.add_dependency(%q<sass-rails>.freeze, [">= 0"])
  end
end
