# This is Git's per-user configuration file.
d::Spec.new do |s|
  s.name         = "HTimer"
  s.version      = "1.0.0"
  s.summary      = "解决定时器循环引用的问题；使用block回调"
  s.homepage     = "https://github.com/vivihu/HTimer"
  s.license      = "MIT"
  s.authors = { '胡伟伟' => 'huweiwei1991@gmail.com' }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/vivihu/HTimer.git", :tag => s.version }
  s.source_files = 'HTimer/**/*.{h,m}'
  s.requires_arc = true
end

