lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uk_mortgage_calculator/version'

Gem::Specification.new do |s|
  s.author  = %q{Kevin Jacoby}
  s.email   = %q{kevinf.jacoby@gmail.com}
  s.name    = %q{the_uk_mortgage_calculator}
  s.version = UKMortgageCalculator::VERSION
  s.date    = %q{2019-08-25}

  s.summary = %q{Allow you to calculate mortgage payment. Also accept overpayment and degressive overpayment}

  s.files   = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  s.require_paths = ["lib"]
end
