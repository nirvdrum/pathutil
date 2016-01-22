# ----------------------------------------------------------------------------
# Frozen-string-literal: true
# Copyright: 2015-2016 Jordon Bedwell - MIT License
# Encoding: utf-8
# ----------------------------------------------------------------------------

require "bundler/setup"
require "safe_yaml/load"
require "benchmark/ips"
require "pathutil"

data = "hello: world\nworld: hello"
Benchmark.ips :quiet => true do |x|
  x.json! "benchmark.json"
  x.report("B:Pathutil.parse_yaml") { Pathutil.parse_yaml(data) }
  x.report("A:SafeYAML.load") { SafeYAML.load(data) }
  x.compare!
end