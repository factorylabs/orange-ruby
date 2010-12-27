When /I set the command timeout to (\d+) seconds/ do |seconds|
  @aruba_timeout_seconds = seconds.to_i
end

When /I set a generous command timeout/ do
  When('I set the command timeout to 60 seconds')
end