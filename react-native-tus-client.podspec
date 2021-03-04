require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.license      = { :type => 'MIT' }
  s.homepage     = package['homepage']
  s.authors      = package['contributors'].flat_map { |author| { author['name'] => author['email'] } }
  s.summary      = package['description']
  s.source       = { :git => package['repository']['url'] }
  s.source_files = 'ios/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '8.0'
  s.dependency 'React'
  s.dependency 'TUSKit', '~>1.3.12'
end

  