# Tweak app layout to use HAML
layout = <<-LAYOUT.gsub(/^ {2}/, '')
  !!!
  %html
    %head
      %title #{app_name.humanize}
      = stylesheet_link_tag :all
      = javascript_include_tag :defaults
      = csrf_meta_tag
    %body
      = yield
LAYOUT

remove_file "app/views/layouts/application.html.erb"
create_file "app/views/layouts/application.html.haml", layout
