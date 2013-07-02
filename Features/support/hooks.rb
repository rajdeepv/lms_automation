Before do
  @plms ||= Plms.new
end

After do
  @plms.close
end