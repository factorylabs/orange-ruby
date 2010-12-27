When /I set the command timeout to (\d+) seconds/ do |seconds|
  @aruba_timeout_seconds = seconds.to_i
end