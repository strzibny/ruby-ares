Gem::Specification.new do |s|
  s.name     = "ruby-ares"
  s.version  = "0.0.2"
  s.platform = Gem::Platform::RUBY
  s.summary     = "Gem for accesing business information from ARES database."
  s.description = <<-EOF
                    ARES is the Czech business database maintained by Ministry of Finance of the Czech Republic.
                    This gem helps to retrieve data provided by this database.
                  EOF
  s.licenses = ["GPLv3"]
  s.author   = "Josef Strzibny"
  s.email    = "strzibny@strzibny.name"
  s.homepage = "http://github.com/strzibny/ares"
  s.required_ruby_version     = ">= 1.9"
  s.required_rubygems_version = ">= 1.8.0"
  s.files = Dir["README.md", "Rakefile",
                      "lib/**/*.rb", "test/**/test*.rb"]

	s.add_runtime_dependency 'nokogiri'
end
