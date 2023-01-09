# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "no-style-please"
  spec.version       = "0.4.8"
  spec.authors       = ["Zibo Wang"]
  spec.email         = ["zibo.w"]

  spec.summary       = "A (nearly) no-CSS, fast, minimalist Jekyll theme."
  spec.homepage      = "https://github.com/zibo-wang/no-style-please"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2.2"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.15.1"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.7.1"
  spec.add_runtime_dependency "kramdown", "~> 2.4.0"
  spec.add_runtime_dependency "rouge", "~> 3.30.0"

end
